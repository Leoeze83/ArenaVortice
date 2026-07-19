# Combate Básico Implementado ⚔️

He construido el núcleo del sistema de combate en tu juego. Ahora puedes moverte, atacar de cerca, disparar proyectiles y ver el daño.

## Qué se construyó

- **Muñeco de Pruebas (DummyPruebas)**: Ubicado en el centro del mapa, pertenece al "Equipo Rojo" para que puedas atacarlo si juegas en el Azul.
- **Ataque Cuerpo a Cuerpo (Clic Izquierdo)**: Tu personaje se gira automáticamente hacia donde apunta tu mouse y ataca en un cono frente a ti.
- **Ataque a Distancia (Clic Derecho)**: Disparas una esfera de energía hacia donde apuntas con el mouse. Si choca contra el Dummy, le hace daño. Si choca contra una pared, se destruye.
- **Feedback Visual**: 
  - Al recibir daño, el enemigo parpadea en **rojo**.
  - Aparece un **número rojo** flotando sobre su cabeza (ej. "-20" o "-15") indicando el daño recibido.

## Cómo Probarlo

1. Dale al botón **Play (▶️)** en Roblox Studio.
2. Camina usando `W, A, S, D` hasta acercarte al Dummy amarillo en el centro.
3. Haz **Clic Izquierdo** apuntando hacia él para ver el ataque cuerpo a cuerpo (quita 20 de vida).
4. Aléjate un poco, apunta hacia él y haz **Clic Derecho** para disparar un proyectil (quita 15 de vida).
5. Observa cómo aparecen los números y parpadea el enemigo al recibir el golpe.

*(Nota: Si juegas en el Equipo Rojo, el sistema sabrá que el Dummy también es de tu equipo y **no** le harás daño gracias a la protección de fuego amigo. Para testearlo, asegúrate de salir y entrar hasta caer en el Equipo Azul).*
