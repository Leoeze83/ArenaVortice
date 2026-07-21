# Plan de Implementación: Modo de Juego "Control de Núcleo" (Fase 4 - Parte 1)

## Orden de Prioridad (Por qué esto antes que el arte)
En desarrollo de juegos, **siempre es mejor terminar la lógica central antes de decorar**. Si empezamos a poner árboles, estatuas y montañas hermosas ahora, y luego nos damos cuenta de que el modo de juego no funciona bien porque los jugadores se quedan atrapados en los árboles o no ven el núcleo, tendríamos que borrar el arte. 

Por lo tanto, **primero armaremos el Modo de Juego y dejaremos el juego 100% jugable de principio a fin**, y en la segunda parte nos dedicaremos puramente a embellecerlo con texturas y modelos 3D.

## Propuesta Técnica: Control de Núcleo

### 1. Interfaz Superior (HUD de Partida)
Agregaremos una barra en la parte superior de la pantalla que mostrará:
- **El Temporizador**: La partida dura 4 minutos (04:00).
- **El Marcador**: Puntos del Equipo Rojo vs Equipo Azul. Gana el primero en llegar a 3.

### 2. Aparición del Núcleo de Energía
- El servidor tendrá un "Director de Partida" (`GameManager`).
- Cuando empieza la partida, iniciará una cuenta regresiva.
- Cada **45 segundos**, aparecerá un pilar o esfera brillante (el "Núcleo") exactamente en la plataforma central (`ZonaNucleo`).
- Se enviará una notificación visual a todos los jugadores: *"¡El Núcleo ha aparecido!"*.

### 3. Mecánica de Captura (Zonificación)
- Para capturarlo, un equipo debe tener al menos 1 jugador parado dentro de la `ZonaNucleo`.
- **Regla de Progreso**: Tarda 10 segundos en capturarse. El daño NO interrumpe la captura.
- **Regla de Disputa**: Si hay un jugador Rojo y un jugador Azul dentro de la zona al mismo tiempo, el progreso se **congela** (Contestado) hasta que uno de los dos salga o muera.
- Habrá una barra flotante sobre la zona mostrando qué equipo está capturando y el progreso (0% a 100%).

### 4. Fin de la Partida
- Cuando un equipo captura el núcleo, se le suma 1 punto. El núcleo desaparece y comienza a contar 45 segundos para el siguiente.
- Si un equipo llega a 3 puntos, **gana**.
- Si el reloj llega a 00:00, gana el equipo con más puntos.
- Aparecerá una pantalla grande diciendo "¡GANA EQUIPO X!", y después de 5 segundos, la partida se reinicia (todos vuelven a 0 puntos, reloj a 4 minutos).
