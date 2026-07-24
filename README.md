<div align="center">

  <img src="Material_Marketing_Lanzamiento/Miniatura_Juego.png" alt="Arena Vórtice Banner" width="100%" style="border-radius: 12px; margin-bottom: 20px;">

  # ⚔️ ARENA VÓRTICE ⚔️
  **3v3 Tactical Action Brawl — Roblox Edition**

  [![Roblox Version](https://img.shields.io/badge/Roblox-v1.2%20LIVE-00A2FF?style=for-the-badge&logo=roblox&logoColor=white)](https://www.roblox.com)
  [![Ranked Season](https://img.shields.io/badge/Season_1-Cristales_del_Vórtice-FFD700?style=for-the-badge&logo=target&logoColor=black)](#-season-pass--temporada-1)
  [![No Pay To Win](https://img.shields.io/badge/Monetization-100%25_Cosmetic_Only-00FF88?style=for-the-badge&logo=shield&logoColor=black)](#-filosofía-de-monetización)
  [![Language](https://img.shields.io/badge/Luau-100%25-00599C?style=for-the-badge&logo=lua&logoColor=white)](#-arquitectura-técnica)

  <p align="center">
    <b>¡Lucha, captura el Núcleo Sagrado y asciende a la división Leyenda en el brawler 3v3 más dinámico de Roblox!</b>
  </p>

  <sub>Desarrollado con arquitectura escalable en Luau, física de partículas personalizada, simulación de cámara inmersiva y DataStore v1.2.</sub>

  <br/><br/>

</div>

---

## ⚡ Novedades de la Versión 1.2

> [!IMPORTANT]
> **¡La Versión 1.2 ya está disponible!** Esta actualización transforma *Arena Vórtice* en una experiencia competitiva de nivel esport.

* 🏔️ **Nuevo Mapa:** *Las Minas de Cristal* (Arena subterránea con desniveles y cristales bioluminiscentes).
* 🏆 **Modo Ranked 3v3:** Sistema ELO con 5 divisiones (Bronce 🥉 a Leyenda 👑).
* 🎁 **Pase de Temporada:** 10 Niveles de recompensas en Monedas, Gemas y la Skin Exclusiva *Kael Sombra de Cristal*.
* 🎆 **Game Feel Premium:** VFX de impacto por héroe, *Screen Shake* dinámico al usar Súper y variación aleatoria de tono de audio (±10%).

---

## 🎮 Roster de Héroes

| Héroe | Rol | Ataque Básico | Súper Habilidad | Efectos Visuales (VFX) |
| :---: | :---: | :---: | :---: | :---: |
| <img src="Material_Marketing_Lanzamiento/Icono_Juego.png" width="60"><br/>**Grom** | 🛡️ Tanque | **Melee pesado**<br/>*(20 daño)* | **Onda Sísmica**<br/>*Knockback en área (15 studs) + 40 daño* | Chispas de rocas, polvo y grietas en tierra |
| <img src="Material_Marketing_Lanzamiento/Icono_Juego.png" width="60"><br/>**Yssa** | 🔮 Maga Control | **Rayo místico**<br/>*(15 daño)* | **Tormenta Embotellada**<br/>*Zona de rayos en área por 3s (48 daño total)* | Destello eléctrico y chispas azul neón |
| <img src="Material_Marketing_Lanzamiento/Icono_Juego.png" width="60"><br/>**Kael** | 🗡️ Asesino | **Dagas de sombra**<br/>*(20 daño)* | **Golpe Fantasma**<br/>*1.5s Invisibilidad + Daño Doble (x2)* | Ráfaga de aura púrpura y sombras |
| <img src="Material_Marketing_Lanzamiento/Icono_Juego.png" width="60"><br/>**Pyra** | 🔥 Maga Fuego | **Esfera de fuego**<br/>*(15 daño)* | **Infierno Vorticista**<br/>*Anillo circular de fuego por 4s (10 dps)* | Llamaradas y chispas de fuego naranja |

---

## 🏆 Sistema de Liga & Rangos (Ranked 3v3)

Asciende de rango ganando partidas competitivas. El sistema calcula tus **RankPoints (RP)** automáticamente tras cada combate:
* **Victoria:** `+25 RP` + `50 XP` + `10 Monedas`
* **Derrota:** `-15 RP` + `25 XP` + `5 Monedas`

```text
 🥉 Bronce (0 - 299 RP) ➔ 🥈 Plata (300 - 599 RP) ➔ 🥇 Oro (600 - 999 RP) ➔ 💎 Diamante (1000 - 1499 RP) ➔ 👑 Leyenda (1500+ RP)
```

---

## 🎁 Season Pass — Temporada 1: *"Cristales del Vórtice"*

<div align="center">
  <img src="Material_Marketing_Lanzamiento/Banner_Tienda.png" alt="Banner Tienda Arena Vórtice" width="90%" style="border-radius: 10px;">
</div>

- **Línea Gratuita:** Recompensas de Monedas (`50🪙` a `500🪙`) acumulando XP de batalla.
- **Línea Premium (150 💎):** Desbloquea Gemas adicionales y el cosmético legendario **Kael Sombra de Cristal**.

---

## 💎 Filosofía de Monetización: 100% No Pay-To-Win

> [!TIP]
> En *Arena Vórtice*, **el dinero no compra victorias**. Todos los cosméticos (Skins como *Grom Dorado*, *Yssa Sombría* o *Kael Cristal*) modifican únicamente la estética, colores y materiales en `GestorClases`, sin alterar la vida, velocidad ni daño del personaje.

---

## 🗺️ Arenas de Combate

<div align="center">
  <img src="Material_Marketing_Lanzamiento/Teaser_SuperHabilidades.png" alt="Teaser Habilidades" width="90%" style="border-radius: 10px;">
</div>

1. 🏛️ **El Cráter Sagrado:** Plataforma central elevada con ruinas ancestrales y atardecer místico.
2. ⛏️ **Las Minas de Cristal:** Mina subterránea con desniveles, altares de captura y cristales bioluminiscentes.

---

## 🛠️ Arquitectura Técnica & Servicios

El proyecto utiliza una arquitectura limpia cliente-servidor orientada a eventos:

- `DataStoreService`: Persistencia segura de XP, Nivel, Monedas, Gemas, Rangos RP e Inventario de Skins.
- `MarketplaceService`: Validación de recibos de compra en servidor con `ProcessReceipt`.
- `RunService` & `Raycasting`: Algoritmo de cámara top-down con transparencia dinámica de muros en tiempo real.
- `TweenService` & `Debris`: Simulación de partículas, números flotantes de daño (*Damage Numbers*) y *Screen Shake*.

---

## 📁 Estructura del Repositorio

```text
ArenaVortice/
├── ArenaVortice.rbxl                       # Proyecto principal de Roblox Studio
├── README.md                               # Documentación interactiva del repositorio
├── .agents/                                # Directivas y reglas de desarrollo con IA (AGENTS.md)
│   └── AGENTS.md
├── Doc_inicial/                            # Documentación de diseño inicial
│   ├── Vers. 1.0/                          # GDD y Plan Estratégico inicial
│   ├── Vers. 1.1/
│   └── Vers. 1.2/
├── Documentacion del Proyecto/             # Historial de cambios, estados y planes
│   └── Planes_Aprobados/
│       ├── Vers. 1.0/                      # Planes y Walkthroughs del MVP
│       ├── Vers. 1.1/                      # Game Feel, VFX y 4º Héroe Pyra
│       └── Vers. 1.2/                      # 2º Mapa, Ranked 3v3 y Season Pass
└── Material_Marketing_Lanzamiento/          # Assets promocionales en alta resolución
    ├── Icono_Juego.png                     # Ícono oficial (1:1)
    ├── Miniatura_Juego.png                 # Thumbnail de portada (16:9)
    ├── Banner_Tienda.png                   # Banner publicitario de la tienda
    ├── Teaser_SuperHabilidades.png         # Teaser gráfico de habilidades
    └── Marketing_Kit.md                    # Textos promocionales y hashtags SEO
```

---

## 💻 Desarrollo Local en Roblox Studio

1. **Clonar o descargar** este repositorio en tu equipo.
2. Abre el archivo **`ArenaVortice.rbxl`** con **Roblox Studio**.
3. Asegúrate de habilitar el acceso a la API en:  
   `Game Settings ➔ Security ➔ Enable Studio Access to API Services`
4. Presiona **Play (F5)** para simular el ciclo completo de juego:  
   `Lobby ➔ Selección de Héroe ➔ Combate ➔ Resultados & RP ➔ Return to Lobby`

---

<div align="center">

  **Desarrollado con ❤️ para la comunidad de Roblox**  
  *© 2026 Arena Vórtice Team. Todos los derechos reservados.*

</div>
