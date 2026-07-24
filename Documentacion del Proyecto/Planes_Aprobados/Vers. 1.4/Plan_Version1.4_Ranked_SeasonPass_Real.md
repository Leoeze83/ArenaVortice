# Plan de Implementación: Versión 1.4 — "Ranked y Season Pass Funcional" 🏆

**Prioridad:** 🟠 ALTA — Features existentes que necesitan lógica real  
**Prerrequisito:** Versión 1.3 completada (los sistemas base deben funcionar)  
**Estimación:** 2-3 sesiones de trabajo

---

## Contexto

La auditoría del `.rbxl` (Bug 2.6) reveló que el 2º Mapa y el Season Pass existen como elementos visuales/UI, pero **no tienen lógica funcional conectada**. `GameManager` nunca referencia el segundo mapa y los scripts del Season Pass solo abren y cierran la ventana sin lógica de progresión. Esta versión los convierte en sistemas activos.

---

## Tareas

### 🟠 Tarea 1 — Sistema de Rotación de Mapa

**Scripts:** `ServerScriptService.GameManager`, posiblemente `LobbyManager`  
**Problema:** `GameManager` solo referencia `Workspace.ElCraterSagrado`. `Workspace.LasMinasDeCristal` existe como carpeta con geometría, pero nunca se usa.

**Implementación:**
- Crear tabla de mapas disponibles: `{"ElCraterSagrado", "LasMinasDeCristal"}`
- Al iniciar partida, seleccionar un mapa aleatorio: `mapas[math.random(#mapas)]`
- Configurar spawns dinámicos: cada mapa debe tener sus propios `SpawnLocation` o puntos de spawn referenciados
- Mover a los jugadores al mapa seleccionado
- Mostrar nombre del mapa en la UI al inicio de la partida
- Asegurar que el Núcleo de Control se posicione correctamente en ambos mapas
- Verificar que la geometría de `LasMinasDeCristal` sea completa y jugable (paredes, suelos, spawns)

**Consideraciones:**
- El lobby debe permanecer en su ubicación actual (cielo)
- Al finalizar la partida, los jugadores vuelven al lobby independientemente del mapa

---

### 🟠 Tarea 2 — Season Pass con Lógica Real

**Scripts:** `StarterGui.SeasonPassHUD` (LocalScripts) + `ServerScriptService.DataStoreManager`  
**Problema:** La UI del Season Pass existe pero solo abre/cierra ventana. No hay lógica de niveles, progresión ni reclamo.

**Implementación:**

**Server-side (DataStoreManager):**
- Verificar que `SeasonPassXP` existe como campo en el esquema de datos del jugador
- Agregar funciones:
  - `DataManager.SumarSeasonPassXP(player, cantidad)` — al ganar partida, sumar XP al pase
  - `DataManager.GetNivelSeasonPass(player)` — calcular nivel actual según XP acumulada
  - `DataManager.ReclamarRecompensa(player, nivel)` — marcar nivel como reclamado y otorgar premio
- Integrar `SumarSeasonPassXP` en `finPartida()` de `GameManager` (junto a las recompensas de v1.3)

**Client-side (SeasonPassHUD scripts):**
- Mostrar barra de progreso con XP actual / XP necesaria para siguiente nivel
- Mostrar los 10 niveles con sus recompensas (iconos, nombres)
- Distinguir visualmente entre línea Gratis y Premium
- Botón "Reclamar" para cada nivel alcanzado y no reclamado
- Conectar botón con RemoteEvent que llama a `ReclamarRecompensa` en servidor

**Tabla de Recompensas (10 Niveles):**

| Nivel | XP Requerida | Recompensa Gratis | Recompensa Premium |
|:-----:|:------------:|-------------------|-------------------|
| 1 | 100 | 50 Monedas | 50 Monedas + 10 Gemas |
| 2 | 250 | 100 Monedas | 100 Monedas + 20 Gemas |
| 3 | 500 | 150 Monedas | 150 Monedas + 30 Gemas |
| 4 | 800 | 200 Monedas | 200 Monedas + 40 Gemas |
| 5 | 1200 | 300 Monedas | 300 Monedas + 50 Gemas |
| 6 | 1700 | 400 Monedas | 400 Monedas + 75 Gemas |
| 7 | 2300 | 500 Monedas | 500 Monedas + 100 Gemas |
| 8 | 3000 | 750 Monedas | 750 Monedas + 150 Gemas |
| 9 | 4000 | 1000 Monedas | 1000 Monedas + 200 Gemas |
| 10 | 5000 | 1500 Monedas | Skin Exclusiva "Kael Cristal" |

> Los valores son ajustables según testing de balance.

---

### 🟡 Tarea 3 — Rango Visible en Selección y Resultados

**Scripts:** `StarterGui.SeleccionPersonaje` + `GameManager` / pantalla de resultados  
**Problema:** El Rango (Bronce a Leyenda) solo se ve en leaderstats nativo. No se muestra en la UI personalizada.

**Implementación:**
- En la pantalla de selección de personaje, mostrar el icono y nombre de la división del jugador
- En la pantalla de fin de partida, mostrar la división de cada jugador junto a su nombre
- Usar la tabla de divisiones existente en `DataStoreManager`:
  - Bronce 🥉 (0-99 RP)
  - Plata 🥈 (100-249 RP)
  - Oro 🥇 (250-499 RP)
  - Diamante 💎 (500-999 RP)
  - Leyenda 👑 (1000+ RP)

---

### 🟢 Tarea 4 — Cambiar `MODO_DEV = false`

**Script:** `ServerScriptService.LobbyManager`  
**Acción:** Cambiar la bandera `MODO_DEV` de `true` a `false` para que la partida requiera el mínimo de jugadores (`JUGADORES_MINIMOS = 2`) en producción.

> **Nota:** Esto se hace al final, después de verificar que todo funciona en modo desarrollo.

---

## Verificación

1. **Rotación de Mapa:**
   - Jugar 5-10 partidas → verificar que ambos mapas aparecen
   - Verificar que el Núcleo y los spawns funcionan en ambos mapas
2. **Season Pass:**
   - Ganar partidas → verificar que `SeasonPassXP` sube
   - Alcanzar un nivel → verificar que el botón "Reclamar" aparece
   - Reclamar → verificar que las monedas/gemas se suman al jugador
3. **Rango en UI:**
   - Verificar que la división se muestra correctamente en selección y resultados

---

## Orden de Ejecución

```
Tarea 1 (Rotación de Mapa) → Tarea 2 (Season Pass) → Tarea 3 (Rango en UI) → Tarea 4 (MODO_DEV)
```
