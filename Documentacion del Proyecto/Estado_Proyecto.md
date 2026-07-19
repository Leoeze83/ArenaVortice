# 🗺️ Estado del Proyecto — Arena Vórtice

Documento vivo que refleja el estado actual del proyecto. Actualizado por el Game Director.

---

## Información general
| Campo | Valor |
|---|---|
| Nombre del juego | Arena Vórtice |
| Plataforma | Roblox (Roblox Studio + Luau) |
| Género | Battle Arena / Brawler 3v3 |
| Presupuesto | $0 |
| Desarrollador | Solo (asistido por IA) |
| Documentos de referencia | [GDD](../GDD_Arena_Vortice.md) · [Plan Estratégico](../Plan_Estrategico_Roblox.md) |

---

## Checklist de progreso por fase

### Fase 0 — Fundamentos de Luau y Roblox Studio ✅
- [x] Instalar Roblox Studio y crear cuenta de desarrollador
- [x] Activar conexión MCP entre Antigravity y Roblox Studio
- [x] Verificar conexión MCP (bloque de prueba creado en Workspace)
- [x] Ejercicio 1: "El Bloque Mágico" — variables, eventos (`Touched`), propiedades ✅
- [x] Ejercicio 2: "Contador de Puntos" — funciones, UI (`ScreenGui`, `TextLabel`) ✅
- [x] Ejercicio 3: "Chat de Batalla" — `RemoteEvents`, cliente ↔ servidor ✅

### Fase 1 — Preproducción / Diseño (GDD)
- [x] Definir concepto del juego y género
- [x] Diseñar modo de juego MVP ("Control de Núcleo" 3v3)
- [x] Diseñar mapa inicial ("El Cráter Sagrado")
- [x] Diseñar 3 personajes iniciales (Grom, Yssa, Kael)
- [x] Definir sistema de progresión y monetización
- [x] Documentar GDD completo

### Fase 2 — Prototipo del combate core ✅
- [x] **Mapa "El Cráter Sagrado"**
  - [x] Construir arena circular simétrica (bloques grises, sin arte final)
  - [x] Crear las 2 bases opuestas con SpawnLocations por equipo
  - [x] Colocar 4 zonas de cobertura (rocas/pilares) simétricas
  - [x] Marcar punto central del Núcleo de Energía
- [x] **Sistema de movimiento**
  - [x] Movimiento top-down (WASD / joystick mobile)
  - [x] Configurar cámara top-down fija
- [x] **Sistema de combate básico**
  - [x] Ataque básico cuerpo a cuerpo (Grom, Kael)
  - [x] Ataque básico a distancia / proyectil (Yssa)
  - [x] Sistema de vida y daño
  - [x] Indicador visual de daño recibido
- [x] **Sistema de muerte y respawn**
  - [x] Muerte al llegar a 0 de vida
  - [x] Temporizador de respawn (5 segundos)
  - [x] Respawn en base del equipo
- [x] **Sistema de equipos**
  - [x] Asignación de jugadores a 2 equipos (Azul y Rojo)
  - [x] Colores de equipo diferenciados
- [x] **Testeo del combate core**
  - [x] Verificar que no hay errores en consola
  - [x] Probar "feel" del combate en Play mode

### Fase 3 — Habilidades especiales + UI
- [ ] **Sistema de carga de Súper Habilidad**
  - [ ] Barra de súper que se carga al hacer/recibir daño
  - [ ] UI de barra de carga visible al jugador
- [ ] **Súper habilidades por personaje**
  - [ ] Grom — "Onda Sísmica" (empuje + aturdimiento 1s en área)
  - [ ] Yssa — "Tormenta Embotellada" (zona de daño en área, 3 seg)
  - [ ] Kael — "Golpe Fantasma" (invisibilidad 1.5s + daño extra)
- [ ] **Habilidades de movilidad**
  - [ ] Kael — Dash corto con cooldown
- [ ] **Sistema de selección de personaje**
  - [ ] Pantalla de selección pre-partida (10 segundos)
  - [ ] UI con los 3 personajes y sus descripciones
- [ ] **HUD de partida**
  - [ ] Barra de vida del jugador
  - [ ] Cooldowns de habilidades visibles
  - [ ] Marcador de puntos por equipo
  - [ ] Temporizador de partida (4 minutos)
- [ ] **Modo de juego "Control de Núcleo"**
  - [ ] Núcleo de Energía aparece cada 45 segundos
  - [ ] Mecánica de captura (10 seg parado cerca sin interrupción)
  - [ ] Sistema de puntaje (primero en 3 puntos gana)
  - [ ] Fin de partida por puntos o por tiempo
- [ ] **Pantalla de resultados**
  - [ ] Mostrar equipo ganador
  - [ ] XP y monedas ganadas (placeholder)

### Fase 4 — Progresión y matchmaking
- [ ] **Sistema de nivel de cuenta**
  - [ ] XP ganada por partida (más XP por ganar)
  - [ ] Niveles con barra de progreso
- [ ] **Sistema de monedas (moneda blanda)**
  - [ ] Monedas ganadas por partida
  - [ ] Desbloqueo de personajes con monedas
- [ ] **Matchmaking básico**
  - [ ] Lobby / salas manuales (MVP)
  - [ ] Matchmaking automático (si es viable)

### Fase 5 — Monetización
- [ ] **Gemas (moneda dura)**
  - [ ] DevProducts para compra de Gemas con Robux
  - [ ] Tienda cosmética con Gemas
- [ ] **Gamepasses**
  - [ ] Skins de personajes (cosmético puro)
  - [ ] Desbloqueo directo de personajes con Robux
- [ ] **Verificar que nada pago da ventaja competitiva**

### Fase 6 — Pulido, testing y lanzamiento
- [ ] **Reemplazo de arte placeholder**
  - [ ] Arte final del mapa (texturas, iluminación)
  - [ ] Modelos/skins de personajes
  - [ ] Efectos visuales de habilidades
- [ ] **Audio**
  - [ ] Música de fondo (selección + combate)
  - [ ] Efectos de sonido por personaje
- [ ] **Beta cerrada**
  - [ ] Invitar 20-50 testers
  - [ ] Recolectar feedback estructurado
  - [ ] Ajustar balance y bugs críticos
- [ ] **Lanzamiento**
  - [ ] Ícono y miniatura del juego
  - [ ] Publicar juego públicamente
  - [ ] Clips de marketing (TikTok/YouTube Shorts)

---

## Conexión MCP (Antigravity ↔ Roblox Studio)
- **Estado:** ✅ Conectado y verificado (2026-07-18)
- **Usuario Roblox:** vaderloopLEO
- **Proyecto activo:** Place1 (proyecto vacío con Baseplate + SpawnLocation)

---

## Estructura de archivos del proyecto

```
juego con IA/
├── GDD_Arena_Vortice.md          ← Diseño del juego (cerrado)
├── Plan_Estrategico_Roblox.md    ← Roadmap y estrategia
├── Mega_Prompt_Antigravity.md    ← Prompt maestro para el agente
├── Documentacion del Proyecto/
│   ├── Estado_Proyecto.md        ← ESTE ARCHIVO — estado y checklist
│   └── Changelog.md              ← Registro de cambios por sesión
└── [Proyecto de Roblox Studio]   ← Se edita vía MCP
```

---

