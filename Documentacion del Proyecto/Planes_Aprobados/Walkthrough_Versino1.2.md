# Walkthrough: Versión 1.2 — Pulido de Excelencia & 4º Héroe (Pyra) 🔥

Este walkthrough documenta los avances implementados en la **Versión 1.2** para elevar el Game Feel de Arena Vórtice y ampliar el catálogo de héroes.

---

## ⚡ Novedades Implementadas

### 1. Vibración de Cámara (Screen Shake) & Game Feel Táctil
- `StarterPlayerScripts.CamaraTopDown` ahora incluye un motor de desacoplado CFrame (`shakeOffset`).
- Al presionar **E** (Súper Habilidad) o al presenciar impactos fuertes, la cámara experimenta un temblor sutil e inmersivo.
- Los sonidos de ataque en `ControlesCombate` ahora cuentan con variación aleatoria de tono (`PlaybackSpeed` ±10%), eliminando la monotonía auditiva.
- El HUD de salud cambia automáticamente a rojo vibrante cuando la vida desciende por debajo del 25%.

### 2. Partículas VFX por Clase
- **Grom:** Estallido de polvo y fragmentos de rocas en tierra.
- **Yssa:** Emitter de chispas eléctricas y destello azul neón.
- **Kael:** Ráfaga de aura de sombras púrpura.
- **Pyra:** Partículas de fuego y llamarada en impacto.

### 3. Nuevo 4º Héroe Jugable: **Pyra (Maga de Fuego)**
- **Ataque Básico:** Lanza proyectiles de fuego neón naranja a distancia.
- **Súper Habilidad ("Infierno Vorticista"):** Crea un anillo de fuego circular (12 studs de radio) durante 4 segundos que inflige 10 de daño por tick a todo enemigo dentro.
- **Integración UI:** Disponible en la **Tienda de Héroes** por 100 Monedas y en la pantalla de **Selección de Personaje**.

---

## 🧪 Pasos para Verificar la Versión 1.2 en Roblox Studio

1. Inicia **Play (F5)** en Roblox Studio.
2. Abre la **Tienda** en el Lobby:
   - Verás el nuevo botón de **Pyra (Maga de Fuego)**.
3. Inicia la secuencia de partida y selecciona a **Pyra**:
   - Tu personaje spawneará con un aura radiante de llamas naranjas y velocidad de 18 studs/s.
   - Ataca a distancia (Click derecho) para ver proyectiles de fuego y VFX de impacto.
   - Carga la Súper al 100% y presiona **E**: experimenta la **vibración de cámara (Screen Shake)** y observa la creación del anillo de fuego *Infierno Vorticista*.
4. Selecciona a **Grom**, **Yssa** o **Kael** para presenciar las partículas de impacto diferenciadas (piedra, rayos y sombras) y la variación acústica en sus ataques.
