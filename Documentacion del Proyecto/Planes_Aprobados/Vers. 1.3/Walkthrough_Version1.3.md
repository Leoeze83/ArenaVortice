# Walkthrough: Versión 1.3 — Cierre de Integridad 🔧

**Fecha:** 24 de julio de 2026  
**Estado:** ✅ Completada e implementada directamente en Roblox Studio

---

## ¿Qué se construyó?

Esta versión cerró los **6 bugs críticos** identificados por la auditoría real del `.rbxl`, ninguno de los cuales era visible en la documentación de versiones anteriores.

### Bug 2.1 — Recompensas en `finPartida()` ✅
**Script:** `ServerScriptService.GameManager`  
**Fix:** Se integró el bloque de distribución de recompensas dentro de `finPartida(ganador)`:
- **Victoria:** +50 XP, +10 Monedas, +25 RP
- **Derrota:** +25 XP, +5 Monedas, -15 RP
- Se muestra un anuncio personalizado por jugador con las recompensas obtenidas
- Todas las llamadas protegidas con `if _G.DataManager then ... end`

### Bug 2.2 — Funciones de Monetización Faltantes ✅
**Script:** `ServerScriptService.DataStoreManager`  
**Fix:** Se agregaron las 3 funciones que faltaban y que `TiendaManager` y `MonetizacionManager` esperaban:
- `DataManager.SumarGemas(player, cantidad)` — para compras con Robux reales
- `DataManager.ComprarSkin(player, skinName, costoGemas)` — verifica duplicados y descuenta Gemas
- `DataManager.EquiparSkin(player, skinName)` — valida que el jugador tenga la skin
- Bonus: también se agregaron `GetNivelSeasonPass()` y `ReclamarRecompensa()` para la v1.4

### Bug 2.3 — Morph Visual de Pyra ✅
**Script:** `ServerScriptService.GestorClases`  
**Fix:** Se agregó el bloque `elseif clase == "Pyra"` en `aplicarMorph`:
- **Stats:** 90 HP, 18 WalkSpeed (intermedio entre Yssa y Kael)
- **Visual:** Color naranja-fuego (RGB 255, 90, 20) con Material Neon
- **Aura:** `ParticleEmitter "AuraFuego"` con 3 colores de fuego (rojo → naranja → amarillo), LightEmission 0.9, Rate 40

### Bug 2.4 — Anti-exploit Cooldown Server-Side ✅
**Script:** `ServerScriptService.ServidorCombate`  
**Fix:**
- Tabla `ultimoAtaque[userId] = {melee, distancia}` para rastrear el último ataque de cada jugador
- Validación en `peticionAtaque.OnServerEvent`: si el tiempo transcurrido es menor al cooldown (`0.45s` melee, `0.75s` distancia), la petición se rechaza silenciosamente
- Normalización del vector de dirección recibido del cliente: `direccion.Unit` para evitar distorsiones de ángulo

### Bug 2.5 — Developer Products (advertencia) ✅
**Script:** `ServerScriptService.MonetizacionManager`  
**Fix:** Se reemplazaron los comentarios genéricos por instrucciones precisas y bien visibles:
- Bloque `⚠️ ACCION REQUERIDA ANTES DE PUBLICAR` con los 4 pasos exactos para crear los Developer Products
- La lógica de `SumarGemas` ya funciona (gracias al fix 2.2) — solo falta que el usuario cargue los IDs reales

---

## Cómo probarlo

1. **Abre Studio** y presiona **F5 (Play)**
2. **Selecciona Pyra** → verificar que aparece naranja/neon con partículas de fuego
3. **Completa una partida** → al finalizar deberías ver "+50 XP +10 Monedas +25 RP" (victoria)
4. **Revisa leaderstats** → el Nivel, RP y Rango deben actualizarse en tiempo real
5. **Consola (F9)** → verificar que no aparecen errores `nil` ni `attempt to call nil`

---

## Archivos modificados en Studio

| Script | Cambio |
|--------|--------|
| `DataStoreManager` | +4 funciones nuevas, campo `SkinEquipada`, tabla Season Pass |
| `GameManager` | Bloque de recompensas en `finPartida()` |
| `GestorClases` | Bloque `elseif "Pyra"` con stats, color y aura |
| `ServidorCombate` | Tabla `ultimoAtaque`, validación cooldown, normalización `direccion.Unit` |
| `MonetizacionManager` | Comentarios de acción requerida para IDs reales |

---

## Resultado esperado al probar

```
[DataStoreManager v1.3] Inicializado - Funciones de Gemas, Skins y Season Pass agregadas.
```
→ Debe aparecer en Output al hacer Play. Si no aparece, revisar que Studio guardó los cambios.
