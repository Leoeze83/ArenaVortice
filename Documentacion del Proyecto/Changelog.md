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
- **Fase 5 (Diseño y Arte del Mapa) completada**:
  - Remodelación topográfica: Sustitución de piezas greybox por entorno con montañas, piedras y follaje.
  - Altar Central: Estructura ceremonial con anillos de mármol y obeliscos con fuego mágico.
  - Campamentos Temáticos: Bases asimétricas fortificadas con energía mágica representativa de cada equipo (Rojo y Azul).
  - Ruinas Ancestrales: Coberturas transformadas en pilares de piedra quebrados.
  - Iluminación Global: Integración de Atardecer Místico, ColorCorrection (saturación y contraste), Atmósfera, y resplandor inmersivo.
- **Fase 6 (Progresión, Tienda y Sistema de Salas) completada**:
  - Implementación de DataStoreManager para guardar XP, Nivel y Monedas en la base de datos de Roblox.
  - Creación de SalaLobby (Plataforma flotante en el cielo) con LobbyHUD interactivo.
  - Máquina de estados en LobbyManager y GameManager para ciclo completo de partida (Lobby -> Selección -> Partida -> Resultados -> Lobby).
  - Repartición de recompensas automáticas al finalizar la partida según equipo ganador/perdedor.
  - UI de Tienda de Personajes funcional que descuenta monedas y guarda inventario.

- **Fase 7 (Monetización) completada**:
  - Implementación de `MonetizacionManager` y uso de `MarketplaceService` para compras de Gemas (moneda dura).
  - Añadido de pestañas (Héroes, Skins, Gemas) a la Tienda Premium.
  - Guardado de Gemas y Skins en `DataStoreManager` respetando jugadores antiguos.
  - Creación del cosmético "Grom Dorado" y "Yssa Sombría".
  - Política "No Pay-To-Win" verificada: Las skins solo alteran materiales y colores en `GestorClases`, sin afectar estadísticas.

### ⏳ En progreso
- A la espera de iniciar Fase 8 (Arte Definitivo, Pulido y Lanzamiento).

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
