# 📓 Changelog — Arena Vórtice

Registro de decisiones, cambios y avances del proyecto.
Actualizado por el Game Director (Antigravity) después de cada sesión de trabajo.

---

## 2026-07-18 — Sesión 1: Arranque del proyecto

### ✅ Completado
- Lectura y confirmación del GDD (Game Design Document) — sin cambios.
- Lectura y confirmación del Plan Estratégico — sin cambios.
- Conexión MCP entre Antigravity y Roblox Studio: **✅ verificada**. Se creó un bloque de prueba rojo en el Workspace.
- Creación de reglas persistentes (AGENTS.md) para el comportamiento del agente en el proyecto.
- **Fase 0 (Fundamentos) completada**:
  - Ejercicio 1 (Bloque Mágico) ✅
  - Ejercicio 2 (Contador Puntos UI) ✅
- Primer push del proyecto a GitHub completado exitosamente: https://github.com/Leoeze83/ArenaVortice
- **Fase 2 (Prototipo del combate core) completada**:
  - Mapa gris (greybox) "El Cráter Sagrado".
  - Cámara Top-Down fija con sistema de Transparencia (Raycast).
  - Sistema de combate funcional (Hitbox melee, Proyectiles, Feedback Visual).
  - Sistema de Equipos (Rojo/Azul) con Spawns dedicados.
  - Sistema de Muerte y Respawn (5s).
- **Fase 3 (Habilidades especiales + UI) completada**:
  - HUD de combate (Barra de Vida y Barra de Súper).
  - Sistema de recarga de Súper (25% por golpe acertado).
  - Súper Habilidad "Onda Sísmica" de Grom (Daño en área, knockback, stun).
  - Menú de Selección de Héroe al inicio de la partida.
  - Sistema de Transformación Visual (Morph) para distinguir clases.
- **Fase 4 (Modo Control de Núcleo y UX/UI) completada**:
  - Implementación de aparición dinámica de núcleo en 5 posiciones aleatorias.
  - Lógica de captura por proximidad 2D con barra de progreso progresiva.
  - Lógica de pausa por disputa entre equipos.
  - Rediseño estético total del HUD (MatchHUD), haciéndolo moderno e inmersivo (reloj aislado, puntuación en esquinas con gradientes).
  - Efectos visuales de Núcleo mejorados (Material sólido neón vibrante, y luz ajustada).
  - Solución de bugs de red (Infinite yield y colisiones neutrales del Dummy).

### ⏳ En progreso
- A la espera de iniciar Fase 4 (Progresión o Decoración de mapa).

### 📋 Decisiones tomadas
| Decisión | Detalle |
|---|---|
| Orden de fases | Fase 0 (fundamentos) → Fase 2 (combate core) → Fase 3 (habilidades + UI) → Fase 4 (progresión) → Fase 5 (monetización) → Fase 6 (pulido) |
| Ejercicios Fase 0 | 1. "El Bloque Mágico" (eventos, propiedades) · 2. "Contador de Puntos" (funciones, UI) · 3. "Chat de Batalla" (RemoteEvents, cliente↔servidor) |
| GDD cerrado | No se modifica diseño de personajes, mapa ni modo de juego salvo pedido explícito del usuario |

### 📌 Valores clave definidos (para referencia rápida)
| Parámetro | Valor |
|---|---|
| Personajes MVP | Grom (Tanque), Yssa (Daño a distancia), Kael (Asesino) |
| Modo de juego MVP | Control de Núcleo — 3v3 |
| Mapa MVP | El Cráter Sagrado |
| Puntos para ganar | 3 puntos |
| Tiempo máximo partida | 4 minutos |
| Tiempo de respawn | 5 segundos |
| Tiempo de captura del Núcleo | 10 segundos |
| Aparición del Núcleo | Cada 45 segundos |

---
