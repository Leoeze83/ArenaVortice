# Plan de Implementación: Habilidades y HUD (Fase 3)

Este plan detalla cómo vamos a implementar la interfaz en pantalla (HUD), el sistema que recarga tu Súper al golpear, y la primera habilidad especial del juego.

## Propuesta Técnica

### 1. Interfaz del Combate (HUD)
Crearemos una `ScreenGui` en `StarterGui` que contendrá:
- **Barra de Vida**: Una barra verde sobre fondo rojo en la parte inferior de la pantalla que se achica cuando recibís daño (leyendo directamente la propiedad `Health` de tu personaje).
- **Barra de Súper**: Una barra amarilla al lado de la vida que se irá llenando de 0 a 100%.

### 2. Sistema de Carga de Súper (Servidor ↔ Cliente)
- Modificaremos el `ServidorCombate`. Cada vez que logres impactar a un enemigo con un ataque, el servidor te otorgará **25% de carga de Súper**.
- Esto significa que con **4 golpes acertados**, tu Súper estará listo.
- El servidor le avisará a tu `ControlesCombate` (cliente) para que actualice la barra amarilla en tu HUD.

### 3. Súper Habilidad de Prueba: "Onda Sísmica" (Grom)
Para probar que el sistema funciona, vamos a programar la habilidad definitiva del tanque Grom:
- **Activación**: Al presionar la tecla **'E'**, si tu barra está al 100%, tu cliente manda la señal al servidor.
- **Efecto (Servidor)**: El servidor crea una explosión invisible alrededor de tu personaje (Área de Efecto / AOE).
- **Impacto**: Cualquier enemigo en ese radio recibe gran daño (ej: 40 pts), es **empujado hacia atrás** (Knockback), y queda **aturdido** por 1.5 segundos (sin poder moverse).
- Al usarla, tu barra de Súper vuelve a 0%.
