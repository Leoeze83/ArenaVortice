# Arena Vórtice — Auditoría, Cierre de Fases 6-8, Cumplimiento Roblox y Roadmap

**Fecha del análisis:** 21 de julio de 2026
**Repositorio:** github.com/Leoeze83/ArenaVortice
**Base analizada:** GDD, Plan Estratégico, Changelog, Estado_Proyecto, Planes y Walkthroughs aprobados, AGENTS.md, Marketing Kit.

---

## 0.  *Hallazgo central de la auditoría:** tu `Estado_Proyecto.md` y `Changelog.md` dicen "VERSIÓN 1.0 ALCANZADA" con las Fases 6, 7 y 8 completadas al 100%. Pero leyendo los *Walkthroughs* (que son más detallados y honestos que el checklist resumen) encontré que **no es así** — tenías razón en pedirme que las termine. Esto es exactamente el tipo de riesgo que tu propio `AGENTS.md` advierte en la sección 9 ("No dependas únicamente de la IA") y en la sección 7 de gestión de errores: un checklist se marcó ✅ sin testing cruzado real. No es un reproche, es información útil: a partir de ahora conviene que el checklist solo se marque ✅ después de que vos lo probaste en Play, no cuando el agente termina de escribir el código.

---

## 1. Brechas reales encontradas (lo que falta para que Fases 6-8 estén de verdad completas)

| # | Brecha | Dónde lo dice la propia documentación | Severidad |
|---|---|---|---|
| 1 | **Yssa y Kael no tienen su Súper Habilidad implementada.** Solo Grom tiene "Onda Sísmica" funcional. | `Changelog.md`, Fase 3: *"Yssa y Kael — (Sistemas listos para implementar a futuro)"* | 🔴 Crítica — 2 de 3 personajes están incompletos en su mecánica central |
| 2 | **XP y monedas en pantalla de resultados sin terminar** en el momento en que se escribió el checklist de Fase 3 (luego resuelto parcialmente en Fase 6, pero conviene verificarlo). | `Estado_Proyecto.md`: *"[ ] XP y monedas ganadas (placeholder)"* sin tildar | 🟡 Media — probablemente resuelto en Fase 6, pero no re-confirmado |
| 3 | **El Lobby no exige el mínimo de jugadores por equipo.** Permite iniciar partida estando solo, "para facilitar pruebas". | `Walkthrough_Fase6_Progresion.md`: *"Por ahora permite iniciar estando tú solo... aunque internamente está programado para poder exigir 2 o más jugadores"* | 🔴 Crítica — sin esto, el modo 3v3 no es jugable en producción |
| 4 | **Developer Products de Gemas usan Mock IDs** (111111111, etc.), no IDs reales de Roblox. | `Walkthrough_Fase7_Monetizacion.md`: *"Recuerda que los botones de Gemas actualmente usan Mock IDs... deberás crear 3 Developer Products reales y reemplazar esos números"* | 🔴 Crítica — bloquea monetización real en producción |
| 5 | **No hay matchmaking real entre servidores**, solo un lobby manual dentro de un mismo servidor. Válido para MVP/beta, no para escala. | `Plan_Fase6_Progresion.md` lo describe como salas manuales, tal como preveía el Plan Estratégico | 🟢 Aceptable para v1.0, a mejorar en roadmap |
| 6 | **Sin verificación de estabilidad de servidor documentada** (Fase 8 — "Infinite yield", RemoteEvents huérfanos, fugas de memoria). El Changelog dice que se hizo, pero no hay evidencia de qué se encontró ni corrigió. | `Estado_Proyecto.md` marca ✅ sin detalle de qué se revisó | 🟡 Media — pedile a Antigravity el reporte de consola real |
| 7 | **Falta `PolicyService`** en el flujo de compras (requerido por Roblox desde 2026 para elegibilidad regional/edad en productos monetizables). | No mencionado en ningún documento | 🔴 Nuevo hallazgo — requisito de cumplimiento actual, ver sección 3 |

Antes de cualquier otra cosa, te recomiendo pedirle a Antigravity que **audite en vivo** estos 7 puntos contra el `.rbxl` real (no contra la documentación) y te confirme cuáles ya están resueltos. Los puntos 1, 3 y 4 son bloqueantes reales para lanzar; no deberías publicar el juego públicamente sin cerrarlos.

---

## 2. Cierre de fases pendientes — specs y código listo para Antigravity/Studio

### 2.1. Súper Habilidad de Yssa — "Tormenta Embotellada"

**Dónde:** `ServerScriptService`, junto al script que ya maneja la Súper de Grom (probablemente `CombateManager` o similar — pedile a Antigravity que te confirme el nombre exacto antes de crear uno nuevo).

**Diseño (según el GDD, sección 6.2):** lanza un frasco que crea una zona de rayos en área durante 3 segundos, dañando a quien esté adentro.

```lua
-- SuperYssa.lua (Módulo dentro de ServerScriptService)
-- Súper Habilidad de Yssa: "Tormenta Embotellada"
-- Crea una zona de daño en área que persiste 3 segundos.

local Debris = game:GetService("Debris")

local SuperYssa = {}

local DAÑO_POR_TICK = 8       -- daño cada 0.5s mientras el enemigo está dentro
local RADIO_ZONA = 10          -- studs de radio de la tormenta
local DURACION = 3              -- segundos que dura la zona
local INTERVALO_TICK = 0.5

function SuperYssa.Activar(jugador, posicionObjetivo, equipoDelJugador)
	-- Crea la parte visual/física de la zona de rayos
	local zona = Instance.new("Part")
	zona.Shape = Enum.PartType.Cylinder
	zona.Anchored = true
	zona.CanCollide = false
	zona.Material = Enum.Material.Neon
	zona.Color = Color3.fromRGB(80, 160, 255) -- azul eléctrico, según lore de Yssa
	zona.Size = Vector3.new(1, RADIO_ZONA * 2, RADIO_ZONA * 2)
	zona.CFrame = CFrame.new(posicionObjetivo) * CFrame.Angles(0, 0, math.rad(90))
	zona.Transparency = 0.4
	zona.Parent = workspace

	-- Sonido de la habilidad (referencia a asset de audio, reemplazar ID)
	local sonido = Instance.new("Sound")
	sonido.SoundId = "rbxassetid://0000000000" -- reemplazar por asset real de Toolbox
	sonido.Parent = zona
	sonido:Play()

	local tiempoTranscurrido = 0
	local conexion
	conexion = game:GetService("RunService").Heartbeat:Connect(function(dt)
		tiempoTranscurrido += dt
		if tiempoTranscurrido >= DURACION then
			conexion:Disconnect()
			return
		end
	end)

	-- Aplica daño por tick a todos los enemigos dentro del radio
	local ticks = math.floor(DURACION / INTERVALO_TICK)
	for i = 1, ticks do
		task.delay(i * INTERVALO_TICK, function()
			for _, jugadorObjetivo in ipairs(game.Players:GetPlayers()) do
				local personaje = jugadorObjetivo.Character
				if personaje and personaje:FindFirstChild("HumanoidRootPart") then
					local distancia = (personaje.HumanoidRootPart.Position - posicionObjetivo).Magnitude
					local esEnemigo = jugadorObjetivo.Team ~= equipoDelJugador
					if distancia <= RADIO_ZONA and esEnemigo then
						local humanoid = personaje:FindFirstChild("Humanoid")
						if humanoid and humanoid.Health > 0 then
							humanoid:TakeDamage(DAÑO_POR_TICK)
						end
					end
				end
			end
		end)
	end

	Debris:AddItem(zona, DURACION)
end

return SuperYssa
```

Pedile a Antigravity que la conecte al mismo `RemoteEvent` y al mismo sistema de carga de barra de Súper que ya usa Grom (25% por golpe acertado), y que el input de activación sea coherente con el resto (tecla o botón de Súper ya existente en el HUD).

### 2.2. Súper Habilidad de Kael — "Golpe Fantasma"

**Diseño (GDD, sección 6.3):** se vuelve invisible 1.5 segundos y su próximo golpe hace daño extra.

```lua
-- SuperKael.lua (Módulo dentro de ServerScriptService)
-- Súper Habilidad de Kael: "Golpe Fantasma"

local SuperKael = {}

local DURACION_INVISIBILIDAD = 1.5
local MULTIPLICADOR_DAÑO_EXTRA = 2 -- el próximo golpe hace el doble de daño

-- Tabla para rastrear qué jugadores tienen el bono de "próximo golpe" activo
local golpeFantasmaActivo = {}

function SuperKael.Activar(jugador)
	local personaje = jugador.Character
	if not personaje then return end

	-- Vuelve invisible todas las partes del personaje
	for _, parte in ipairs(personaje:GetDescendants()) do
		if parte:IsA("BasePart") or parte:IsA("Decal") then
			parte.LocalTransparencyModifier = 1
		end
	end

	-- Marca a este jugador con el bono de daño extra en su próximo ataque
	golpeFantasmaActivo[jugador.UserId] = true

	task.delay(DURACION_INVISIBILIDAD, function()
		if personaje and personaje.Parent then
			for _, parte in ipairs(personaje:GetDescendants()) do
				if parte:IsA("BasePart") or parte:IsA("Decal") then
					parte.LocalTransparencyModifier = 0
				end
			end
		end
	end)
end

-- Llamar esta función desde el sistema de ataque básico existente,
-- ANTES de aplicar el daño normal, para saber si corresponde el bono.
function SuperKael.ConsumirBonoSiCorresponde(jugador, dañoBase)
	if golpeFantasmaActivo[jugador.UserId] then
		golpeFantasmaActivo[jugador.UserId] = nil
		return dañoBase * MULTIPLICADOR_DAÑO_EXTRA
	end
	return dañoBase
end

return SuperKael
```

**Importante sobre seguridad:** la invisibilidad se debe manejar sobre todo del lado del servidor (o replicada correctamente), porque si solo se hace en el cliente, un jugador con un exploit podría ver a Kael igual. Pedile a Antigravity que valide esto específicamente — es un vector de exploit típico en Roblox.

### 2.3. Matchmaking — exigir mínimo de jugadores por equipo

Spec para el prompt a Antigravity (no hace falta que lo escribas vos, se lo podés pasar tal cual):

> "En `LobbyManager`, activá la validación que ya está programada pero deshabilitada para pruebas: la partida solo puede iniciar si hay al menos 1 jugador por equipo (mínimo 2 en total), idealmente configurable con una constante `JUGADORES_MINIMOS_POR_EQUIPO`. Mientras no se cumpla, el botón 'Iniciar Partida' debe mostrar 'Esperando más jugadores...' en vez de permitir el inicio. Dejá un modo de desarrollador (activable solo por vos, no visible a jugadores) para poder seguir probando solo sin publicar esa opción."

### 2.4. Reemplazo de Mock IDs por Developer Products reales

Pasos concretos (esto lo hacés vos en la web de Roblox, no Antigravity):
1. Publicá el juego (aunque sea no listado) para poder crear productos asociados a un lugar (Place) real.
2. Andá a **Creator Dashboard → tu experiencia → Monetización → Developer Products** y creá los 3 paquetes de Gemas definidos en el Plan de Fase 7 (100/300/800 Gemas a 80/200/500 Robux).
3. Copiá los 3 IDs numéricos reales que Roblox te asigna.
4. Pedile a Antigravity: "Reemplazá los Mock IDs (111111111, etc.) en `StarterGui.TiendaPersonajes.TiendaClient` y en `ServerScriptService.MonetizacionManager` por estos IDs reales: [pegás los 3 números]".
5. Volvé a testear con "Test Purchase" — en Studio va a seguir simulando la compra aunque el ID sea real, así que la prueba final de verdad solo se puede hacer publicando y comprando con Robux reales (podés usar tu propia cuenta con Robux mínimos).

---

## 3. Cumplimiento de estándares y políticas de Roblox

Roblox actualizó varias reglas de monetización y economía en 2026 que tu documentación (escrita hace unos meses) no contempla todavía. Puntos a revisar antes de publicar:

- **Nada de ventaja competitiva paga.** Tu regla de oro ("todo lo pago es cosmético") está bien definida en el GDD y respetada en el diseño de skins — mantenela así, es la política más estricta que vigila la comunidad de Roblox en juegos competitivos y la que más rápido genera bajas calificaciones si se rompe.
- **PolicyService obligatorio.** Roblox exige integrar `PolicyService` para verificar elegibilidad regional/de edad antes de mostrar ciertos productos monetizables (por ejemplo, si en el futuro agregás cofres con recompensas aleatorias). Tu monetización actual (Gemas de precio fijo, skins de precio fijo) no cae en la categoría de "ítem aleatorio pago", así que por ahora no es obligatorio, pero **si en el roadmap agregás cofres o "packs sorpresa" de skins, `PolicyService` pasa a ser obligatorio** y además Roblox lo trata como mecánica cercana al gambling — evitalo o restringilo fuerte.
- **DataStoreService para todo lo comprado.** Ya lo estás haciendo bien (Gemas y skins persistidos en `DataStoreManager`), que es exactamente lo que Roblox exige para no perder compras.
- **Ventas cruzadas entre experiencias deshabilitadas desde mayo 2026.** No podés vender un Game Pass o Developer Product de otra experiencia dentro de Arena Vórtice. No es un problema para vos ahora, pero tenelo en cuenta si en el futuro separás el juego en varias experiencias (ej. un lobby social aparte).
- **DevEx actualizado:** la tasa estándar es de USD 0,0038 por Robux ganado, con una tasa más alta de USD 0,0054 para Robux gastados por jugadores verificados de EE.UU. mayores de 18 años. El mínimo para retirar sigue siendo 30.000 Robux ganados. Esto no cambia tu estrategia, pero ajustá las expectativas de tu Plan Estratégico (que citaba una tasa un poco menor).
- **Verificación de edad para chat.** Si en el roadmap agregás chat de texto libre entre jugadores (hoy está fuera de alcance según el GDD), Roblox exige verificación de edad para habilitar chat sin filtro entre usuarios — priorizá `TextChatService` con filtrado estándar si algún día lo sumás.
- **Rendimiento y Toolbox:** los modelos que insertaste desde la Toolbox (Golem, Maga, Ninja) deben revisarse en cuanto a polycount para mobile — es el público objetivo declarado en tu GDD (10-16 años, sesiones cortas, muchos en celular). Pedile a Antigravity un chequeo de la cantidad de triángulos por personaje; para Roblox mobile competitivo se recomienda mantener cada personaje por debajo de ~15.000-20.000 triángulos visibles simultáneamente.
- **Accesibilidad de lectura de personajes:** tu GDD ya define bien la regla de siluetas legibles en pantalla chica — es coherente con las guías de diseño de Roblox para juegos competitivos, mantenela como principio no negociable en cada personaje nuevo.

---

## 4. Roadmap propuesto — de v1.0 a "top del catálogo"

El objetivo que planteás (excelencia en gráficos, sonido y jugabilidad, estar entre los mejores de la plataforma) no se logra en un lanzamiento — se logra con actualizaciones consistentes cada 2-4 semanas, que es el ritmo que la propia comunidad de creadores de Roblox identifica como el que sostiene el algoritmo de descubrimiento. Te propongo tres versiones:

### v1.1 — "Estabilización" (2-3 semanas post-lanzamiento)
- Cerrar los 4 puntos críticos de la sección 1 (Súper de Yssa/Kael, mínimo de jugadores, IDs reales).
- Activar `AnalyticsManager` en producción real y mirar: personaje más usado, personaje con más winrate, duración promedio de partida. Ajustar `daño`/`vida` según datos reales, no según intuición.
- Servidor privado gratuito activo desde el día 1 (ya está en tu Marketing Kit) para que los primeros jugadores inviten amigos — es lo que más ayuda al algoritmo de Roblox en las primeras 72 horas.

### v1.2 — "Pulido de excelencia" (mes 2)
- **Gráficos:** agregar partículas de impacto diferenciadas por personaje (ahora mismo el feedback visual es solo "número rojo + parpadeo" — para destacar contra juegos como Blade Ball necesitás VFX de impacto por tipo de ataque: chispa de piedra para Grom, rayo para Yssa, corte fantasma para Kael).
- **Sonido:** completar la regla del GDD de "cada personaje debe sonar distinto" — verificar que Yssa y Kael tengan SFX únicos de ataque básico y de súper (hoy solo está confirmado para Grom en el Changelog). Sumar variación de pitch aleatoria (±10%) en golpes repetidos para que no suene metronómico.
- **Cámara y feel:** agregar screen shake sutil en súper habilidades y hit-stop de 2-3 frames en golpes críticos — es el detalle que hace que un brawler "se sienta" premium (Brawl Stars y Blade Ball lo usan mucho).
- **Jugabilidad:** un 4º personaje (siguiendo la regla de "1 personaje nuevo cada 3-6 semanas" que ya definiste en el Plan Estratégico) para dar motivo de retorno y de gasto en la tienda.

### v2.0 — "Escalar en el catálogo" (mes 3-4)
- Segundo mapa (con desniveles, como preveía el GDD para "mapas futuros") para variar el meta de personajes.
- Pase de temporada (Battle Pass) — ya está en tu plan de monetización de Fase 7 pendiente de activar.
- Sistema de rango/liga simple (aunque sea informal, sin ranked completo) para dar motivo de retención a jugadores avanzados.
- Evaluar Rewarded Video Ads de Roblox como monetización adicional no intrusiva (compatible con tu política "no pay-to-win": dar recompensas cosméticas menores o monedas blandas a cambio de ver un video, nunca ventaja competitiva).

---

## 5. Próximo paso recomendado

1. Copiá la sección 1 de este documento y pegala como primer mensaje a Antigravity dentro de Studio — pedile que audite cada punto contra el proyecto real antes de tocar nada.
2. Una vez confirmadas las brechas reales, usá los prompts/código de la sección 2 fase por fase (empezá por las Súper Habilidades de Yssa y Kael, son las más visibles para cualquier jugador nuevo).
3. Recién ahí, publicá — con los 4 puntos críticos cerrados de verdad, no solo documentados como cerrados.
