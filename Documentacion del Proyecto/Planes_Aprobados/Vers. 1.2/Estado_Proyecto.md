# 📊 Estado del Proyecto: Arena Vórtice (Versión 1.2)

**Estado General:** ⚠️ Versión 1.2 Implementada — con features parciales (ver v1.4).

---

## 📌 Checklist de Versión 1.2 — 2º Mapa, Ranked & Season Pass

- [x] **2º Mapa (*Las Minas de Cristal*)**
  - [x] Arena subterránea construida en `Workspace.LasMinasDeCristal`
  - [x] Cristales bioluminiscentes neón y altares
  - [ ] ⚠️ **Bug 2.6a: `GameManager` nunca referencia este mapa** — sin rotación real → Fix en v1.4
- [x] **Sistema de Rangos & Liga (Ranked 3v3)**
  - [x] Esquema `RankPoints` (RP) en `DataStoreManager`
  - [x] Divisiones (*Bronce*, *Plata*, *Oro*, *Diamante*, *Leyenda*)
  - [x] Cálculo de +25 RP por victoria y -15 RP por derrota
  - [x] Visualización de Rango y RP en `leaderstats`
  - [ ] ⚠️ **Bug 2.1: `finPartida()` nunca llama a `ActualizarRankPoints()`** → Fix en v1.3
- [x] **Pase de Temporada (Season Pass - Temporada 1)**
  - [x] Interfaz `SeasonPassHUD` con 10 Niveles
  - [x] Recompensas de Monedas (Gratis) y Gemas/Skin Kael Cristal (Premium)
  - [x] Acceso desde botón en `LobbyHUD`
  - [ ] ⚠️ **Bug 2.6b: Solo abre/cierra ventana — sin lógica de XP, niveles ni reclamo** → Fix en v1.4

---

## 🚀 Próximas Versiones

- **v1.3:** Cierre de Integridad (bugs 2.1-2.5).
- **v1.4:** Ranked y Season Pass con lógica funcional real.
- **v1.5:** Pulido Final Pre-Lanzamiento.
