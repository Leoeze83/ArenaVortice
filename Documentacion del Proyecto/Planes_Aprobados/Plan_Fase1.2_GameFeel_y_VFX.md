# Plan de Implementación: Versión 1.2 — Game Feel Premium & VFX de Impacto ⚡

Esta fase eleva la calidad del combate de *Arena Vórtice* al nivel de los mejores brawlers de Roblox (como *Blade Ball* o *Brawl Stars*), añadiendo efectos visuales (VFX) únicos por personaje, vibración de cámara (screen shake), micro-pausa táctil al impactar (hit-stop) y variación dinámica de audio.

---

## 🎯 Objetivos Específicos

1. **Partículas Visuales (VFX) de Impacto Diferenciadas:**
   - **Grom (Tanque):** Emisión de fragmentos de roca, polvo y grietas en el suelo al golpear Melee.
   - **Yssa (Maga):** Chispas de electricidad/rayos azul neón al impactar proyectiles.
   - **Kael (Asesino):** Estela de corte de sombra púrpura/negra al asestar un golpe.

2. **Juiciness & Game Feel (Respuesta Táctil):**
   - **Screen Shake (Vibración de Cámara):** Sacudida sutil de cámara en las súper habilidades e impactos pesados.
   - **Hit-Stop (Micro-pausa de Impacto):** Pausa imperceptible de 2-3 frames al golpear para simular peso del impacto.
   - **Audio Pitch Variation:** Variación aleatoria (±10%) en la frecuencia de reproducción de SFX de ataque para evitar la monotonía sonora.

3. **Indicador Visual de Salud & Críticos:**
   - Parpadeo luminoso en el contorno del HUD cuando la vida cae por debajo del 25%.

---

## 🏗️ Cambios Propuestos por Componente

### 1. CamaraTopDown (StarterPlayerScripts)
- **[MODIFY]** `StarterPlayerScripts.CamaraTopDown`
  - Añadir función remota o evento Bindable para desencadenar impulsos de perturbación en el CFrame de la cámara (*Screen Shake*).

### 2. ServidorCombate (ServerScriptService)
- **[MODIFY]** `ServerScriptService.ServidorCombate`
  - Replicar eventos de VFX de impacto diferenciados hacia los clientes según la `ClaseElegida` del atacante.

### 3. ControlesCombate (StarterPlayerScripts)
- **[MODIFY]** `StarterPlayerScripts.ControlesCombate`
  - Aplicar variación de `PlaybackSpeed` (0.9 a 1.1) al reproducir sonidos de ataque básico.
  - Escuchar eventos de hit y ejecutar la micro-pausa de frames (*Hit-Stop*).

---

## 🧪 Plan de Verificación

1. **Prueba VFX Grom:** Atacar con Grom y verificar la presencia de partículas de piedra en el punto de impacto.
2. **Prueba VFX Yssa:** Disparar proyectiles con Yssa y observar el estallido eléctrico al golpear.
3. **Prueba Screen Shake:** Activar la Súper Habilidad de cualquiera de los héroes y verificar la vibración inmersiva de la cámara.
4. **Prueba Audio Pitch:** Realizar múltiples ataques consecutivos y notar la variación dinámica en el tono del sonido.
