# Plan de Implementación: Selección de Personajes (Fase 3)

Este plan aborda el último punto mecánico de la Fase 3 y comienza a resolver el aspecto visual del juego.

## Propuesta Técnica

### 1. Vida Visual: Modelos 3D de la Toolbox
Para dejar atrás los avatares estándar y las figuras geométricas, buscaré e insertaré 3 modelos 3D gratuitos y populares de la **Toolbox de Roblox** que encajen con nuestras clases:
- **Grom (Tanque)**: Un modelo de Golem o Guerrero con armadura pesada.
- **Yssa (Distancia)**: Un modelo de Maga o Arquera.
- **Kael (Asesino)**: Un modelo de Ninja o Pícaro ágil.

### 2. Interfaz de Selección (Menú Principal)
Crearemos una nueva `ScreenGui` que aparecerá apenas entres al juego, antes de nacer en el mapa:
- La cámara mostrará una vista lejana y borrosa de la arena.
- Habrá 3 botones grandes y estilizados para elegir entre Grom, Yssa o Kael.
- Al hacer clic, el botón enviará tu elección al servidor y la pantalla desaparecerá.

### 3. Lógica de "Morph" y Habilidades
- El servidor recibirá tu elección, te asignará a un equipo, y **reemplazará tu personaje de Roblox por el Modelo 3D** que elegiste (haciendo un "Morph").
- Le asignará a tu jugador un valor (`StringValue`) indicando la clase elegida.
- **El script de combate se actualizará**: Grom solo podrá hacer el Clic Izquierdo (Melee) y la Onda Sísmica. Yssa solo hará Clic Derecho (Proyectil).
