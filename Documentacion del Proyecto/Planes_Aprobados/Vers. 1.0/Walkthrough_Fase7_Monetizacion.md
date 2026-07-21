# Walkthrough Fase 7: Sistema de Monetización 💎

¡Hemos completado la Fase 7! El sistema de monetización, la tienda de skins y la arquitectura de moneda dura ya están operativas.

## 💎 ¿Qué hay de nuevo?

- **Gemas (Moneda Dura):**
  - Ahora tienes una moneda Premium (Gemas) guardada en tu DataStore que viaja contigo, mostrada en el LobbyHUD de manera persistente.
  - El `MonetizacionManager` intercepta transacciones reales de Roblox usando `MarketplaceService` y te recompensa con la cantidad de Gemas que compras.

- **Tienda Premium de 3 Pestañas:**
  - El botón "TIENDA" del Lobby ahora abre una ventana completamente rediseñada.
  - **Héroes:** Desbloqueo de clases.
  - **Skins:** Tienda cosmética (ej. Grom Dorado e Yssa Sombría).
  - **Gemas:** Tienda de microtransacciones.
  
- **Skins Cosméticos (Cero Pay-To-Win):**
  - Los skins modifican el `Color3` y `Material` de las piezas de tu Héroe a través del `GestorClases`, además de los colores de las partículas.
  - NO cambian la salud, ni el rango, ni la velocidad ni el daño, garantizando que todo sea puramente estético y mantenga el juego balanceado.

---

## 🛠️ Instrucciones para Testear

1. Dale a **Play** (▶️) en Roblox Studio.
2. Abre la **Tienda** en el Lobby.
3. Dirígete a la pestaña de **Gemas**.
4. Haz clic en cualquier paquete. Aparecerá un cartel nativo de Roblox Studio diciendo *"Test Purchase"*. Dale a "Buy".
5. ¡Magia! Tus Gemas en el HUD se sumarán instantáneamente (porque `MonetizacionManager` aprobó la compra).
6. Dirígete a la pestaña de **Skins** y compra "Grom Dorado" por 50 Gemas. Tus Gemas se descontarán.
7. Haz clic de nuevo para **Equipar**.
8. Inicia la partida. ¡Tu héroe será un reluciente Grom de neón dorado!

> [!WARNING]
> Recuerda que los botones de Gemas actualmente usan **Mock IDs** (111111111, etc.).
> Cuando publiques el juego, deberás ir a la configuración web de Roblox, crear 3 "Developer Products", y reemplazar esos números dentro del archivo `StarterGui.TiendaPersonajes.TiendaClient` en la parte de abajo, y en `ServerScriptService.MonetizacionManager` en la parte de arriba.
