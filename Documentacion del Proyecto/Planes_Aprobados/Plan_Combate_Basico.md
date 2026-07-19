# Plan de Implementación: Sistema de Combate Básico

Este plan detalla cómo vamos a construir el núcleo del combate de Arena Vórtice. Dado que aún no tenemos un menú para elegir entre Grom, Kael o Yssa, implementaremos **ambos** tipos de ataque en tu personaje para que puedas probar todo.

## Propuesta Técnica

### 1. Controles de Combate (Cliente)
Crearemos un `LocalScript` que detecte tus acciones con el mouse:
- **Clic Izquierdo (Melee)**: Simulará el ataque cuerpo a cuerpo de Grom/Kael. Mandará una señal al servidor indicando la intención de atacar de cerca.
- **Clic Derecho (A distancia)**: Simulará el ataque de Yssa. Mandará una señal al servidor para disparar un proyectil hacia donde apunte tu mouse.

### 2. Árbitro de Daño (Servidor)
Crearemos un `Script` central en el servidor para evitar trampas. Este script recibirá tus clics y calculará lo que pasa:
- **Melee**: El servidor creará una "caja invisible" (Hitbox) frente a tu personaje. Si el enemigo está adentro, recibe daño (ej: 20 pts).
- **Proyectil**: El servidor generará una esfera mágica que viajará en línea recta. Si choca contra una pared, se destruye. Si choca contra un enemigo, le hace daño (ej: 15 pts).

### 3. Feedback Visual de Daño
Para que el combate se sienta impactante (estilo Brawler), cuando alguien reciba daño:
- El servidor creará un pequeño **texto rojo con el número de daño** (ej: "-20") que flotará sobre la cabeza del personaje y desaparecerá rápido.
- El personaje golpeado parpadeará en rojo por un instante.

### 4. Entorno de Prueba
Se generará un **Muñeco de Pruebas (Dummy)** del equipo contrario en el centro de la arena para poder testear el daño.
