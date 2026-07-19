# HUD y Súper Habilidad Implementados 🌟

He construido la interfaz de combate y el sistema de Súper Habilidad ("Onda Sísmica") en tu juego.

## Qué se construyó

- **HUD (Interfaz en Pantalla)**: Ahora verás dos barras en la parte inferior de tu pantalla.
  - **Barra Verde**: Tu vida actual (`Health`). Si recibes daño, bajará al instante.
  - **Barra Amarilla**: Tu carga de Súper. Comienza en 0%.
- **Sistema de Carga**: Cada vez que golpeas a un enemigo (con ataque Melee o Distancia), tu barra amarilla se llena un **25%**. 
- **Onda Sísmica (Súper)**: Cuando tu barra llegue al 100%, dirá "¡SÚPER LISTO! (Presiona E)". Al presionar **E**, desatarás una onda expansiva amarilla:
  - **Daño**: Quita 40 puntos de vida a cualquier enemigo cercano.
  - **Empuje (Knockback)**: Lanza a los enemigos hacia atrás.
  - **Aturdimiento (Stun)**: Congela la velocidad del enemigo por 1.5 segundos.

## Cómo Probarlo

1. Dale al botón **Play (▶️)** en Roblox Studio.
2. Mira abajo en tu pantalla para confirmar que ves las barras de Vida y Súper.
3. Acércate al Dummy amarillo y golpéalo **4 veces** (puedes combinar ataques cuerpo a cuerpo y proyectiles).
4. Verás cómo la barra amarilla se llena con cada golpe exitoso.
5. Cuando llegue al 100%, acércate al Dummy y presiona la tecla **E**.
6. Observa la explosión amarilla, cómo el Dummy sale volando hacia atrás y recibe un daño masivo de -40. Su barra de carga volverá a 0%.
