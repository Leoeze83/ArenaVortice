# Arena Vórtice — Auditoría del Código Real (extraído del .rbxl) + Roadmap

**Fecha:** 24 de julio de 2026
**Fuente:** clon público de `github.com/Leoeze83/ArenaVortice`, commit más reciente (2026-07-24), analizando directamente el binario `ArenaVortice.rbxl` — no la documentación.

---

## 0. Cómo hice este análisis (para que confíes en los hallazgos)

Esta vez pude clonar tu repo público y extraer los **20 scripts reales** (10 `Script` de servidor + 10 `LocalScript` de cliente) desde adentro del binario `.rbxl`, decodificando sus chunks comprimidos LZ4 y leyendo el código Luau tal cual está guardado. Es decir: lo que sigue **no es una lectura de tus documentos `Estado_Proyecto.md`/`Changelog.md`, es una lectura del código que realmente corre en tu juego.**

Y el resultado confirma un patrón que ya habíamos visto una vez: la documentación de las versiones 1.1 y 1.2 dice "COMPLETADA AL 100%", pero el código real tiene bugs que rompen exactamente las features que esos documentos dan por cerradas. No es un juicio sobre tu proceso — es información necesaria para saber qué arreglar antes de invertir en la v1.3.

---

## 1. Lo que SÍ está bien y funciona de verdad (buenas noticias primero)

- Las 4 súper habilidades están implementadas y son fieles al GDD: **Grom** (empuje+stun en área), **Yssa** ("Tormenta Embotellada", zona de daño por tick), **Kael** ("Golpe Fantasma", invisibilidad + daño x2 en el próximo golpe), y **Pyra** ("Infierno Vorticista", anillo de fuego de área) — las cuatro con lógica de daño, VFX y sonido diferenciados.
- El **loop de combate core** (melee, proyectil, fuego amigo, feedback visual) es sólido y está bien escrito.
- El **modo Control de Núcleo** (aparición aleatoria, disputa, captura por proximidad 2D, muerte súbita) está completo y bien implementado.
- El **mínimo de jugadores para iniciar partida SÍ está resuelto correctamente** — a diferencia de lo que vimos la vez anterior, `LobbyManager.lua` tiene una bandera `MODO_DEV = true` que hoy permite jugar solo, y una constante `JUGADORES_MINIMOS = 2` ya lista para producción. Antes de publicar, solo hay que cambiar `MODO_DEV` a `false`. Buen trabajo en esa parte.
- El guardado en `DataStoreService` (con `pcall`, claves por `UserId`, retrocompatibilidad de esquema viejo) está bien planteado a nivel de estructura.

---

## 2. Bugs reales y verificados en el código (los que importan de verdad)

### 🔴 2.1 — CRÍTICO: la partida nunca reparte XP, Monedas, ni Puntos de Rango

`DataStoreManager.lua` define perfectamente `DataManager.SumarRecompensas(player, xp, monedas)` y `DataManager.ActualizarRankPoints(player, cambioRP)`. Pero busqué en **los 20 scripts** quién llama a esas dos funciones al terminar una partida, y la respuesta es: **nadie.** `GameManager.lua`, en su función `finPartida()`, solo anuncia el ganador, mata a todos los personajes y resetea el marcador — nunca toca `DataManager`.

**Consecuencia real:** ahora mismo, en tu juego publicado, un jugador puede ganar 100 partidas seguidas y su XP, sus Monedas y su Rango Point van a seguir en cero. Todo el sistema de progresión y el modo Ranked que la documentación de v1.2 da por completado **no le está pasando nada a nadie.**

**Por qué pasó:** `DataStoreManager` es un `Script` normal (no un `ModuleScript`), así que para que otro script lo use, se apoya en la variable global `_G.DataManager`. Ese patrón (`_G`) es exactamente el tipo de atajo que Roblox y la comunidad de creadores desaconsejan, porque no hay ninguna verificación de que la función que llamás realmente exista del otro lado — y así fue como se coló este bug.

**Fix (pedíselo a Antigravity tal cual):**
> "En `GameManager.lua`, dentro de la función `finPartida(ganador)`, después de anunciar el ganador y antes de matar a los personajes, recorré `Players:GetPlayers()` y para cada jugador determiná si estaba en el equipo ganador o perdedor. Llamá a `_G.DataManager.SumarRecompensas(jugador, xp, monedas)` con 50 XP/10 Monedas si ganó y 25 XP/5 Monedas si perdió, `_G.DataManager.ActualizarRankPoints(jugador, 25)` si ganó o `(jugador, -15)` si perdió, y `_G.Analytics.RegistrarFinPartida(ganador, TIEMPO_PARTIDA - tiempoRestante)`. Envolvé cada llamada en `if _G.DataManager then ... end` por seguridad de orden de carga."

### 🔴 2.2 — CRÍTICO: la tienda de Skins y la compra de Gemas con Robux reales están rotas

- `TiendaManager.lua` llama a `_G.DataManager.ComprarSkin(...)` y `_G.DataManager.EquiparSkin(...)`.
- `MonetizacionManager.lua` (el que procesa pagos reales vía `MarketplaceService.ProcessReceipt`) llama a `_G.DataManager.SumarGemas(...)`.
- **Ninguna de esas tres funciones existe** en `DataStoreManager.lua`. Solo están definidas `SumarRecompensas`, `ActualizarRankPoints`, `GetPlayerData` y `ComprarPersonaje`.

**Esto es lo más grave de toda la auditoría**, porque toca dinero real: si publicás el juego así y alguien compra Gemas con Robux de verdad, el servidor va a intentar llamar una función que no existe, va a tirar error, y en el mejor caso el jugador no recibe sus Gemas (con el riesgo de reclamos y baja reputación); en el peor caso, según cómo maneje Roblox el error de `ProcessReceipt`, la compra puede quedar en un estado ambiguo. Roblox es muy estricto con esto — un `ProcessReceipt` que falla sistemáticamente puede generar reportes de jugadores y revisión de tu cuenta de desarrollador.

**No publiques con las Gemas activadas hasta arreglar esto.**

**Fix:** agregar a `DataStoreManager.lua` las tres funciones que faltan, siguiendo el mismo patrón que `ComprarPersonaje`:

```lua
function DataManager.SumarGemas(player, cantidad)
    local data = playerData[player.UserId]
    if not data then return false end
    data.Gemas = data.Gemas + cantidad
    -- Si tenés un IntValue de Gemas en el HUD/leaderstats, actualizalo acá también
    return true
end

function DataManager.ComprarSkin(player, skinName, costoGemas)
    local data = playerData[player.UserId]
    if not data then return false, "Error de datos." end
    for _, s in pairs(data.Skins) do
        if s == skinName then return false, "Ya tenés esta skin." end
    end
    if data.Gemas >= costoGemas then
        data.Gemas = data.Gemas - costoGemas
        table.insert(data.Skins, skinName)
        return true, "Skin comprada."
    end
    return false, "No tenés suficientes Gemas."
end

function DataManager.EquiparSkin(player, skinName)
    local data = playerData[player.UserId]
    if not data then return false, "Error de datos." end
    local tiene = false
    for _, s in pairs(data.Skins) do
        if s == skinName then tiene = true break end
    end
    if not tiene then return false, "No tenés esta skin." end
    data.SkinEquipada = skinName
    return true, "Skin equipada."
end
```

Ajustá nombres de campos si tu esquema de datos usa otros; lo importante es que existan y que `GestorClases.lua` lea `data.SkinEquipada` al aplicar el morph.

### 🟡 2.3 — Pyra no tiene identidad visual ni estadísticas propias

`GestorClases.lua` (el que aplica el "morph" — color, vida, velocidad) tiene bloques `if/elseif` para "Grom", "Yssa" y "Kael", pero **no hay ningún bloque para "Pyra"**. El combate de Pyra (proyectiles de fuego, súper "Infierno Vorticista") funciona perfectamente en `ServidorCombate.lua`, pero al elegirla, el personaje se queda con la apariencia y stats por defecto de Roblox — nada de fuego, nada de vida/velocidad diferenciada. Esto contradice lo que dice `Walkthrough`/`Changelog` de v1.1 ("Morph visual con aura de llamas... material neón naranja").

**Fix:** agregar el bloque faltante en `aplicarMorph`, con vida/velocidad intermedias entre Yssa y Kael (Pyra es una maga de daño con algo de movilidad, según su rol) y aura de partículas de fuego, en línea con el resto del patrón ya usado para las otras tres clases.

### 🟠 2.4 — Sin validación de cooldown en el servidor (exploit de daño)

En `ControlesCombate.lua` (cliente) hay un cooldown de 0.5s (melee) y 0.8s (distancia) — pero es **puramente client-side**. En `ServidorCombate.lua`, el evento `peticionAtaque.OnServerEvent` procesa cualquier pedido de ataque sin verificar cuándo fue el último ataque de ese jugador. Un cliente modificado (exploit, muy común y fácil de conseguir en Roblox) puede disparar el RemoteEvent decenas de veces por segundo e ignorar el cooldown, multiplicando su daño por segundo muy por encima de lo balanceado. Este es uno de los vectores de exploit más comunes y más buscados en juegos competitivos de Roblox.

**Fix (prompt para Antigravity):**
> "En `ServidorCombate.lua`, agregá una tabla `ultimoAtaque = {}` indexada por `UserId`. Al inicio de `procesarMelee` y `procesarDistancia`, verificá `os.clock() - (ultimoAtaque[jugador.UserId] or 0)` contra el cooldown correspondiente (0.5s melee, 0.8s distancia) y salí de la función si no pasó suficiente tiempo. Actualizá `ultimoAtaque[jugador.UserId] = os.clock()` solo cuando el ataque se procese de verdad."

También conviene normalizar el vector `direccion` recibido del cliente (`direccion.Unit`) antes de usarlo en los cálculos de ángulo del cono de melee, para que un vector manipulado no distorsione la detección de golpe.

### 🟢 2.5 — Mock IDs de Developer Products (bug que ya conocías, sigue sin resolver)

`MonetizacionManager.lua` sigue usando `111111111`, `222222222`, `333333333` como IDs de producto — comentados como "Reemplazar con ID real". Esto ya lo señalamos la vez pasada; sigue pendiente dos versiones después. Resolvelo junto con el punto 2.2 (no tiene sentido arreglar `SumarGemas` sin también cargar los IDs reales).

### 🟢 2.6 — El 2º mapa y el Pase de Temporada son solo decoración, no sistemas activos

- `Workspace.LasMinasDeCristal` existe como carpeta con al menos una parte ("Plataforma"), pero **`GameManager.lua` nunca la referencia** — el único mapa que usa el flujo de partida real es `Workspace.ElCraterSagrado`. No hay ningún sistema de selección o rotación de mapa.
- `SeasonPassHUD` existe como `ScreenGui`, pero los 3 `LocalScript`s asociados que encontré **solo abren y cierran la ventana** — no hay lógica de niveles, reclamo de recompensas, ni conexión con `SeasonPassXP` (que sí existe como campo de datos en `DataStoreManager`, pero nadie lo lee para mostrar progreso).

Esto no es un "bug" en el sentido estricto — es contenido a medio construir presentado como terminado. Priorizalo según tu roadmap real, pero no seria honesto decir que la v1.2 está "empaquetada al 100%" con esto así.

---

## 3. Por qué te recomiendo cambiar de patrón: dejar de usar `_G`

La raíz de los bugs 2.1 y 2.2 es la misma: comunicación entre scripts vía `_G`, sin ningún tipo de verificación. La forma estándar y recomendada por Roblox para esto es usar `ModuleScript`s con `require()`. Te conviene migrar `DataStoreManager` y `AnalyticsManager` a `ModuleScript`s dentro de `ServerScriptService` (o una carpeta `Modules`), y que el resto de los scripts hagan `local DataManager = require(...)` en vez de `_G.DataManager`. Ventajas concretas para vos:
- Si llamás una función que no existe, Luau te lo va a marcar como error de análisis estático en Studio (con `--!strict` incluso antes de correr el juego), en vez de fallar en producción como pasó acá.
- Elimina la dependencia del orden de ejecución de scripts (con `_G`, si `DataStoreManager` tarda en cargar, cualquier script que lo use antes simplemente no lo encuentra).
- Es el patrón que vas a necesitar de todos modos apenas quieras que Antigravity (o vos) escriban tests o herramientas de scaffolding más serias.

No hace falta hacerlo de golpe — podés migrar `DataStoreManager` primero (es el más crítico, por ser el que toca dinero y progresión), y dejar el resto para cuando tengas margen.

---

## 4. Checklist de salida a producción (orden recomendado)

1. Arreglar 2.1 (recompensas nunca se otorgan) — es gratis, no depende de nada externo.
2. Arreglar 2.2 (agregar `SumarGemas`/`ComprarSkin`/`EquiparSkin`) — **bloqueante para cualquier monetización real.**
3. Reemplazar los Mock IDs (2.5) y crear los Developer Products reales en el Creator Dashboard.
4. Agregar cooldown server-side (2.4) — bloqueante para que el balance del juego sobreviva al primer exploiter.
5. Completar el morph de Pyra (2.3).
6. Cambiar `MODO_DEV = false` en `LobbyManager.lua`.
7. Recién ahí, considerar el 2º mapa y el Season Pass como features activas — o sacarlos de la UI/tienda hasta que tengan lógica real, para no vender algo que no funciona.

---

## 5. Roadmap actualizado (después de cerrar los bugs de arriba)

Esto reemplaza y ajusta el roadmap que armamos la vez pasada, ahora que sabemos el estado real:

### v1.2.1 — "Cierre de integridad" (1-2 semanas)
Únicamente los 6 puntos de la sección 2. Sin esto, cualquier feature nueva que agregues se apoya en una base que no reparte recompensas ni cobra bien — no tiene sentido construir arriba todavía.

### v1.3 — "Ranked y Season Pass de verdad" (3-4 semanas)
- Conectar el Season Pass real: barra de progreso con `SeasonPassXP`, reclamo de recompensas por nivel, distinción visual entre línea gratis y premium.
- Activar el 2º mapa con un sistema simple de rotación (aleatorio entre `ElCraterSagrado` y `LasMinasDeCristal` al iniciar cada partida).
- Mostrar el rango (Bronce a Leyenda) en la pantalla de selección de personaje y en resultados, no solo en el leaderboard nativo.

### v1.4 — "Pulido de excelencia" (mes 2)
- Completar identidad visual de Pyra (2.3) si no se hizo antes, más partículas ambiente en su súper.
- Hit-stop de 2-3 frames y screen shake diferenciado por súper habilidad (hoy el shake es genérico).
- Sonidos únicos de ataque básico para Pyra (verificar que no esté reusando el de Yssa).
- Anti-cheat básico adicional: límite de velocidad de movimiento server-side (WalkSpeed validation) para que un exploit de speedhack no rompa la captura del núcleo.

### v2.0 — "Escalar en el catálogo"
- Migración completa de `_G` a `ModuleScript`s (sección 3) como base técnica antes de sumar más contenido.
- 5º y 6º héroe, evaluando siempre el triángulo de roles para no romper el balance 3v3.
- Rewarded Video Ads como monetización no intrusiva adicional (compatible con tu política "no pay-to-win").

---

## 6. Próximo paso

Pegá la sección 2 completa (con los prompts y el código ya armado) como mensaje a Antigravity, empezando por el punto 2.1 y 2.2 — son los dos que hacen que el juego, tal como está hoy, no le esté dando a nadie lo que promete (ni progreso, ni lo que compran). Una vez cerrados esos, seguí con la checklist de la sección 4 en orden.
