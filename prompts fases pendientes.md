🎯 Prompt para la Fase 6: Sistema de Progresión (XP y Monedas)
text
Rol: Actúa como mi programador senior de Roblox. Vamos a implementar el sistema de progresión básico para "Arena Vórtice". Ya tenemos el modo de juego "Control de Núcleo" funcionando. Ahora necesito que los jugadores ganen experiencia (XP) y monedas al final de cada partida, y que esto se refleje en su perfil.

OBJETIVO ESPECÍFICO:

1. Sistema de XP y Niveles:
   - Al finalizar cada partida (cuando se muestra la pantalla de resultados), otorgar:
     - Equipo ganador: 50 XP
     - Equipo perdedor: 25 XP
   - Cada 100 XP acumulados, subir de nivel.
   - Mostrar el nivel del jugador en una "leaderstats" (tabla de clasificación) visible en el lobby o en la interfaz de partida.
   - Guardar el progreso del jugador usando el sistema de DataStore de Roblox (para que al salir y entrar no se pierda la experiencia).

2. Sistema de Monedas (moneda blanda):
   - Al finalizar cada partida, otorgar 10 monedas al equipo ganador y 5 al perdedor.
   - Mostrar la cantidad de monedas en la interfaz del jugador.
   - Guardar el saldo de monedas en DataStore.

3. Tienda básica de personajes:
   - Crear una tienda simple donde los jugadores puedan desbloquear personajes adicionales con monedas.
   - Por ahora, solo los 3 personajes del MVP están disponibles, pero dejar la estructura para agregar más.
   - Cada personaje cuesta 100 monedas (valor de ejemplo, ajustable).

INSTRUCCIONES DE IMPLEMENTACIÓN:

1. Antes de empezar, dime qué archivos y objetos vas a modificar o crear (ej: Script en ServerScriptService, LocalScript en StarterGui, etc.).
2. Implementa el sistema paso a paso, empezando por el guardado en DataStore (es la base para todo).
3. Usa comentarios en español en todo el código Luau, explicando qué hace cada bloque.
4. Después de implementarlo, ejecuta el modo Play para verificar que no haya errores en la consola.
5. Dame instrucciones claras sobre cómo probar el sistema yo mismo: qué debo mirar en la interfaz, cómo verificar que el nivel sube, etc.

CONTEXTO ADICIONAL:

- El sistema de DataStore requiere que el juego esté publicado. Si aún no lo hemos hecho, avísame y trabajaremos con una simulación local primero.
- La interfaz de la tienda puede ser básica: unos botones con el nombre del personaje y su precio.
- Asegúrate de que ningún jugador pueda desbloquear un personaje que ya tiene.

¿Estás listo para empezar?
🎯 Prompt para la Fase 6b: Sistema de Salas / Matchmaking Básico
text
Rol: Como programador de Roblox, necesito implementar un sistema de salas para que los jugadores puedan unirse a partidas de "Arena Vórtice" con amigos. Esto debe ser simple y funcional para las pruebas beta.

OBJETIVO:

1. Crear un lobby (sala de espera) donde los jugadores puedan:
   - Ver una lista de partidas disponibles (o crear una nueva).
   - Unirse a una partida existente.
   - Ver cuántos jugadores hay en cada partida (máximo 6).
   - Iniciar la partida cuando haya al menos 2 jugadores (1 por equipo).

2. Sistema de asignación de equipos:
   - Al iniciar la partida, repartir a los jugadores en 2 equipos (Rojo y Azul) de forma aleatoria o manual.
   - Si hay menos de 2 jugadores, mostrar un mensaje: "Esperando más jugadores..."

3. Flujo de juego:
   - Lobby → Selección de personaje → Partida (Control de Núcleo) → Pantalla de resultados → Volver al lobby.

INSTRUCCIONES DE IMPLEMENTACIÓN:

1. Reutiliza el sistema de selección de personaje que ya tienes, pero conéctalo al nuevo flujo del lobby.
2. Usa RemoteEvents para sincronizar el estado del lobby entre todos los jugadores.
3. El servidor debe ser el "dueño" de la partida: controlar quién entra, quién sale, y cuándo empieza el juego.
4. Asegúrate de que los jugadores que se unan a una partida en curso no puedan entrar (deben esperar a la siguiente).
5. Agrega un botón "Salir del Lobby" que devuelva al jugador a la pantalla principal.

¿Cómo planeas estructurar esto? Dime tu enfoque antes de codificar.


🎯 Prompt para la Fase 7: Monetización (Gamepasses y DevProducts)
text
Rol: Vamos a implementar la monetización básica para "Arena Vórtice". Quiero que los jugadores puedan comprar Gemas (moneda dura) y usarlas en una tienda cosmética.

OBJETIVO:

1. Configurar DevProducts para la compra de Gemas:
   - Crear 3 paquetes de Gemas:
     - Paquete Pequeño: 100 Gemas por 80 Robux.
     - Paquete Mediano: 300 Gemas por 200 Robux.
     - Paquete Grande: 800 Gemas por 500 Robux.
   - El proceso de compra debe ser seguro: usar `MarketplaceService.ProcessReceipt` para validar las compras.

2. Tienda de Skins (cosméticos):
   - Crear una tienda donde los jugadores puedan gastar Gemas para comprar skins de personajes.
   - Cada skin cuesta 50 Gemas (ejemplo).
   - Los skins son puramente visuales: cambian el color o añaden accesorios, pero no alteran las estadísticas.

3. Validación de "No Pay-to-Win":
   - Asegurarse de que ningún ítem comprado con Robux dé ventaja competitiva.
   - Documentar esto claramente en la descripción del juego.

INSTRUCCIONES DE IMPLEMENTACIÓN:

1. Usa el sistema de DataStore para guardar las Gemas y los skins desbloqueados por cada jugador.
2. La interfaz de la tienda debe ser simple y clara: mostrar el precio en Gemas y un botón "Comprar".
3. Al comprar un skin, debe aplicarse automáticamente al personaje del jugador en la siguiente partida.
4. Prioriza la seguridad: verifica que el jugador tenga suficientes Gemas antes de descontarlas.

¿Tienes experiencia con MarketplaceService? Si no, te guío paso a paso. Empecemos por configurar los DevProducts.

🎯 Prompt para la Fase 8: Beta Cerrada y Pulido
text
Rol: Estamos listos para preparar la beta cerrada de "Arena Vórtice". Necesito pulir el juego y preparar todo para el lanzamiento.

OBJETIVOS ESPECÍFICOS:

1. Estabilidad y Bugs:
   - Revisar la consola de Roblox Studio en busca de advertencias o errores ("Infinite yield", "attempt to index nil", etc.).
   - Asegurarse de que todos los RemoteEvents estén correctamente emparejados (cliente-servidor).
   - Verificar que no haya fugas de memoria (eventos que se conectan y nunca se desconectan).

2. Feedback y Balance:
   - Implementar un sistema de registro de partidas (logs) para ver:
     - Qué personaje ganó más partidas.
     - Cuánto duran las partidas en promedio.
     - Qué habilidades se usan más.
   - Ajustar valores de daño/vida en base a los datos.

3. Arte y Sonido Final:
   - Reemplazar cualquier placeholder visual que quede por el arte final.
   - Añadir efectos de sonido para:
     - Ataques básicos (cada personaje debe sonar distinto).
     - Súper habilidades (sonido épico al activarse).
     - Captura del núcleo (sonido de progreso y de éxito).
     - Música de fondo (una pista para el lobby y otra para la partida).

4. Preparación para Beta:
   - Crear un servidor privado para invitados (opcional, pero útil).
   - Escribir un formulario de feedback simple (Google Forms o similar).
   - Preparar un tutorial rápido para nuevos jugadores (pantalla de "Cómo jugar").

INSTRUCCIONES DE IMPLEMENTACIÓN:

1. Empieza por la estabilidad: dime qué errores encuentras en la consola y cómo piensas solucionarlos.
2. Para el sonido, usa la librería de audio de Roblox o freesound.org (sonidos libres de derechos).
3. Documenta todos los cambios en el Changelog y actualiza el Estado_Proyecto.

¿Por dónde quieres empezar? Yo te recomiendo primero la estabilidad (punto 1), luego el sonido y finalmente el feedback.
🎯 Prompt para el Lanzamiento (Fase 8b)
text
Rol: ¡Es el momento! Vamos a lanzar "Arena Vórtice" al público. Necesito ayuda con los pasos finales para que el juego esté visible y atractivo en Roblox.

OBJETIVO:

1. Ícono y Miniatura del Juego:
   - Crear un ícono llamativo que muestre a los 3 personajes principales en acción.
   - Diseñar una miniatura (thumbnail) para la página del juego que destaque el modo "Control de Núcleo".
   - Usar imágenes generadas por IA (Gemini) o capturas de pantalla editadas.

2. Descripción y Tags:
   - Escribir una descripción atractiva en español e inglés.
   - Incluir tags relevantes: "multijugador", "battle arena", "3v3", "habilidades", "gratis".

3. Estrategia de Lanzamiento:
   - Publicar el juego en Roblox.
   - Compartir clips de gameplay en TikTok y YouTube Shorts.
   - Anunciar el juego en comunidades de Roblox (Discord, Reddit, grupos de Facebook).

4. Monitoreo Post-Lanzamiento:
   - Configurar Google Analytics o el sistema de análisis de Roblox para ver el tráfico.
   - Estar atento a los comentarios y bugs reportados.

INSTRUCCIONES:

1. Ayúdame a generar ideas para el ícono y la miniatura (describí la escena que quiero representar).
2. Redacta la descripción del juego en español e inglés.
3. Dame una lista de pasos concretos para publicar el juego en Roblox (si no lo he hecho antes).

¡Empecemos por el ícono y la descripción!
💡 Consejos para Usar Estos Prompts
Sé claro con el "dónde": Si la IA no sabe exactamente dónde colocar un script, siempre dile: "En ServerScriptService", "En StarterGui", etc.

Pide explicaciones: No temas pedirle a la IA: "Explícame qué hace este bloque de código en términos simples".

Valida los resultados: Siempre prueba lo que la IA ha implementado. Si algo no funciona, descríbele el error y pídele que lo corrija.

Actualiza tus documentos: Después de cada fase, pídele a la IA que actualice el Changelog.md y el Estado_Proyecto.md con lo que han hecho. Esto es clave para no perder el hilo.

📌 Resumen Rápido: Orden de Implementación
Fase 6: Progresión (XP y Monedas) → Prompt 1

Fase 6b: Sistema de Salas → Prompt 2

Fase 7: Monetización → Prompt 3

Fase 8: Beta y Pulido → Prompt 4

Fase 8b: Lanzamiento → Prompt 5
