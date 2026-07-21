# Walkthrough: Progresión, Tienda y Sistema de Salas (Fase 6) 🚀

La Fase 6 ha concluido exitosamente. Ahora "Arena Vórtice" cuenta con un flujo completo de juego real, con salas de espera y sistema de guardado en base de datos.

## 1. El Lobby de Espera (Matchmaking Básico)
* **La Sala Física:** Hemos construido una plataforma transparente ("SalaLobby") flotando muy alto en el cielo, lejos del cráter. Al entrar al juego, todos los jugadores aparecen aquí por defecto (equipo Neutral).
* **El HUD del Lobby:**
  * Arriba a la derecha verás cuántos jugadores hay en la sala.
  * A la izquierda verás tu Nivel y Monedas.
  * Tienes un botón gigante verde para **"INICIAR PARTIDA"** (Por ahora permite iniciar estando tú solo para facilitar las pruebas, pero internamente está programado para poder exigir 2 o más jugadores).

## 2. Flujo de Juego
1. Al hacer clic en "Iniciar Partida", el botón cambia, el LobbyHUD desaparece y se abre la **Pantalla de Selección de Personajes**. Tienes 10 segundos para elegir.
2. Una vez elegido el personaje, el sistema te teletransporta al Cráter Sagrado (a tu respectiva base), te asigna un equipo, y arranca el cronómetro de la partida.
3. Al terminar los 4 minutos o llegar a 3 puntos, la partida anuncia al ganador.
4. Tras 5 segundos, **todos los jugadores son curados y teletransportados de vuelta al Lobby** para iniciar otra partida.

## 3. DataStore, XP y Monedas
* Hemos creado el **`DataStoreManager`**. Este script seguro carga tu perfil cuando entras y lo guarda cuando sales.
* **Recompensas:** Al terminar una partida:
  * Si tu equipo ganó: Ganas **50 XP** y **10 Monedas**.
  * Si tu equipo perdió (o empataste): Ganas **25 XP** y **5 Monedas**.
* **Nivel:** Por cada 100 XP, tu Nivel sube. Puedes ver tu nivel en la esquina superior derecha nativa de Roblox (Leaderboard) y en tu perfil del Lobby.

## 4. Tienda de Personajes
* Hemos agregado un botón de **"🛒 TIENDA"** en el Lobby.
* Al abrirlo, verás los 3 héroes iniciales (Grom, Yssa, Kael) marcados como "OBTENIDO" porque ya los tienes por defecto.
* Hemos añadido a "Lumina" como un personaje de prueba que cuesta **100 Monedas**. Si ganas unas cuantas partidas y consigues 100 monedas, ¡podrás probar el botón de compra!

---
> [!TIP]
> **CÓMO PROBAR TODO ESTO:**
> 1. Dale a **Play** en Roblox Studio.
> 2. Deberías aparecer en el cielo, en la nueva plataforma transparente.
> 3. Haz clic en **Iniciar Partida**.
> 4. Elige a Grom, Kael o Yssa.
> 5. Serás teletransportado a la base en el Cráter Sagrado.
> 6. Para **acelerar las pruebas**, detén el juego, abre `GameManager` y cambia `local TIEMPO_PARTIDA = 240` a `local TIEMPO_PARTIDA = 15`. Dale Play de nuevo y deja que el tiempo se acabe para que veas cómo ganas 25 XP (por empate), te devuelven al Lobby y el Nivel se actualiza.
