# ⚔️ Arena Vórtice — 3v3 Tactical Battle Arena

[![Roblox Status](https://img.shields.io/badge/Roblox-v1.0%20BETA-blue?logo=roblox&logoColor=white)](https://www.roblox.com)
[![License](https://img.shields.io/badge/License-Proprietary-red)](#)
[![P2W Status](https://img.shields.io/badge/PayToWin-FREE-brightgreen)](#)

> **Arena Vórtice** es un videojuego de combate táctico multijugador 3v3 desarrollado para la plataforma Roblox. Los jugadores eligen héroes con habilidades únicas y luchan por capturar el **Núcleo Sagrado** en el centro de un cráter místico.

---

## 🌟 Características Principales

- 🛡️ **3 Héroes Únicos:**
  - **Grom (Tanque):** Goliath de piedra lento con alta salud y la súper habilidad *Onda Sísmica* (onda expansiva en área y knockback).
  - **Yssa (Maga):** Controladora de campo con la súper habilidad *Tormenta Embotellada* (zona de daño por rayos persistente por 3s).
  - **Kael (Asesino):** Atacante veloz con la súper habilidad *Golpe Fantasma* (1.5s de invisibilidad y multiplicador de daño x2).
- 🎯 **Modo "Control de Núcleo":** Captura por proximidad 2D con rotación de altares y sistema de disputa entre equipos.
- 💎 **Monetización Ética (No Pay-to-Win):** Tienda cosmética con Gemas (moneda dura) y Monedas (moneda blanda). Los skins como *Grom Dorado* o *Yssa Sombría* son 100% estéticos.
- 🚀 **Matchmaking & Lobby:** Sistema de salas flotantes con cuenta regresiva, selección de clase y transiciones limpias.

---

## 📁 Estructura del Proyecto

```text
ArenaVortice/
├── ArenaVortice.rbxl                # Archivo principal de Roblox Studio (Lugar/Place)
├── README.md                        # Documentación del repositorio
├── .agents/                         # Reglas y directivas de desarrollo con Inteligencia Artificial
│   └── AGENTS.md
├── Doc_inicial/                     # Documentación de diseño inicial (GDD, Plan Estratégico)
│   └── Vers. 1.0/
├── Documentacion del Proyecto/      # Historial de cambios, estados y planes
│   └── Planes_Aprobados/
│       ├── Plan_Cierre_v1.0_y_SuperHabilidades.md
│       ├── Walkthrough_Cierre_v1.0.md
│       └── Vers. 1.0/               # Historial archivado de versiones anteriores
└── Material_Marketing_Lanzamiento/   # Assets gráficos, miniaturas e íconos promocionales
    ├── Icono_Juego.png
    ├── Miniatura_Juego.png
    └── Marketing_Kit.md
```

---

## 🛠️ Tecnologías y Arquitectura

- **Lenguaje:** Luau (Roblox Studio)
- **Servicios Clave:**
  - `DataStoreService`: Persistencia de nivel, XP, monedas, gemas e inventario de skins.
  - `MarketplaceService`: Procesamiento seguro de microtransacciones (`ProcessReceipt`).
  - `TweenService` & `Debris`: Visuales de habilidades, textos flotantes de daño y animación UI.
  - `RunService` & `Raycasting`: Detección precisa de disparos y colisiones mecatrónicas.

---

## 🎨 Material de Marketing

Los recursos gráficos oficiales (íconos 1:1, miniaturas 16:9 y descripciones bilingües) se encuentran organizados dentro del directorio [`Material_Marketing_Lanzamiento/`](file:///C:/Users/LEO/Downloads/ArenaVortice/Material_Marketing_Lanzamiento/).

---

## 💻 Desarrollo Local y Pruebas

1. Abre el archivo [`ArenaVortice.rbxl`](file:///C:/Users/LEO/Downloads/ArenaVortice/ArenaVortice.rbxl) en **Roblox Studio**.
2. En la pestaña **Home**, asegúrate de tener activada la opción `Game Settings -> Security -> Enable Studio Access to API Services` para probar el DataStore localmente.
3. Presiona **Play (F5)** para iniciar la simulación del Lobby y la Batalla.
