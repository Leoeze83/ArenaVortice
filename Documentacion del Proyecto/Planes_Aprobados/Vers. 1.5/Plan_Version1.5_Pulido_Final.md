# Plan de Implementación: Versión 1.5 — "Pulido Final Pre-Lanzamiento" ✨

**Prioridad:** 🟡 MEDIA — Mejoras de calidad y protección  
**Prerrequisito:** Versiones 1.3 y 1.4 completadas  
**Estimación:** 2 sesiones de trabajo

---

## Contexto

Con los bugs críticos cerrados (v1.3) y las features activadas (v1.4), esta versión se enfoca en el **pulido de la experiencia de juego** y la **protección contra exploits adicionales** antes de considerar escalar el contenido en la v2.0.

---

## Tareas

### 🟡 Tarea 1 — Hit-Stop Diferenciado por Súper Habilidad

**Scripts:** `StarterPlayerScripts.CamaraTopDown` + `ServerScriptService.ServidorCombate`  
**Problema:** El screen shake actual es genérico para todas las habilidades. No hay "hit-stop" (pausa de 2-3 frames al impactar).

**Implementación:**
- Crear sistema de hit-stop: pausar brevemente la animación al conectar un golpe súper
- Diferenciar intensidad de screen shake por tipo de súper:
  - **Grom (Onda Sísmica):** Shake fuerte + largo (terremoto)
  - **Yssa (Tormenta Embotellada):** Shake medio + rápido (tormenta eléctrica)
  - **Kael (Golpe Fantasma):** Shake mínimo + seco (impacto oscuro)
  - **Pyra (Infierno Vorticista):** Shake medio + ondulante (onda de calor)
- Enviar tipo de shake desde servidor al cliente vía RemoteEvent para que cada jugador en rango lo sienta

---

### 🟢 Tarea 2 — Sonidos Únicos de Pyra

**Scripts:** `StarterPlayerScripts.ControlesCombate` + `ServerScriptService.ServidorCombate`  
**Problema:** Pyra puede estar reutilizando los sonidos de ataque de Yssa o usando sonidos genéricos.

**Implementación:**
- Verificar qué SoundId usa Pyra actualmente para ataque básico y súper
- Si reutiliza el de otra clase, asignar SFX propios de fuego:
  - Ataque básico: sonido de "whoosh" de fuego / lanzamiento de bola de fuego
  - Súper (Infierno Vorticista): rugido de llamas + explosión de fuego
- Asegurar que el `PlaybackSpeed` aleatorio (implementado en v1.1) aplique también a los sonidos de Pyra

---

### 🟡 Tarea 3 — Anti-Cheat: Validación de WalkSpeed Server-Side

**Script:** Nuevo script en `ServerScriptService` o integrado en `ServidorCombate`  
**Problema:** Un exploit de speedhack puede modificar `Humanoid.WalkSpeed` en el cliente, permitiendo al jugador moverse más rápido de lo permitido y romper el balance de captura de núcleo.

**Implementación:**
- Monitorear la posición de cada jugador cada N ticks (0.5-1 segundo)
- Si un jugador se mueve más rápido de lo que su WalkSpeed permitiría (con margen de tolerancia del 20% por latencia), forzar corrección:
  - **Primer aviso:** Teletransportar al jugador a su posición anterior
  - **Segundo aviso:** Expulsar de la partida (kick)
- Mantener tabla de infracciones por `UserId` para resetear al final de la partida
- Considerar margen para dash/habilidades que modifiquen velocidad temporalmente

---

### 🟠 Tarea 4 — Rewarded Video Ads (Roblox)

**Scripts:** Nuevo `ServerScriptService.RewardedAdsManager` + nuevo `StarterGui.RewardedAdHUD`  
**Contexto:** Sistema de monetización no intrusiva compatible con la política "no pay-to-win".

**Implementación:**

**Server-side:**
- Usar `AdService` de Roblox para servir video ads rewarded
- Al completar un video, otorgar recompensa al jugador:
  - **Opción A:** 5 Monedas por video (máximo 3 videos por sesión)
  - **Opción B:** 1 Gema por video (máximo 1 video por sesión)
- Registrar en `DataStoreManager` cuántos videos vio el jugador hoy (reset diario)

**Client-side:**
- Botón "Ver Video = Monedas Gratis" en el lobby (no durante partida)
- Indicar cuántos videos quedan hoy
- Animación de recompensa al completar el video

> **Nota:** Requiere que el juego esté publicado y habilitado para ads en el Creator Dashboard.

---

## Verificación

1. **Hit-Stop:**
   - Usar cada súper → verificar que el screen shake es diferente para cada héroe
   - Verificar que el hit-stop se siente como una "pausa de impacto" breve
2. **Sonidos de Pyra:**
   - Atacar con Pyra → verificar que el SFX es distinto al de Yssa y las otras clases
   - Verificar que el pitch aleatorio aplica
3. **Anti-Cheat WalkSpeed:**
   - Verificar en consola que el sistema detecta movimiento anómalo
   - (Opcional) Modificar WalkSpeed manualmente en Studio para probar detección
4. **Rewarded Ads:**
   - Verificar que el botón aparece en el lobby
   - (Solo verificable completamente con juego publicado)

---

## Orden de Ejecución

```
Tarea 1 (Hit-Stop) → Tarea 2 (Sonidos Pyra) → Tarea 3 (Anti-Cheat) → Tarea 4 (Rewarded Ads)
```

---

## Después de la v1.5 → Roadmap v2.0

Una vez completada la v1.5, el juego estará listo para:
- Migración de `_G` a `ModuleScript`s (refactor técnico fundamental)
- 5º y 6º héroe (nuevos roles que complementen el triángulo)
- TextChatService & verificación de edad
- Matchmaking multiservidor (`TeleportService`)
