# Plan Estratégico: Juego de Batalla de Personajes en Roblox
### (Estilo Brawl Stars + Estética/Lore estilo LOL)

**Perfil del desarrollador:** Solo, sin experiencia previa en programación ni Roblox Studio, $0 de presupuesto, dedicación full time (20+ horas/semana).
**Herramientas disponibles:** Gemini Pro + Antigravity (IDE con agente Gemini integrado), Roblox Studio (gratis).

---

## 1. Diagnóstico realista de viabilidad

Antes de arrancar, tres verdades que conviene tener claras:

1. **Cero experiencia + full time ≠ atajo mágico.** La IA (Antigravity/Gemini) va a escribir la mayoría del código Luau, pero vos vas a tener que entender qué hace ese código, probarlo, y decirle a la IA qué corregir. Si no entendés lo mínimo de Luau, cada bug se vuelve un cuello de botella. Por eso la Fase 0 no es opcional.
2. **"Brawl Stars + LOL" es un combo ambicioso.** Brawl Stars tiene combate en tiempo real con habilidades por personaje; LOL aporta el peso narrativo (lore, splash arts, personalidad de campeón). Replicar esto con múltiples personajes balanceados es un proyecto de meses, no de semanas. La estrategia acá es **lanzar chico y crecer con roadmap**, no intentar 20 personajes día uno.
3. **Roblox no es gratis en tiempo, es gratis en dinero.** Roblox Studio, el motor, el hosting y la distribución no cuestan nada. Lo que vas a "pagar" es tiempo de aprendizaje y de iteración.

**Estimación realista para el MVP jugable (1 mapa, 3 personajes, combate funcional, sin monetización aún):** 3 a 5 meses trabajando full time, siendo generosos con la curva de aprendizaje.

---

## 2. Stack tecnológico 100% gratuito

| Necesidad | Herramienta | Costo |
|---|---|---|
| Motor y publicación | Roblox Studio | Gratis |
| Programación (Luau) asistida | Antigravity + Gemini Pro, conectado a Roblox Studio vía el **servidor MCP incorporado** (el agente escribe scripts, crea objetos y corre el modo Play directamente dentro de Studio) | Ya lo tenés |
| Modelos 3D / personajes | Roblox Toolbox (assets gratis y de la comunidad), o Blender si querés modelar propio | Gratis |
| Arte conceptual / splash arts / iconos | Gemini (generación de imágenes) | Ya lo tenés |
| Sonido y música | Roblox Toolbox (audio library gratis), freesound.org | Gratis |
| Gestión de tareas | Trello o Notion (plan free) | Gratis |
| Control de versiones | Roblox Studio + GitHub (integración gratuita para Luau) | Gratis |
| Comunidad / feedback | Discord (servidor propio) | Gratis |
| Marketing inicial | TikTok/YouTube Shorts (clips de gameplay) | Gratis |

No necesitás comprar nada para arrancar. El único "costo" futuro sería, opcionalmente, un ícono/miniatura hecho por un artista freelance para destacar en el catálogo de Roblox — pero eso es opcional y posterior al lanzamiento.

---

## 3. Roles que vas a cubrir vos (con ayuda de la IA)

Al ser solo, sos: game designer, programador, artista técnico, community manager y marketer. La IA (Antigravity) actúa como tu **programador senior y pair-programmer**, y gracias a la conexión MCP con Roblox Studio (ver sección 3.1) no solo te escribe código: lo **implementa directamente adentro de tu proyecto** (crea scripts, arma la geometría del mapa, inserta assets, corre el modo Play). Vos actuás como **director de proyecto y tester**: definís qué querés, revisás lo que el agente construyó, jugás, encontrás bugs o cosas que "no se sienten bien", y le pedís correcciones.

Este último punto es clave: la conexión MCP acelera muchísimo la parte de construcción, pero **no reemplaza tu criterio**. El agente no puede jugar la partida y sentir si el combate es divertido, ni notar que un mapa se ve confuso — eso lo hacés vos. La modalidad de trabajo ideal es: el agente construye, vos jugás y das feedback, el agente ajusta. Nunca "el agente hace todo el proyecto solo y yo lo reviso al final".

### 3.1 Conexión Antigravity ↔ Roblox Studio (MCP)

Roblox Studio incluye un **servidor MCP (Model Context Protocol)** que le permite a un agente de IA como el de Antigravity interactuar directamente con tu sesión de Studio abierta: explorar el proyecto, escribir y ejecutar scripts en Luau, insertar modelos del catálogo, y correr el modo Play para testear.

Pasos para activarlo:
1. Actualizar Roblox Studio a la última versión (el servidor MCP ya viene incluido).
2. En Studio: menú "..." (arriba a la derecha) → **Manage MCP Servers** → activar **Enable Studio as MCP server**.
3. Conectar Antigravity usando la opción de conexión rápida, configuración JSON o comando CLI que Studio te muestre.
4. Reabrir Antigravity y Roblox Studio con el proyecto abierto. Un indicador verde en el panel de MCP de Studio confirma que el agente ya está conectado.
5. Probar con un comando simple antes de arrancar en serio (ej: "decime qué está seleccionado en el Workspace") para confirmar que el agente está actuando dentro de Studio y no solo generando código suelto.

Con esto activo, en vez de copiar y pegar scripts manualmente, le vas a poder pedir al agente que construya cosas directamente en tu proyecto — y el Mega Prompt Master ya está adaptado a esta modalidad de trabajo.

---

## 4. Roadmap de fases (de cero a producción)

### Fase 0 — Fundamentos (2 a 3 semanas)
- Instalar Roblox Studio, crear cuenta de desarrollador.
- Activar la conexión MCP entre Antigravity y Roblox Studio (ver sección 3.1) para que el agente pueda trabajar directamente dentro del proyecto.
- Aprender lo mínimo de Luau: variables, funciones, eventos, `RemoteEvents`, `Script` vs `LocalScript` vs `ModuleScript`.
- Familiarizarte con la interfaz de Antigravity conectado a tu proyecto de Roblox Studio.
- Hacer 2-3 mini-proyectos de prueba (ej: un botón que suma puntos, un NPC que persigue al jugador) para perder el miedo, pidiéndole al agente que los construya directo en Studio vía MCP.

### Fase 1 — Preproducción / Diseño (2 a 4 semanas)
✅ **Ya completada.** El GDD (Game Design Document) está definido en el archivo adjunto **"GDD_Arena_Vortice"**. Resumen:

- **Nombre:** Arena Vórtice.
- **Modo de juego (MVP):** 3v3 "Control de Núcleo" — dos equipos disputan un punto central que aparece cada 45 segundos; gana el primero en llegar a 3 puntos o quien tenga más al minuto 4.
- **Mapa inicial:** "El Cráter Sagrado", arena simétrica circular con 4 zonas de cobertura y dos bases opuestas.
- **3 personajes iniciales** (triángulo clásico tanque / daño a distancia / asesino):
  - **Grom, el Coloso de Piedra** — Tanque, golpe cuerpo a cuerpo, súper "Onda Sísmica" (empuje + aturdimiento en área).
  - **Yssa, la Tejedora de Tormentas** — Daño a distancia, proyectil de rango largo, súper "Tormenta Embotellada" (zona de daño en área).
  - **Kael, el Filo Veloz** — Asesino ágil, dash corto, súper "Golpe Fantasma" (invisibilidad + golpe con daño extra).
- **Progresión:** Nivel de cuenta + Monedas (moneda blanda, gratis jugando) + Gemas (moneda dura, comprable), sin ventajas competitivas pagas.

El GDD completo (lore extendido, estilo visual/audio, público objetivo y qué queda fuera del MVP) está en el archivo separado y es la referencia oficial para todas las fases siguientes.

Tareas restantes de esta fase antes de pasar a Fase 2:
- Bocetar visualmente (aunque sea con formas simples) el layout del Cráter Sagrado a escala en Roblox Studio.
- Definir valores numéricos iniciales de balance (vida, daño, cooldowns) para los 3 personajes — esto se hace junto con Antigravity al empezar la Fase 2, ajustando sobre la marcha.

### Fase 2 — Prototipo jugable / Core Loop (4 a 6 semanas)
- Construir el mapa base en Roblox Studio (bloques grises, sin arte final todavía).
- Programar (con Antigravity) el sistema de combate núcleo: movimiento, ataque básico, daño, vida, muerte/respawn.
- Programar 1 sola habilidad especial por personaje para validar el sistema de habilidades.
- Testear solo, iterar sobre el "feel" del combate (esto es lo más importante y lo que más se posterga).

### Fase 3 — Sistemas y contenido (6 a 10 semanas)
- Completar las 3 habilidades especiales de cada uno de los 3 personajes.
- Sistema de matchmaking simple (o salas manuales si el matchmaking real es muy complejo al inicio).
- UI: HUD de vida, cooldowns de habilidad, menú de selección de personaje, pantalla de resultado.
- Sistema de progresión básico: nivel de cuenta, monedas ganadas jugando.
- Reemplazar bloques grises por arte final (usando Toolbox + tu propio estilo visual, guiado por prompts de Gemini para conceptos).

### Fase 4 — Monetización (2 a 3 semanas, en paralelo con Fase 3)
Ver sección 5 completa más abajo.

### Fase 5 — Beta cerrada (2 a 3 semanas)
- Invitar 20-50 jugadores (amigos, Discord, comunidades de Roblox devs) vía servidor privado.
- Recolectar feedback estructurado (formulario corto: ¿qué personaje rompiste?, ¿qué se sintió injusto?, ¿te aburriste y cuándo?).
- Ajustar balance y arreglar bugs críticos.

### Fase 6 — Lanzamiento
- Publicar el juego públicamente.
- Ícono y miniatura atractivos (clave para el algoritmo de descubrimiento de Roblox).
- Clips cortos en TikTok/YouTube Shorts mostrando gameplay llamativo (las súper habilidades son el mejor gancho).
- Anuncio en servidores de Discord de Roblox y comunidades de desarrolladores.

### Fase 7 — Live Ops (continuo, post-lanzamiento)
- Nuevo personaje cada 3-6 semanas (mantiene el interés y da motivo para volver a monetizar).
- Eventos temporales, pases de temporada.
- Ajustes de balance basados en datos reales de partidas.

---

## 5. Estrategia de monetización recomendada

Como pediste una recomendación: la mejor combinación para tu caso (solo, arrancando) es un **modelo híbrido de tres capas**, que es el estándar de la industria en juegos competitivos de Roblox:

1. **Gamepasses (compra única):**
   - Skins de personajes (cosmético puro, nunca ventaja competitiva).
   - Personajes adicionales desbloqueables directo con Robux (además de poder desbloquearse jugando, para no generar pay-to-win puro).
   - VIP/Founder pass (acceso anticipado a contenido, un ícono especial, etc.).

2. **Devproducts (moneda virtual consumible):**
   - Una moneda tipo "Gemas" que se compra con Robux y se gasta en la tienda cosmética o en el pase de temporada.
   - Esto te da flexibilidad de precio y es la base para futuros sistemas de recompensas.

3. **Pase de temporada (Battle Pass):**
   - Se activa más adelante (Fase 7), cuando ya tengas una base de jugadores. Da recompensas cosméticas por jugar durante X semanas, con una versión premium comprable.

**Regla de oro:** nunca vendas ventaja competitiva directa (más daño, más vida). Todo lo pago debe ser cosmético o de conveniencia (desbloqueo más rápido). Esto es clave tanto para las políticas de Roblox como para no matar la retención de jugadores gratuitos.

**Sobre cuánto realmente se cobra:** Roblox no te paga el 100% de lo que gasta el jugador. Hay una comisión de mercado + el tipo de cambio del programa Developer Exchange (DevEx), que en 2026 ronda entre $0.0035 y $0.0038 por Robux ganado (con una tarifa especial más alta para jugadores de EE.UU. mayores de 18 años). En la práctica, el desarrollador termina reteniendo aproximadamente un 24-35% de lo que gastó el jugador, dependiendo del tipo de transacción. Además, para poder retirar dinero real necesitás acumular un mínimo de 30.000 Robux ganados. Esto no cambia la estrategia, pero sí las expectativas: la rentabilidad depende de volumen de jugadores, no de un golpe de suerte con una sola venta.

---

## 6. Riesgos principales y cómo mitigarlos

| Riesgo | Mitigación |
|---|---|
| Abandonar el proyecto por falta de progreso visible | Dividir todo en tareas de 1-3 días máximo, usar Trello/Notion, celebrar micro-hitos |
| Balance de personajes roto (uno es OP) | Empezar con solo 3 personajes simples, testear mucho antes de sumar más |
| Nadie descubre el juego al lanzar | Invertir en ícono/miniatura, clips virales de gameplay antes del lanzamiento |
| Cuellos de botella técnicos que la IA no resuelve sola | Aprender lo mínimo de Luau en Fase 0 para poder "leer" el código y guiar mejor a la IA |
| Depender demasiado de la autonomía del agente vía MCP y perder el control del proyecto | Revisar y jugar cada avance antes de pedir el siguiente; nunca dejar que el agente encadene cambios grandes sin que vos los pruebes en el medio |
| Scope creep (querer meter 10 personajes y 5 mapas de entrada) | Anclarse al MVP de 3 personajes / 1 mapa hasta la Beta |

---

## 7. Próximos pasos inmediatos

1. Leer este documento completo.
2. Activar la conexión MCP entre Antigravity y Roblox Studio (sección 3.1).
3. Abrir Antigravity y pegar el **Mega Prompt Master** (documento adjunto separado) como primer mensaje al agente.
4. Completar la Fase 0 antes de pedirle al agente que construya sistemas del juego real.
5. El GDD (Fase 1) ya está definido — ver el archivo GDD_Arena_Vortice.

---
*Documento generado como plan de referencia. Es un mapa flexible: se puede y se debe ajustar a medida que el proyecto avanza.*
