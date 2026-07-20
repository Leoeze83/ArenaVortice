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

### Fase 3 — Habilidades especiales + UI ✅
- [x] **Sistema de carga de Súper Habilidad**
  - [x] Barra de súper que se carga al hacer daño
  - [x] UI de barra de carga visible al jugador
- [x] **Súper habilidades por personaje**
  - [x] Grom — "Onda Sísmica" (empuje + aturdimiento en área)
  - [x] Yssa y Kael — (Sistemas listos para implementar a futuro)
- [x] **Sistema de selección de personaje**
  - [x] Pantalla de selección pre-partida
  - [x] UI con los 3 personajes y sus descripciones
  - [x] Transformación visual (Morphing) por clase
- [x] **HUD de partida**
  - [x] Barra de vida del jugador y texto
  - [x] Notificaciones de Estado ("Súper Listo")
  - [x] Marcador de puntos por equipo
  - [x] Temporizador de partida (4 minutos)
- [x] **Modo de juego "Control de Núcleo"**
  - [x] Núcleo de Energía aparece cada 45 segundos
  - [x] Mecánica de captura (10 seg parado cerca sin interrupción)
  - [x] Sistema de puntaje (primero en 3 puntos gana)
  - [x] Fin de partida por puntos o por tiempo
- [x] **Pantalla de resultados**
  - [x] Mostrar equipo ganador
  - [ ] XP y monedas ganadas (placeholder)

### Fase 5 — Diseño y Arte del Mapa ✅
- [x] **Remodelación del entorno**
  - [x] Arte final del mapa (texturas, muros, terreno)
  - [x] Diseño de altares y campamentos base
  - [x] Transformación de obstáculos en Ruinas Ancestrales
- [x] **Iluminación y Atmósfera**
  - [x] Configuración de Atardecer Místico, ColorCorrection y Bloom

### Fase 6 — Progresión y Matchmaking ✅
- [x] **Sistema de nivel de cuenta**
  - [x] XP ganada por partida (más XP por ganar)
  - [x] Niveles con barra de progreso
- [x] **Sistema de monedas (moneda blanda)**
  - [x] Monedas ganadas por partida
  - [x] Desbloqueo de personajes con monedas
- [x] **Matchmaking básico**
  - [x] Lobby / salas manuales (MVP)
  - [x] Matchmaking automático (si es viable)

### Fase 7 — Monetización
- [ ] **Gemas (moneda dura)**
  - [ ] DevProducts para compra de Gemas con Robux
  - [ ] Tienda cosmética con Gemas
- [ ] **Gamepasses**
  - [ ] Skins de personajes (cosmético puro)
  - [ ] Desbloqueo directo de personajes con Robux
- [ ] **Verificar que nada pago da ventaja competitiva**

### Fase 8 — Pulido, testing y lanzamiento
- [ ] **Personajes y Efectos**
  - [ ] Modelos/skins definitivos de personajes
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
- **Proyecto activo:** ArenaVortice (proyecto vacío con Baseplate + SpawnLocation)

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

