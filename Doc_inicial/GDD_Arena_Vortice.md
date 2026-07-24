# GDD — Documento de Diseño del Juego
## ARENA VÓRTICE

---

## 1. Concepto en una frase
Combates arcade 3v3 en arenas cerradas, con personajes de fantasía única (rol, lore, estilo visual) y habilidades rápidas de ejecutar, al estilo Brawl Stars, pero con la identidad y peso de campeón propio de League of Legends.

## 2. Género y plataforma
- Género: Battle Arena / Brawler multijugador en tiempo real.
- Plataforma: Roblox (PC, mobile y consola vía Roblox).
- Cámara: Top-down ligeramente angulada (estilo Brawl Stars), fácil de programar y de leer en pantallas chicas de celular.

## 3. Modo de juego principal (MVP)
**Escaramuza 3 vs 3 — "Control de Núcleo"**
- Dos equipos de 3 jugadores.
- En el centro del mapa aparece un **Núcleo de Energía** cada 45 segundos.
- El equipo que lo mantiene "capturado" (parado cerca sin interrupción) 10 segundos suma 1 punto.
- Gana el primer equipo en llegar a **3 puntos**, o el que tenga más puntos cuando se acaba el tiempo (4 minutos).
- Al morir, el jugador respawnea en 5 segundos cerca de su base.

Por qué este modo: es más simple de programar que un "todos contra todos" con ranking de kills, da partidas cortas (ideal para retención mobile), y genera peleas alrededor de un punto central sin necesitar IA de bots ni sistemas complejos de matchmaking por rango.

## 4. Loop de una partida (core loop)
1. Selección de personaje (10 segundos).
2. Aparición en la base del equipo.
3. Moverse, pelear, usar ataque básico y esquivar.
4. Cargar la barra de Súper Habilidad recibiendo o haciendo daño (igual que Brawl Stars).
5. Disputar el Núcleo de Energía cuando aparece.
6. Repetir hasta que un equipo llega a 3 puntos o se acaba el tiempo.
7. Pantalla de resultados: XP ganada, monedas ganadas, progreso de personaje.

## 5. Mapa inicial — "El Cráter Sagrado"
- Arena simétrica, forma circular u octogonal.
- Dos bases opuestas (una por equipo), cada una con un pequeño obstáculo de cobertura.
- Centro abierto con el punto del Núcleo de Energía.
- 4 zonas de cobertura (rocas/pilares) distribuidas simétricamente para que ningún equipo tenga ventaja de posición.
- Sin desniveles al inicio (los desniveles se agregan en mapas futuros, no en el MVP).

## 6. Personajes iniciales (3 para el MVP)

### 6.1 Grom, el Coloso de Piedra — Rol: Tanque
- **Lore breve:** Un guerrero ancestral fusionado con la roca de la arena tras siglos de combate. Pelea no por gloria, sino porque ya no sabe hacer otra cosa.
- **Personalidad visual:** Grande, lento, macizo. Colores tierra (marrón, gris piedra, detalles naranjas tipo lava).
- **Ataque básico:** Golpe cuerpo a cuerpo de corto alcance, daño medio, cooldown corto.
- **Movilidad:** Ninguna especial (es lento a propósito), pero tiene más vida base que el resto.
- **Súper habilidad — "Onda Sísmica":** Golpea el suelo y empuja a los enemigos cercanos, aturdiéndolos 1 segundo.
- **Rol en equipo:** Aguanta en el frente, protege a los aliados de rango, inicia peleas.

### 6.2 Yssa, la Tejedora de Tormentas — Rol: Daño a distancia
- **Lore breve:** Una hechicera que aprendió a atrapar rayos en frascos de cristal para no depender de nadie. Fría, calculadora, casi nunca sonríe.
- **Personalidad visual:** Esbelta, capa azul eléctrico, detalles de cristal brillante, partículas de electricidad alrededor de las manos.
- **Ataque básico:** Proyectil de rango largo, daño bajo-medio, pero con buen alcance.
- **Movilidad:** Caminata normal, sin dash (depende de mantener distancia).
- **Súper habilidad — "Tormenta Embotellada":** Lanza un frasco que crea una zona de rayos en área durante 3 segundos, dañando a quien esté adentro.
- **Rol en equipo:** Daño sostenido desde atrás, controla el área del Núcleo de Energía a distancia.

### 6.3 Kael, el Filo Veloz — Rol: Asesino / Movilidad
- **Lore breve:** Un mercenario joven que entra a la arena por dinero rápido, no por honor. Rápido de piernas y de lengua.
- **Personalidad visual:** Delgado, ágil, colores oscuros con acentos rojos, dos dagas cortas.
- **Ataque básico:** Golpe rápido de corto alcance, daño bajo pero con cooldown muy corto (pega seguido).
- **Movilidad:** Dash corto cada pocos segundos.
- **Súper habilidad — "Golpe Fantasma":** Se vuelve invisible 1.5 segundos y su próximo golpe hace daño extra.
- **Rol en equipo:** Elimina objetivos débiles (como Yssa enemiga), se escapa de peleas perdidas, flanquea el Núcleo.

**Por qué estos 3 primero:** cubren el "triángulo clásico" tanque / daño a distancia / asesino ágil, que es el mínimo necesario para que las peleas 3v3 tengan variedad táctica real sin volverse un proyecto de arte y balance inmanejable para una sola persona.

## 7. Sistema de progresión (MVP)
- **Nivel de cuenta:** sube con XP ganada al final de cada partida (ganar da más XP que perder).
- **Monedas (moneda "blanda", se gana jugando):** se usan para desbloquear personajes nuevos sin pagar.
- **Gemas (moneda "dura", se compra con Robux):** se usan en la tienda cosmética y, más adelante, en el pase de temporada.
- Ningún personaje nuevo o cosmético afecta las estadísticas base: todo lo pago es visual o de conveniencia.

## 8. Estilo visual y de audio
- **Visual:** estilizado, colores saturados, siluetas de personaje muy legibles (fácil distinguir un personaje de otro incluso en pantalla chica de celular) — igual que Brawl Stars. El "peso" narrativo se transmite en el lore, splash art de selección de personaje, y frases de victoria/derrota, al estilo LOL.
- **Audio:** música de fondo de baja intensidad durante la selección, sube de intensidad durante la pelea. Efectos de sonido claros y diferenciados por personaje (ataque básico y súper habilidad deben sonar distinto entre sí).

## 9. Público objetivo
- Jugadores de Roblox de 10 a 16 años que ya conocen juegos como Brawl Stars, Blade Ball o Arsenal.
- Sesiones cortas (partidas de 3-4 minutos), ideal para jugar en el recreo o en el celular.

## 10. Fuera de alcance para el MVP (a futuro)
- Más de 3 personajes.
- Más de 1 mapa.
- Rankeds/ligas competitivas.
- Clanes o gremios.
- Chat de voz.

Estas features quedan documentadas para el roadmap post-lanzamiento (Fase 7 del Plan Estratégico), no para el MVP.
