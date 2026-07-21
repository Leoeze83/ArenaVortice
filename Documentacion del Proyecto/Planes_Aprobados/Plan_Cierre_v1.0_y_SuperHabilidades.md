# Plan de Implementación: Cierre Real de v1.0 (SuperHabilidades Yssa/Kael, Matchmaking y Audio)

Este plan cierra formalmente las brechas reales identificadas en la auditoría del proyecto para convertir "Arena Vórtice" en un producto 100% funcional y listo para lanzar.

---

## 📋 Resumen de Brechas a Resolver

1. **Súper Habilidad de Yssa ("Tormenta Embotellada"):**
   - Lanza una zona de rayos en área (radio 10 studs, duración 3s, 8 de daño cada 0.5s).
2. **Súper Habilidad de Kael ("Golpe Fantasma"):**
   - Invisibilidad de 1.5s + multiplicador de daño x2 en el próximo ataque básico.
3. **Súper Habilidad de Grom ("Onda Sísmica"):**
   - Refactorizar la súper actual para que solo se ejecute cuando el personaje sea Grom.
4. **Mínimo de Jugadores por Equipo (Matchmaking Lobby):**
   - En `LobbyManager`, exigir al menos 1 jugador por equipo (mínimo 2 en total) para iniciar partidas públicas, agregando una bandera `MODO_DEV = true` para pruebas individuales.
5. **Sonidos Específicos por Personaje y Habilidades:**
   - Asignar SFX diferenciados para ataques de Yssa (rayos/mágicos), Kael (dagas/sombra) y Grom (impacto pesado).
6. **Manejo de Reemplazo de Mock IDs:**
   - Dejar la documentación y constantes listas para que el usuario inserte sus Developer Product IDs reales cuando cree los productos en Roblox Creator Dashboard.

---

## 🏗️ Cambios Arquitectónicos

### 1. `ServerScriptService.ServidorCombate`
- Modificar `procesarSuper(jugador)` para leer la `ClaseElegida` del personaje.
- Branching por clase:
  - `Grom` -> Ejecuta `SuperGrom()` (Onda Sísmica existente).
  - `Yssa` -> Ejecuta `SuperYssa()` (Tormenta Embotellada en área).
  - `Kael` -> Ejecuta `SuperKael()` (Invisibilidad + bono de daño).
- Modificar `aplicarDanio()` para verificar si el atacante (Kael) tiene activo el bono de "Golpe Fantasma" y duplicar el daño base.

### 2. `ServerScriptService.LobbyManager`
- Agregar la lógica de verificación de mínimo de jugadores por equipo.
- Implementar la constante `MODO_DEV` que permite omitir esta restricción en Studio si está activa.

### 3. `StarterPlayerScripts.ControlesCombate`
- Ajustar la reproducción de efectos de sonido locales diferenciados para cada Héroe al atacar y usar la Súper.

---

## 🧪 Plan de Verificación

1. **Prueba de Súper Yssa:** Seleccionar Yssa, cargar la barra al 100% y presionar Súper. Verificar creación del cilindro neón azul y daño persistente por tick.
2. **Prueba de Súper Kael:** Seleccionar Kael, cargar Súper y activar. Verificar invisibilidad temporal y que el siguiente golpe básico inflija daño doble (40 en lugar de 20).
3. **Prueba de Súper Grom:** Confirmar que Grom mantiene su Onda Sísmica sin alteraciones.
4. **Prueba de Lobby y Matchmaking:** Cambiar `MODO_DEV = false` y verificar que el botón "Iniciar Partida" se bloquee si no hay suficientes jugadores.
