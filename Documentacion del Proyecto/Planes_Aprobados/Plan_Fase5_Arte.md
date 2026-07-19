# Plan de Implementación Fase 5: Arte y Decoración del Mapa 🎨

Este plan detalla el reemplazo del entorno "greybox" (bloques grises) por activos visuales definitivos para el mapa **"El Cráter Sagrado"**, dándole una estética moderna, estilizada y temática, acorde al lore de Arena Vórtice y de estilo *Brawl Stars / League of Legends*.

## Propuesta Temática
"El Cráter Sagrado" será un antiguo anfiteatro natural formado por el impacto de un meteorito arcano. La paleta de colores será muy vibrante y saturada para asegurar visibilidad top-down. El estilo será "Low-Poly" estilizado.

## Cambios Aprobados

### 1. El Entorno (El Cráter)
* **PisoArena**: Pasará de ser un cilindro liso gris a un cilindro con material `Grass` (Césped) o `Slate` con colores tierra cálidos.
* **Muros del Cráter (Paredes)**: Se generará un anillo montañoso alrededor de todo el borde del piso usando múltiples rocas gigantes (piezas irregulares) para encerrar la arena visual y físicamente, dándole el verdadero aspecto de un cráter cerrado.

### 2. Zonas Centrales y Bases
* **PisoZonaCentral**: Se convertirá en un **Altar Ancestral**. Será una plataforma de piedra pulida, con escalones y formas geométricas, resaltando fuertemente el lugar donde aparece el Núcleo.
* **Bases de Equipo (Roja/Azul)**: En lugar de plataformas rectangulares básicas, serán campamentos o bastiones:
  - Base Azul: Construcciones de piedra con elementos mágicos de cristal azul y estandartes.
  - Base Roja: Construcciones de piedra volcánica con antorchas o elementos rojos y estandartes.
  - Los `SpawnLocations` serán invisibles, integrados en la decoración del suelo.

### 3. Coberturas (Obstáculos)
* **Coberturas (1 al 4)**: Tema **Ruinas de Piedra** (Pilares rotos y bloques ancestrales caídos).

### 4. Iluminación y Atmósfera (Lighting)
* **Lighting (Roblox)**: Tema **Atardecer Místico** (Cielo anaranjado/púrpura, ambiente épico y sombras más suaves).
  - Se añadirá `ColorCorrection` para aumentar el contraste y hacer los colores mucho más vibrantes y "jugosos".
  - Se añadirá un cielo (`Sky`) con atmósfera estilizada.
  - Se añadirá `Bloom` (Resplandor) suave para que los efectos de las habilidades destaquen como en un juego profesional.
