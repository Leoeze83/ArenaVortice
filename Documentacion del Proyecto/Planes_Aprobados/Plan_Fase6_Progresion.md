# Plan de Implementación Fase 6: Progresión, Tienda y Sistema de Salas 🚀

Este plan detalla cómo implementaremos los sistemas solicitados de experiencia (XP), monedas, guardado de datos (DataStore) y el flujo completo de Lobby / Matchmaking para "Arena Vórtice".

## 1. Arquitectura de Archivos y Objetos a Crear/Modificar

Para lograr esto sin romper el combate actual, separaremos las responsabilidades en nuevos scripts y modificaremos el flujo del juego.

### Sistema de Progresión y DataStore
- [NEW] **`DataStoreManager`** *(Script en ServerScriptService)*: 
  - Se encargará de conectarse al `DataStoreService` de Roblox.
  - Al entrar un jugador (`PlayerAdded`), cargará sus datos: `{XP = 0, Level = 1, Monedas = 0, PersonajesDesbloqueados = {"Grom", "Yssa", "Kael"}}`.
  - Al salir (`PlayerRemoving`), guardará sus datos.
  - Otorgará una carpeta `leaderstats` al jugador para que el Nivel se vea en la tabla de clasificación nativa de Roblox.
- [MODIFY] **`GameManager`** *(Script en ServerScriptService)*: 
  - Se modificará la función de fin de partida. Al detectar un equipo ganador, enviará una orden al `DataStoreManager` para sumar 50 XP / 10 Monedas a los ganadores y 25 XP / 5 Monedas a los perdedores.

### Sistema de Salas (Lobby) y Matchmaking
- [NEW] **`SalaLobby`** *(Modelo en Workspace)*: 
  - Construiremos una plataforma física flotando muy alto en el cielo, lejos del cráter. Todos los jugadores aparecerán allí al entrar al juego.
- [NEW] **`LobbyManager`** *(Script en ServerScriptService)*: 
  - Controlará la máquina de estados del juego: `ESTADO_LOBBY` -> `ESTADO_PARTIDA`.
  - Sincronizará la cantidad de jugadores en la sala. Cuando haya al menos 2 jugadores (para pruebas) y estén listos, iniciará el flujo de partida.
- [MODIFY] **`LogicaSeleccion`** *(LocalScript en StarterGui)*: 
  - Se adaptará para que la selección de personajes ocurra dentro del Lobby. Una vez que el `LobbyManager` da inicio a la partida, se asignarán equipos aleatoriamente y se teletransportará a los jugadores a sus respectivas bases en el cráter.
- [NEW] **`LobbyHUD`** *(ScreenGui en StarterGui)*: 
  - Mostrará el perfil del jugador (Nivel, Monedas), la lista de jugadores en sala y los botones de **"Tienda"** y **"Salir del Lobby / Juego"**.

### Tienda Básica
- [NEW] **`TiendaPersonajes`** *(ScreenGui en StarterGui)*: 
  - Interfaz emergente con botones para comprar héroes. Como por ahora tenemos los 3 del MVP gratis, dejaremos la estructura lista con un héroe ficticio bloqueado (ej: "Héroe 4 - 100 Monedas") para probar que la compra descuenta monedas y guarda la información en el DataStore, evitando que se compre si ya se posee.

## 2. Flujo de Juego Propuesto

1. **Entrada:** El jugador se conecta. `DataStoreManager` carga su XP y Monedas. Aparece en la plataforma `SalaLobby` en el cielo.
2. **Espera en Lobby:** El jugador ve el `LobbyHUD`. Puede abrir la tienda, ver su nivel y esperar a otros jugadores.
3. **Inicio de Partida:** Cuando hay suficientes jugadores, el servidor anuncia "Iniciando partida". Los jugadores eligen personaje.
4. **Combate:** El servidor asigna los equipos (Rojo y Azul) y teletransporta a los jugadores a `BaseRoja` y `BaseAzul` en el Cráter Sagrado.
5. **Fin y Recompensas:** Termina el juego. Se muestran los resultados, se suma la XP/Monedas y se guarda en DataStore.
6. **Retorno:** Todos son teletransportados de vuelta a la plataforma `SalaLobby`.
