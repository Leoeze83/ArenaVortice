# Arena Vórtice — Estado de Auditoría, Cierre de Versiones y Roadmap Actualizado

**Fecha de actualización:** 24 de julio de 2026  
**Repositorio:** github.com/Leoeze83/ArenaVortice  
**Estado General:** ⚠️ **Versiones 1.0-1.2 implementadas con bugs pendientes (ver Auditoría v2). Versión 1.3 en cola.**

---

## 📊 1. Resumen de Auditoría Real del Código (.rbxl)

> **Fuente:** `ArenaVortice_Auditoria_Codigo_Real_v2.md` — análisis directo del binario `.rbxl`, no de la documentación.

La auditoría del código real reveló que varias features marcadas como "completadas" tienen bugs que las hacen no funcionales:

| # | Bug | Severidad | Versión de Fix |
|---|-----|:---------:|:--------------:|
| 2.1 | Partida nunca reparte XP, Monedas ni RP | 🔴 CRÍTICO | v1.3 |
| 2.2 | Funciones `SumarGemas`/`ComprarSkin`/`EquiparSkin` no existen | 🔴 CRÍTICO | v1.3 |
| 2.3 | Pyra sin morph visual ni stats propios en `GestorClases` | 🟡 MEDIO | v1.3 |
| 2.4 | Sin validación de cooldown server-side (exploit) | 🟠 ALTO | v1.3 |
| 2.5 | Mock IDs de Developer Products | 🟢 CONOCIDO | v1.3 (preparar) |
| 2.6a | 2º Mapa sin rotación real | 🟠 ALTO | v1.4 |
| 2.6b | Season Pass sin lógica de niveles/reclamo | 🟠 ALTO | v1.4 |

---

## 🗺️ 2. Estado de Versiones del Proyecto

### 🛡️ Versión 1.0 — MVP Core (✅ COMPLETADO — con bugs pendientes → v1.3)
- **Héroes:** Grom, Yssa y Kael con ataques Melee y Distancia + Súper Habilidades.
- **Mapa:** *El Cráter Sagrado* con ruinas ancestrales y atardecer místico.
- **Modo:** Control de Núcleo 3v3 con altitud y disputa.
- **Economía & Persistencia:** `DataStoreManager` (XP, Nivel, Monedas y Gemas).
- **Lobby:** Sala flotante en el cielo con cuenta regresiva y selector de clase.
- ⚠️ **Bugs pendientes:** Recompensas no se otorgan (2.1), funciones de tienda/monetización faltan (2.2).

### ⚡ Versión 1.1 — Pulido de Excelencia & 4º Héroe (✅ COMPLETADO — con bug pendiente → v1.3)
- **VFX Específicos por Clase:** Partículas de piedra (Grom), rayos (Yssa), sombras (Kael) y fuego (Pyra).
- **Game Feel:** *Screen Shake*, indicador de salud crítica.
- **Variación Sonora:** *Audio Pitch* aleatorio (±10%).
- **4º Héroe:** **Pyra (Maga de Fuego)** con Súper *Infierno Vorticista*.
- ⚠️ **Bug pendiente:** Pyra sin morph visual en `GestorClases` (2.3).

### 🏆 Versión 1.2 — 2º Mapa, Ranked 3v3 & Season Pass (⚠️ PARCIAL — features sin lógica → v1.4)
- **2º Mapa:** *Las Minas de Cristal* (geometría existente, sin rotación activa).
- **Ranked 3v3:** Esquema de datos existente, sin integración real en `finPartida`.
- **Season Pass:** UI existente, sin lógica de progresión/reclamo.

### 🔧 Versión 1.3 — Cierre de Integridad (📋 PLANIFICADO)
- Integrar recompensas en `finPartida()`.
- Agregar funciones faltantes a `DataStoreManager`.
- Completar morph de Pyra.
- Validación anti-exploit server-side.
- Preparar Developer Products.

### 🏆 Versión 1.4 — Ranked y Season Pass Funcional (📋 PLANIFICADO)
- Sistema de rotación de mapa real.
- Season Pass con lógica completa (XP, niveles, reclamo).
- Rango visible en selección y resultados.
- Activar `MODO_DEV = false`.

### ✨ Versión 1.5 — Pulido Final Pre-Lanzamiento (📋 PLANIFICADO)
- Hit-stop diferenciado por súper.
- Sonidos únicos de Pyra.
- Anti-cheat: WalkSpeed validation.
- Rewarded Video Ads.

---

## 🔮 3. Roadmap Futuro — Versión 2.0+ (Escala Global)

- [ ] **Migración de `_G` a `ModuleScript`s** — refactor técnico para robustez.
- [ ] **5º y 6º Héroe** — nuevos roles que complementen el triángulo.
- [ ] **Rewarded Video Ads de Roblox** — (si no se completó en v1.5).
- [ ] **TextChatService & Verificación de Edad** — chat seguro con filtrado de Roblox.
- [ ] **Matchmaking Multiservidor (`TeleportService`)** — transferencia automática entre instancias.

---

## 📁 Ubicación de Documentos en el Proyecto

```text
ArenaVortice/
├── README.md
├── Doc_inicial/
│   ├── GDD_Arena_Vortice.md
│   ├── Mega_Prompt_Antigravity.md
│   ├── Plan_Estrategico_Roblox.md
│   ├── ArenaVortice_Auditoria_y_Roadmap.md         # Este documento
│   └── ArenaVortice_Auditoria_Codigo_Real_v2.md     # Auditoría real del .rbxl
└── Documentacion del Proyecto/Planes_Aprobados/
    ├── Vers. 1.0/
    ├── Vers. 1.1/
    ├── Vers. 1.2/
    ├── Vers. 1.3/    # Cierre de Integridad
    ├── Vers. 1.4/    # Ranked y Season Pass Real
    └── Vers. 1.5/    # Pulido Final
```
