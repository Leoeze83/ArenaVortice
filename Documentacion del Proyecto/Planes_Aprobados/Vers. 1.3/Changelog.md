# 📜 Changelog — Arena Vórtice (Versión 1.3)

**Fecha:** 24 de julio de 2026  
**Tipo:** Corrección de integridad crítica

---

## ⚡ Versión 1.3 — Cierre de Integridad

### 🔴 Bug Fixes Críticos

- **[Fix 2.1]** `GameManager.finPartida()` ahora reparte XP, Monedas y RankPoints a cada jugador al terminar la partida. Los jugadores reciben un anuncio personalizado con sus recompensas.
- **[Fix 2.2]** `DataStoreManager` ahora incluye `SumarGemas()`, `ComprarSkin()` y `EquiparSkin()` — las tres funciones que `TiendaManager` y `MonetizacionManager` requerían pero no existían. La monetización con Robux reales ya no crashea.
- **[Fix 2.3]** `GestorClases` ahora tiene bloque completo para Pyra: 90 HP, 18 WalkSpeed, color naranja Neon y aura de partículas de fuego (`ParticleEmitter "AuraFuego"`).
- **[Fix 2.4]** `ServidorCombate` implementa validación de cooldown server-side con tabla `ultimoAtaque` por `UserId` (0.45s melee / 0.75s distancia). Vector de dirección normalizado con `.Unit` para evitar distorsiones de hitbox.
- **[Fix 2.5]** `MonetizacionManager` actualizado con instrucciones precisas de 4 pasos para reemplazar los Mock IDs por Developer Products reales del Creator Dashboard.

### 📦 Nuevas Funciones en `DataStoreManager`

- `DataManager.GetNivelSeasonPass(player)` — calcula el nivel actual del Season Pass del jugador
- `DataManager.ReclamarRecompensa(player, nivel, esPremium)` — otorga recompensas por nivel y registra el reclamo
- Tabla `SEASON_PASS_REWARDS` con 10 niveles de recompensas (preparada para v1.4)

### 🔧 Cambios de Infraestructura

- `DataStoreManager` actualizado a versión `v1.3` (nuevo store key: `ArenaVortice_PlayerData_v1.3`)
- Campo `SkinEquipada` agregado al esquema de datos del jugador con retrocompatibilidad

---

## ⚠️ Pendiente de Acción Manual (Usuario)

- **Developer Products IDs:** Reemplazar `111111111`, `222222222`, `333333333` en `MonetizacionManager` por IDs reales del Creator Dashboard antes de publicar con monetización activa.
