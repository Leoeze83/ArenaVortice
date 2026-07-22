# Plan de Implementación: Versión 1.2 — Pulido de Excelencia & 4º Héroe 🔥

Alineado estrictamente con el documento `ArenaVortice_Auditoria_y_Roadmap.md` (Sección 4.2), la **Versión 1.2** transformará *Arena Vórtice* en una experiencia de combate táctico de nivel premium (al estilo *Blade Ball* o *Brawl Stars*).

---

## 🎯 Objetivos de la Versión 1.2

### 1. Visuales de Impacto (VFX) Específicos por Héroe
- **Grom (Tanque):** Emisión de partículas de rocas, polvo y grietas en tierra al golpear Melee.
- **Yssa (Maga):** Chispas de rayos/electricidad azul neón al impactar proyectiles.
- **Kael (Asesino):** Ráfaga de corte de sombras púrpura/negra al golpear.

### 2. Game Feel & Sensibilidad de Combate (Juiciness)
- **Screen Shake (Vibración de Cámara):** Sacudida sutil en la cámara durante la Súper e impactos críticos.
- **Hit-Stop (Micro-pausa Táctil):** Pausa imperceptible de 2-3 frames al golpear para simular peso del impacto.
- **Variación de Pitch Sonora:** Variación aleatoria (±10%) en la frecuencia de reproducción de SFX de ataque.

### 3. Introducción del 4º Héroe — "Pyra" (Maga de Fuego / Control)
- **Ataque Básico:** Proyectil de fuego a distancia (15 daño).
- **Súper Habilidad ("Infierno Vorticista"):** Despliega un anillo de fuego durante 4s que quema e inflige daño persistente a quienes intenten atravesarlo.
- **Tienda:** Desbloqueable por 100 Monedas o 50 Gemas.

---

## 🏗️ Cambios Arquitectónicos

### 1. `StarterPlayerScripts.CamaraTopDown`
- Implementar la función `aplicarScreenShake(intensidad, duracion)` integrada en la matriz CFrame.

### 2. `ServerScriptService.ServidorCombate`
- Añadir emisores de partículas VFX instanciados por tipo de ataque y clase (`Grom`, `Yssa`, `Kael`, `Pyra`).
- Implementar la lógica del 4º Héroe `Pyra` y su súper `Infierno Vorticista`.

### 3. `StarterPlayerScripts.ControlesCombate`
- Aplicar aleatoriedad de `PlaybackSpeed` (0.9 a 1.1) al reproducir audio de ataque.
- Ejecutar *Hit-Stop* y *Screen Shake* tras confirmación de impacto.

### 4. `ServerScriptService.GestorClases` & UI
- Añadir el Morph visual de `Pyra` (color naranja neón / material linterna) y su botón de selección en la interfaz de Tienda y Selección de Héroe.

---

## 🧪 Plan de Verificación

1. **VFX por Héroe:** Probar ataques con Grom, Yssa y Kael verificando sus partículas únicas.
2. **Prueba de Pyra:** Seleccionar a Pyra en la Tienda, ingresar a la partida, probar su disparo de fuego y activar su Súper habilidad *Infierno Vorticista*.
3. **Game Feel:** Comprobar la vibración de cámara (Screen Shake) y la variación sonora en los golpes.
