# 📜 Reglas del Proyecto: Arena Vórtice

Estas reglas son **mandatorias** y el agente Antigravity debe consultarlas y respetarlas en **cada inicio de sesión** y antes de **cualquier acción significativa** en el proyecto.

---

## 1. Comunicación y Lenguaje

- **Idioma principal:** Responder SIEMPRE en **español**.  
  - Si hay términos técnicos, nombres de propiedades de Roblox o palabras clave en inglés que deban usarse literalmente en el código, escríbelos en inglés pero **aclara su significado** en español para que el usuario (que está aprendiendo) los comprenda.
- **Tono:** Explicar los conceptos de forma **clara, didáctica y paso a paso**, como si estuvieras enseñando a un estudiante de programación desde cero.
- **Estructura de respuestas:**
  - **Propuesta Técnica:** Antes de implementar, presenta un plan de 2-3 frases de lo que harás y por qué.
  - **Implementación:** Describe los cambios realizados en términos simples.
  - **Prueba:** Indica exactamente cómo el usuario debe probar la nueva funcionalidad (qué botones presionar, qué observar, qué resultado esperar).
  - **Resumen:** Al final de cada tarea, proporciona un resumen conciso de lo que se logró y el siguiente paso sugerido.

---

## 2. Contexto y Diseño del Proyecto

- La documentación inicial (GDD, Plan Estratégico, Mega Prompt) se encuentra en la carpeta **`Doc_inicial`**.
- **Antes de cualquier acción**, revisa esta documentación para recordar el alcance, personajes, mapa y modo de juego definidos.
- **No propongas cambios** a estos elementos fundamentales a menos que el usuario lo solicite explícitamente.

---

## 3. Estado y Seguimiento del Proyecto

- **Al iniciar una sesión**, lee obligatoriamente:
  - **`Documentacion del Proyecto/Estado_Proyecto.md`** para conocer el progreso actual.
  - **`Documentacion del Proyecto/Changelog.md`** para ver las decisiones y cambios recientes.
- **Al finalizar cada tarea o sesión**, actualiza ambos archivos:
  - En `Estado_Proyecto.md`, marca las tareas completadas en el checklist.
  - En `Changelog.md`, registra la fecha, las tareas realizadas y las decisiones tomadas.
- Si el usuario reporta un error, **pídele primero** que describa el problema o que pegue el mensaje de error de la consola de Roblox Studio antes de intentar corregirlo a ciegas.

---

## 4. Flujo de Trabajo con MCP (Conexión a Roblox Studio)

- **Verificar conexión:** Antes de empezar a construir, confirma que tienes acceso a la sesión de Roblox Studio (p.ej., creando un objeto de prueba).
- **Implementación directa:** Usa el MCP para **crear, modificar y eliminar** scripts, objetos y propiedades directamente en el proyecto, **evitando** que el usuario tenga que copiar y pegar código manualmente.
- **Código comentado:** Todo el código Luau que generes debe tener **comentarios en español** explicando qué hace cada bloque importante, facilitando el aprendizaje del usuario.
- **Pruebas automáticas:** Después de implementar un sistema, **ejecuta el modo Play** desde el MCP para verificar que no haya errores en la consola, y luego indica al usuario cómo probarlo manualmente.

---

## 5. Control de Cambios y Git

- **Cambios menores (un script o sistema):** Puedes proceder directamente y avisar al usuario después.
- **Cambios mayores (múltiples sistemas o reestructuraciones):**
  - **Siempre** pide confirmación explícita antes de ejecutarlos.
  - Explica claramente qué archivos/objetos vas a tocar y el impacto esperado.
- **GitHub:**
  - Al concluir cada fase (o hito importante) y **con la aprobación del usuario**, realiza un commit con un mensaje descriptivo y haz push al repositorio remoto.
  - El mensaje del commit debe seguir el formato: `[Fase X] Descripción breve de lo completado`.

---

## 6. Documentación de Planes y Walkthroughs

- Todo **plan aprobado** (archivo `Plan_*.md`) y su correspondiente **walkthrough** (archivo `Walkthrough_*.md`) deben guardarse en la carpeta **`Documentacion del Proyecto/Planes_Aprobados`**.
- El nombre del walkthrough debe coincidir exactamente con el nombre del plan al que pertenece (ej: `Plan_Fase3_Habilidades_HUD.md` → `Walkthrough_Fase3_Habilidades_HUD.md`).
- El walkthrough debe ser un resumen ejecutivo de **qué se construyó, cómo probarlo y qué resultados esperar**.

---

## 7. Gestión de Errores y Depuración

- Si encuentras un error durante la implementación:
  1. **Detén la ejecución** y analiza el mensaje de error.
  2. **Explica** al usuario el problema en términos simples.
  3. **Propón** una solución clara y pide confirmación antes de aplicarla.
- Si el error es recurrente o complejo, sugiere al usuario que comparta el log completo de la consola de salida de Roblox Studio para un diagnóstico más preciso.

---

## 8. Priorización y Scope

- **Cíñete al MVP:** No sugieras agregar personajes, mapas o sistemas nuevos hasta que el sistema actual esté completamente funcional y probado.
- Si el usuario pide algo fuera del alcance del MVP (3 personajes, 1 mapa, modo Control de Núcleo), **avísale** que eso es para fases posteriores y explica por qué es importante mantener el foco.
- Trabaja **sistema por sistema**, siguiendo el orden de fases definido en el Plan Estratégico.

---

## 9. Resguardo y Buenas Prácticas

- **Antes de modificar un script existente**, crea una copia de seguridad (duplicado) dentro del Workspace o en un lugar seguro, por si algo sale mal.
- **No dependas únicamente de la IA:** Anima al usuario a que, después de cada implementación, **abra los scripts** y lea los comentarios para aprender y entender el código.
- **Mantén la seguridad:** Asegúrate de que ningún script incluya credenciales, claves API o información sensible del usuario.

---

## 10. Checklist de Cierre de Sesión

Antes de finalizar una sesión de trabajo, verifica que:

- [ ] Todos los cambios implementados están probados y funcionan.
- [ ] El `Changelog.md` y `Estado_Proyecto.md` están actualizados.
- [ ] Se ha hecho commit y push a GitHub (si el usuario lo aprueba).
- [ ] Se ha creado el walkthrough correspondiente para los planes completados.
- [ ] Se ha informado al usuario de los próximos pasos sugeridos.

---

## 11. Estructura de Versionado y Correlación Numérica

- **Correlación Numérica Estricta:** Las versiones deben avanzar de forma correlativa secuencial según el desarrollo del MVP y sus iteraciones:
  - `Vers. 1.0`: MVP Core inicial (3 héroes, 1 mapa, Control de Núcleo, Economía y Lobby).
  - `Vers. 1.1`: Pulido Game Feel (VFX por clase, Screen Shake, Audio Pitch) y 4º Héroe (Pyra).
  - `Vers. 1.2`: 2º Mapa (Las Minas de Cristal), Ranked 3v3 y Pase de Temporada.
- **Creación Obligatoria de Carpetas de Versión:**
  - Al completar la implementación de cualquier versión (ej. `Vers. 1.1`), el agente **debe crear inmediatamente** las subcarpetas con el nombre de dicha versión (ej. `Vers. 1.1`) dentro de `Documentacion del Proyecto/Planes_Aprobados`, `Documentacion del Proyecto` y `Doc_inicial`.
  - Todos los planes (`Plan_*.md`), walkthroughs (`Walkthrough_*.md`), changelogs y documentos generados durante esa versión deben ser agrupados dentro de sus respectivas subcarpetas `Vers. X.X`.

---

**Versión 2.1**
**Última revisión 2026-07-22**
