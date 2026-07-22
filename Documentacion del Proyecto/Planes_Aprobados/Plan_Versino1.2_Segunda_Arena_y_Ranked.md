# Plan de Implementación: Versión 1.2 — 2º Mapa, Ranked 3v3 & Season Pass 🏆

La **Versión 1.2** introduce la primera gran expansión de contenido de *Arena Vórtice*, llevando el juego a un nivel competitivo profesional y escalable.

---

## 🎯 Objetivos de la Versión 1.2

### 1. Segundo Mapa Jugable — "Las Minas de Cristal"
- **Entorno:** Mina subterránea mística con desniveles, estructuras de madera, cristales bioluminiscentes cyan/púrpura y puentes estrechos.
- **Rotador de Mapas:** `GameManager` elegirá aleatoriamente entre *El Cráter Sagrado* y *Las Minas de Cristal* al arrancar cada partida.

### 2. Sistema de Liga & Rangos Competitivos (Ranked 3v3)
- **Persistencia:** Guardado de `RankPoints` (Puntos de Liga) en `DataStoreManager`.
- **Divisiones:**
  - 🥉 Bronce (0 - 299 RP)
  - 🥈 Plata (300 - 599 RP)
  - 🥇 Oro (600 - 999 RP)
  - 💎 Diamante (1000 - 1499 RP)
  - 👑 Leyenda (1500+ RP)
- **Cálculo de RP:** +25 RP por victoria, -15 RP por derrota.
- **UI:** Visualización del rango en `Leaderstats` (Lobby) y en la pantalla de resultados.

### 3. Pase de Temporada (Season Pass - Temporada 1: "Cristales del Vórtice")
- **Progreso:** 10 Niveles de Temporada desbloqueables acumulando XP de partidas.
- **Línea Gratuita:** Recompensas de Monedas y XP booster.
- **Línea Premium (Desbloqueable con 150 Gemas):** Skin Exclusiva *"Kael Sombra de Cristal"* y Gemas extra.
- **UI:** Nueva pestaña "Pase de Temporada" dentro del Menú/Lobby.

---

## 🏗️ Cambios Arquitectónicos

### 1. `Workspace.Mapas` & `ServerScriptService.GameManager`
- Crear la estructura física de *Las Minas de Cristal* en Workspace.
- Modificar `GameManager` para teletransportar a los equipos al mapa seleccionado dinámicamente.

### 2. `ServerScriptService.DataStoreManager`
- Extender el esquema de datos para guardar `RankPoints` y `SeasonPassLevel` / `HasPremiumPass`.

### 3. `ServerScriptService.RankedManager`
- Crear nuevo módulo de servidor para gestionar la suma/resta de RP y actualización de insignias de rango.

### 4. `StarterGui.SeasonPassHUD`
- Crear interfaz interactiva para reclamar recompensas del Pase de Temporada.

---

## 🧪 Plan de Verificación

1. **Prueba de Rotación de Mapa:** Iniciar 2 partidas seguidas y comprobar la carga dinámica del nuevo mapa *Las Minas de Cristal*.
2. **Prueba de Rangos:** Completar una partida, ganar y verificar la suma de +25 RP y el cambio de división visual.
3. **Prueba de Season Pass:** Acumular XP, subir de nivel en el Pase y reclamar las recompensas gratuitas y premium.
