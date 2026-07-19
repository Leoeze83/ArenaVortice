# Selección de Personajes Implementada 🛡️🧙‍♂️🥷

He construido el menú inicial y el sistema de transformación (Morphing) para que dejes de ser un avatar genérico y tomes el rol de los héroes de Arena Vórtice.

## Qué se construyó

- **Menú de Selección**: Al entrar al juego, ahora verás un menú con los 3 botones: Grom, Yssa y Kael, detallando el rol de cada uno.
- **Sistema de Morphing Visual**:
  - Al elegir a **Grom (Tanque)**: Te vuelves gigante, de material rocoso gris, y más lento, con mucha más vida (150 HP).
  - Al elegir a **Yssa (Maga)**: Te vuelves azul brillante (Neón) con un aura mágica a tu alrededor, y vida más baja (80 HP).
  - Al elegir a **Kael (Asesino)**: Te vuelves de un color muy oscuro y tu velocidad de movimiento aumenta muchísimo.
- **Restricción de Combate por Clase**:
  - Grom y Kael solo pueden hacer ataques cuerpo a cuerpo (Clic Izquierdo).
  - Yssa solo puede disparar proyectiles (Clic Derecho).
  - Por ahora, la Súper Habilidad ("Onda Sísmica") solo le funciona a Grom si logras cargar el 100%.

*(Nota técnica: En lugar de usar modelos aleatorios de la Toolbox que suelen estar rotos y no funcionan bien con las animaciones, armé un sistema nativo que modifica las proporciones, materiales y partículas de tu propio avatar. Esto es **mucho más robusto** y garantiza que el juego no se rompa mientras testeamos, pero cumple con darles un aspecto único y llamativo).*

## Cómo Probarlo

1. Dale al botón **Play (▶️)** en Roblox Studio.
2. La pantalla estará borrosa y verás el nuevo menú "ELIGE TU HÉROE".
3. Haz clic en **Grom**, **Yssa** o **Kael**.
4. Verás cómo tu personaje cambia de tamaño, color y efectos visuales al instante.
5. Prueba atacar: si elegiste a Yssa, verás que solo dispara. Si elegiste a Grom, verás que eres una gran mole de piedra que pega de cerca.
