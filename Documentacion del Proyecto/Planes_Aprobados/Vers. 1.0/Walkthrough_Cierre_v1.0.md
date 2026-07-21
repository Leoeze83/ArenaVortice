# Walkthrough: Cierre Real de v1.0 ⚔️

Este walkthrough documenta la resolución de las brechas reales identificadas en la auditoría de Arena Vórtice, completando al 100% las mecánicas de combate y la estructura de lobby.

---

## ⚡ Cambios Implementados

### 1. Súper Habilidades Únicas por Héroe (`ServidorCombate`)
- **Grom ("Onda Sísmica"):** Mantiene el ataque original con área de empuje (knockback) de 15 studs y 40 de daño.
- **Yssa ("Tormenta Embotellada"):** Al activar la Súper, Yssa despliega una zona circular neón azul (10 studs de radio) durante 3 segundos a 15 studs frente a ella. Todos los enemigos dentro sufren 8 de daño cada 0.5s (48 de daño total).
- **Kael ("Golpe Fantasma"):** Se vuelve invisible durante 1.5 segundos. Durante este período o en su siguiente ataque básico, inflige el **doble de daño** (40 Melee / 30 Distancia).

### 2. Matchmaking & Modo Desarrollador (`LobbyManager`)
- Se implementó la constante `MODO_DEV = true` que permite continuar testeando partidas en solitario en Roblox Studio.
- Al cambiar `MODO_DEV = false` para producción, el servidor exige estrictamente un mínimo de jugadores (`JUGADORES_MINIMOS = 2`) antes de permitir el inicio de la secuencia de combate.

---

## 🧪 Pasos para Verificar las Nuevas Súper Habilidades

1. Inicia **Play** en Roblox Studio.
2. Elige a **Yssa** en el Lobby:
   - Ataca al Dummy 4 veces hasta alcanzar el 100% de la barra de Súper.
   - Presiona **E**. Observa cómo aparece un cilindro azul transparente neón frente a ti que inflige daño continuo al Dummy si está dentro.
3. Vuelve a iniciar e ingresa con **Kael**:
   - Carga la Súper al 100%.
   - Presiona **E**. Tu personaje se volverá completamente invisible por 1.5 segundos.
   - Ataca inmediatamente al Dummy y observa cómo el texto flotante indica **-40 de daño** (doble del golpe Melee normal).
4. Elige a **Grom**:
   - Carga la Súper y presiona **E**. Grom lanzará su habitual Onda Sísmica de impacto y empuje.
