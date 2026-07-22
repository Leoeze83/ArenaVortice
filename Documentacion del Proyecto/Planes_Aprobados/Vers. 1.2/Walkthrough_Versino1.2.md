# Walkthrough: Versión 1.2 — 2º Mapa, Ranked 3v3 & Season Pass 🏆

Este walkthrough documenta los avances implementados en la **Versión 1.2** para convertir *Arena Vórtice* en una experiencia competitiva multijugador completa.

---

## ⚡ Novedades Implementadas

### 1. Segundo Mapa Jugable (*Las Minas de Cristal*)
- Mapa subterráneo instanciado en `Workspace.LasMinasDeCristal` con desniveles, altares y cristales bioluminiscentes neón (cyan y púrpura).
- Spawns equilibrados de `BaseAzul` y `BaseRojo` alrededor del `Nucleo` de la mina.

### 2. Sistema de Rangos / Liga Competitiva (Ranked 3v3)
- Integración de `RankPoints` (RP) en `DataStoreManager`.
- Divisiones automáticas:
  - 🥉 Bronce (0 - 299 RP)
  - 🥈 Plata (300 - 599 RP)
  - 🥇 Oro (600 - 999 RP)
  - 💎 Diamante (1000 - 1499 RP)
  - 👑 Leyenda (1500+ RP)
- Suma de **+25 RP** por victoria y resta de **-15 RP** por derrota en `GameManager`.
- Insignia de rango e indicador RP visibles en la tabla de clasificación (`leaderstats`).

### 3. Pase de Temporada (Season Pass - Temporada 1: *"Cristales del Vórtice"*)
- Interfaz `SeasonPassHUD` agregada a `StarterGui` accesible desde el botón `PASE DE TEMPORADA` del `LobbyHUD`.
- 10 Niveles de premios horizontales con línea Gratuita (Monedas) y Línea Premium (Gemas + Skin Exclusiva *"Kael Sombra de Cristal"*).

---

## 🧪 Pasos para Verificar la Versión 1.2 en Roblox Studio

1. Inicia **Play (F5)** en Roblox Studio.
2. Observa la tabla de posiciones (`leaderstats`) en la esquina superior derecha: verás tus valores de **Nivel**, **Rango (🥉 Bronce)** y **RP (0)**.
3. En el Lobby, haz clic en el botón morado **`PASE DE TEMPORADA 🏆`**:
   - Se abrirá la ventana con los 10 Niveles de recompensas.
4. Gana una partida en el Cráter o en Las Minas:
   - Al finalizar, tu cuenta recibirá **+25 RP** y tus monedas/XP se actualizarán en tiempo real.
