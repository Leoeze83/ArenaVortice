# 📜 Changelog — Arena Vórtice (Versión 1.1)

Todas las adiciones, mejoras y cambios implementados durante el ciclo de desarrollo de la **Versión 1.1**.

---

## ⚡ Versión 1.1 — Pulido de Excelencia & 4º Héroe (Pyra)

### 🎨 Partículas VFX Específicas por Clase
- **Grom (Tanque):** Emisor de partículas de polvo, escombros y grietas al golpear Melee.
- **Yssa (Maga):** Emitter de chispas eléctricas y aura de brillo azul neón.
- **Kael (Asesino):** Ráfaga de sombras y aura púrpura/corte fantasma.
- **Pyra (Maga de Fuego):** Partículas de fuego y llamarada viva en el impacto.

### 🎮 Game Feel & Respuesta Táctil (Juiciness)
- **Screen Shake (Vibración de Cámara):** Sacudida sutil e inmersiva de cámara en `CamaraTopDown` desencadenada al presionar **E** (Súper Habilidad).
- **Variación Dinámica de Audio Pitch:** Frecuencia aleatoria (`PlaybackSpeed` ±10%) en los sonidos de ataque básico en `ControlesCombate`.
- **Indicador de Salud Crítica:** El HUD de salud parpadea en rojo brillante cuando la vida cae por debajo del 25%.

### 🔥 4º Héroe Jugable: Pyra (Maga de Fuego)
- **Ataque Básico:** Proyectiles de fuego neón naranja a distancia (15 daño).
- **Súper Habilidad ("Infierno Vorticista"):** Anillo de fuego circular (12 studs de radio) durante 4 segundos que inflige 10 de daño por tick.
- **Integración UI & Morph:** Disponible en `TiendaPersonajes` (100 Monedas), `SeleccionPersonaje` y `GestorClases` (material neón naranja con emisor de llamas).

---

### 🎉 Estado Actual del Proyecto
- **VERSIÓN 1.1 COMPLETADA Y EMPAQUETADA.**
- Lista para pruebas locales del usuario y posterior paso a la Versión 1.2 (2º Mapa & Ranked).
