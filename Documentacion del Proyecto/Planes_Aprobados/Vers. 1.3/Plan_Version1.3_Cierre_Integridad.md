# Plan de Implementación: Versión 1.3 — "Cierre de Integridad" 🔧

**Prioridad:** 🔴 MÁXIMA — Bloqueante para lanzamiento  
**Origen:** Auditoría del código real del `.rbxl` (`ArenaVortice_Auditoria_Codigo_Real_v2.md`)  
**Estimación:** 1-2 sesiones de trabajo

---

## Contexto

La auditoría del código real del juego (no de la documentación) reveló que varias features marcadas como "completadas al 100%" en versiones anteriores **no funcionan correctamente en el código**. Esta versión se dedica exclusivamente a cerrar esa brecha de integridad antes de construir features nuevas.

---

## Tareas

### 🔴 Tarea 1 — Integrar Recompensas en `finPartida()` (Bug 2.1)

**Script:** `ServerScriptService.GameManager`  
**Problema:** La función `finPartida()` anuncia al ganador y resetea el marcador, pero **nunca llama** a `DataManager.SumarRecompensas()` ni a `DataManager.ActualizarRankPoints()`. Los jugadores nunca ganan XP, Monedas ni Rank Points.

**Implementación:**
- Dentro de `finPartida(ganador)`, recorrer `Players:GetPlayers()`
- Determinar si cada jugador estaba en el equipo ganador o perdedor
- Llamar `_G.DataManager.SumarRecompensas(jugador, xp, monedas)`:
  - **Victoria:** 50 XP + 10 Monedas
  - **Derrota:** 25 XP + 5 Monedas
- Llamar `_G.DataManager.ActualizarRankPoints(jugador, cambioRP)`:
  - **Victoria:** +25 RP
  - **Derrota:** -15 RP
- Llamar `_G.Analytics.RegistrarFinPartida(ganador, duracion)` si existe
- Envolver cada llamada en `if _G.DataManager then ... end` por seguridad de orden de carga

---

### 🔴 Tarea 2 — Agregar Funciones Faltantes a `DataStoreManager` (Bug 2.2)

**Script:** `ServerScriptService.DataStoreManager`  
**Problema:** `TiendaManager` llama a `ComprarSkin()` y `EquiparSkin()`, y `MonetizacionManager` llama a `SumarGemas()`. **Ninguna de estas funciones existe** en `DataStoreManager`. La monetización con Robux reales está rota.

**Implementación — agregar estas 3 funciones:**

```lua
function DataManager.SumarGemas(player, cantidad)
    local data = playerData[player.UserId]
    if not data then return false end
    data.Gemas = data.Gemas + cantidad
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
        if s == skinName then tiene = true; break end
    end
    if not tiene then return false, "No tenés esta skin." end
    data.SkinEquipada = skinName
    return true, "Skin equipada."
end
```

---

### 🟡 Tarea 3 — Completar Morph de Pyra en `GestorClases` (Bug 2.3)

**Script:** `ServerScriptService.GestorClases`  
**Problema:** `GestorClases` tiene bloques `if/elseif` para Grom, Yssa y Kael, pero **no tiene bloque para Pyra**. Al elegirla, el personaje usa apariencia y stats por defecto.

**Implementación:**
- Agregar bloque `elseif clase == "Pyra" then` en la función `aplicarMorph`
- **Stats:** Vida intermedia entre Yssa y Kael (~90 HP), velocidad moderada (~18)
- **Visual:** Color de cuerpo naranja/rojo, material Neon, aura de partículas de fuego
- Verificar que `GestorClases` lea `data.SkinEquipada` (nueva función de Tarea 2)

---

### 🟠 Tarea 4 — Validación Anti-Exploit Server-Side (Bug 2.4)

**Script:** `ServerScriptService.ServidorCombate`  
**Problema:** El cooldown de ataques es solo client-side. Un exploiter puede disparar el RemoteEvent sin límite.

**Implementación:**
- Crear tabla `ultimoAtaque = {}` indexada por `UserId`
- En `procesarMelee`: verificar `os.clock() - (ultimoAtaque[userId] or 0) >= 0.5`
- En `procesarDistancia`: verificar `os.clock() - (ultimoAtaque[userId] or 0) >= 0.8`
- Solo procesar el ataque si pasó suficiente tiempo; actualizar `ultimoAtaque[userId] = os.clock()`
- Normalizar vector `direccion` recibido del cliente: `direccion = direccion.Unit`

---

### 🟢 Tarea 5 — Preparar Developer Products (Bug 2.5)

**Script:** `ServerScriptService.MonetizacionManager`  
**Problema:** IDs de producto son mock (`111111111`, `222222222`, `333333333`).

**Implementación:**
- Agregar comentario claro `-- ⚠️ REEMPLAZAR CON IDS REALES DEL CREATOR DASHBOARD` en cada ID
- Documentar el paso para el usuario en el walkthrough
- **Nota:** Esta tarea NO puede completarse al 100% sin acción manual del usuario en el Creator Dashboard de Roblox

---

### 🟢 Tarea 6 — Actualizar Documentación de Estado

- Actualizar `Doc_inicial/ArenaVortice_Auditoria_y_Roadmap.md` para reflejar que v1.1 y v1.2 tienen bugs pendientes
- Al finalizar todas las tareas: generar `Walkthrough_Version1.3.md`, `Changelog.md`, `Estado_Proyecto.md`

---

## Verificación

1. **Play Test en Studio (F5):**
   - Ganar una partida → verificar que XP y Monedas se suman
   - Perder una partida → verificar que XP y Monedas se suman (menor cantidad)
   - Verificar que Rank Points suben/bajan según resultado
2. **Consola de Roblox Studio:**
   - Verificar que no hay errores `nil` al llamar funciones de `DataStoreManager`
   - Verificar que `ProcessReceipt` no crashea (aunque con Mock IDs)
3. **Seleccionar Pyra:**
   - Verificar que tiene color, stats y partículas propias
4. **Anti-exploit:**
   - Verificar que ataques rápidos consecutivos son rechazados por el servidor

---

## Orden de Ejecución Recomendado

```
Tarea 2 (DataStoreManager) → Tarea 1 (GameManager) → Tarea 3 (GestorClases) → Tarea 4 (ServidorCombate) → Tarea 5 (MonetizacionManager) → Tarea 6 (Docs)
```

> Se empieza por DataStoreManager porque GameManager depende de que esas funciones existan.
