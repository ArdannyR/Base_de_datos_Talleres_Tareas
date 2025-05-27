-- CONSULTAS JOIN (1-18)
-- BASE DE DATOS CLINICA
-- MT
use clinica;

-- 1. INNER JOIN: Relacionar pacientes con consultas cuando ambos están registrados.
select nombre, fecha from pacientes inner join consultas on pacientes.pacienteID = consultas.pacienteID;
-- 2. LEFT JOIN: Mostrar todos los pacientes, incluyendo aquellos que aún no tienen consultas agendadas.
select pacientes.nombre, consultas.fecha from pacientes left join consultas on pacientes.pacienteID = consultas.pacienteID;
-- 3. RIGHT JOIN: Mostrar todas las consultas, incluso aquellas que no están asignadas a un paciente.
select pacientes.nombre, consultas.fecha from pacientes right join consultas on pacientes.pacienteID = consultas.pacienteID;
-- 4. FULL OUTER JOIN: Mostrar todos los pacientes y consultas, incluidas las que no están relacionadas entre sí.
select pacientes.nombre, consultas.fecha from pacientes left join consultas on pacientes.pacienteid = consultas.pacienteid
UNION
select pacientes.nombre, consultas.fecha from pacientes right join consultas on pacientes.pacienteid = consultas.pacienteid;

-- 5. INNER JOIN: Relacionar consultas con doctores asignados.
select consultas.consultaid, consultas.fecha, doctores.nombre from consultas inner join doctores on consultas.doctorid = doctores.doctorid;
-- 6. LEFT JOIN: Mostrar todas las consultas, incluyendo las que no tienen doctor asignado.
select consultas.consultaid, consultas.fecha, doctores.nombre from consultas left join doctores on consultas.doctorid = doctores.doctorid;
-- 7. RIGHT JOIN: Mostrar todos los doctores, incluso aquellos que no tienen consultas asignadas.
select consultas.consultaid, consultas.fecha, doctores.nombre from consultas right join doctores on consultas.doctorid = doctores.doctorid;
-- 8. FULL OUTER JOIN: Mostrar todas las consultas y doctores, incluso las no relacionadas.
select consultas.consultaid, consultas.fecha, doctores.nombre from consultas left join doctores on consultas.doctorid = doctores.doctorid
union
select consultas.consultaid, consultas.fecha, doctores.nombre from consultas right join doctores on consultas.doctorid = doctores.doctorid;


-- 9. INNER JOIN: Relacionar medicamentos recetados con los pacientes que los reciben.
select medicamentos.nombre as Medicamento, pacientes.nombre as Paciente 
from recetas 
inner join medicamentos on recetas.medicamentoid = medicamentos.medicamentoid 
inner join pacientes on recetas.pacienteid = pacientes.pacienteid;
-- 10. LEFT JOIN: Mostrar todos los pacientes, incluyendo aquellos que no reciben medicamentos.
select medicamentos.nombre as Medicamento, pacientes.nombre as Paciente
from recetas
left join medicamentos on recetas.medicamentoid = medicamentos.medicamentoid
left join pacientes on recetas.pacienteid = pacientes.pacienteid;
-- 11. RIGHT JOIN: Mostrar todos los medicamentos, incluso los que no han sido recetados.
select medicamentos.nombre as Medicamento, pacientes.nombre as Paciente
from recetas
right join medicamentos on recetas.medicamentoid = medicamentos.medicamentoid
right join pacientes on recetas.pacienteid = pacientes.pacienteid;
-- 12. FULL OUTER JOIN: Mostrar todos los pacientes y medicamentos, incluso los no relacionados entre sí.
select medicamentos.nombre as Medicamento, pacientes.nombre as Paciente
from recetas
left join medicamentos on recetas.medicamentoid = medicamentos.medicamentoid
left join pacientes on recetas.pacienteid = pacientes.pacienteid
union
select medicamentos.nombre as Medicamento, pacientes.nombre as Paciente
from recetas
right join medicamentos on recetas.medicamentoid = medicamentos.medicamentoid
right join pacientes on recetas.pacienteid = pacientes.pacienteid;

-- BASE DE DATOS CURSOSONLINE
use cursosonline;

-- 13. INNER JOIN: Relacionar estudiantes con cursos en los que están inscritos.
select estudiantes.nombreestudiante as Estudiante, cursos.nombrecurso as Curso
from inscripciones 
inner join cursos on inscripciones.cursoid = cursos.cursoid
inner join estudiantes on inscripciones.estudianteid = estudiantes.estudianteid;
-- 14. LEFT JOIN: Mostrar todos los estudiantes, incluso aquellos que no están inscritos en ningún curso.
select estudiantes.nombreestudiante as Estudiante, cursos.nombrecurso as Curso
from inscripciones
left join cursos on inscripciones.cursoid = cursos.cursoid
left join estudiantes on inscripciones.estudianteid = estudiantes.estudianteid;
-- 15. RIGHT JOIN: Mostrar todos los cursos, incluso aquellos que no tienen estudiantes inscritos.
select estudiantes.nombreestudiante as Estudiante, cursos.nombrecurso as Curso
from inscripciones
right join cursos on inscripciones.cursoid = cursos.cursoid
right join estudiantes on inscripciones.estudianteid = estudiantes.estudianteid;
-- 16. FULL OUTER JOIN: Mostrar todos los estudiantes y cursos, incluso los no relacionados entre sí.
select estudiantes.nombreestudiante as Estudiante, cursos.nombrecurso as Curso
from inscripciones
left join cursos on inscripciones.cursoid = cursos.cursoid
left join estudiantes on inscripciones.estudianteid = estudiantes.estudianteid
union
select estudiantes.nombreestudiante as Estudiante, cursos.nombrecurso as Curso
from inscripciones
right join cursos on inscripciones.cursoid = cursos.cursoid
right join estudiantes on inscripciones.estudianteid = estudiantes.estudianteid;

-- 17. INNER JOIN: Relacionar cursos con sus instructores.
select cursos.nombrecurso as Curso, instructores.nombre as Instructor 
from cursos 
inner join instructores on cursos.instructorid = instructores.instructorid;
-- 18. LEFT JOIN: Mostrar todos los cursos, incluyendo aquellos sin instructor asignado.
select cursos.nombrecurso as Curso, instructores.nombre as Instructor
from cursos
left join instructores on cursos.instructorid = instructores.instructorid;
 
-- AV

use cursosonline;
-- 19. RIGHT JOIN: Mostrar todos los instructores, incluso aquellos que no tienen cursos a su cargo.
select instructores.Nombre from instructores right join cursos on cursos.InstructorID = instructores.InstructorID;

-- 20. FULL OUTER JOIN: Mostrar todos los cursos y todos los instructores, incluidos los no relacionados entre sí.
select cursos.NombreCurso, instructores.Nombre from cursos left join instructores on cursos.InstructorID = instructores.InstructorID
union
select cursos.NombreCurso, instructores.Nombre from cursos right join instructores on cursos.InstructorID = instructores.InstructorID;

-- 21. INNER JOIN: Relacionar estudiantes con lecciones completadas.
select estudiantes.NombreEstudiante, leccionescompletadas.LeccionesCompletadas from estudiantes inner join leccionescompletadas on estudiantes.EstudianteID = leccionescompletadas.EstudianteID;

-- 22. LEFT JOIN: Mostrar todos los estudiantes, incluso aquellos que no han completado ninguna lección.
select estudiantes.NombreEstudiante, leccionescompletadas.LeccionesCompletadas from estudiantes left join leccionescompletadas on estudiantes.EstudianteID = leccionescompletadas.EstudianteID;

-- 23. RIGHT JOIN: Mostrar todas las lecciones completadas, incluyendo las que no están asociadas a ningún estudiante (en este caso, usando leccionescompletadas y estudiantes).
select estudiantes.NombreEstudiante, leccionescompletadas.LeccionesCompletadas from estudiantes right join leccionescompletadas on estudiantes.EstudianteID = leccionescompletadas.EstudianteID;

-- 24. FULL OUTER JOIN: Mostrar todos los estudiantes y lecciones completadas, incluso los no relacionados entre sí.
select estudiantes.NombreEstudiante, leccionescompletadas.LeccionesCompletadas from estudiantes left join leccionescompletadas on estudiantes.EstudianteID = leccionescompletadas.EstudianteID
union
select estudiantes.NombreEstudiante, leccionescompletadas.LeccionesCompletadas from estudiantes right join leccionescompletadas on estudiantes.EstudianteID = leccionescompletadas.EstudianteID;

use redessociales;
-- 25. INNER JOIN: Relacionar usuarios con sus fotos publicadas.
select usuarios.Nombre, fotos.FotoID from usuarios inner join fotos on usuarios.UsuarioID = fotos.UsuarioID;

-- 26. LEFT JOIN: Mostrar todos los usuarios, incluyendo aquellos que no han subido ninguna foto.
select usuarios.Nombre, fotos.FotoID from usuarios left join fotos on usuarios.UsuarioID = fotos.UsuarioID;

-- 27. RIGHT JOIN: Mostrar todas las fotos, incluso las que no están asociadas a ningún usuario.
select usuarios.Nombre, fotos.FotoID from usuarios right join fotos on usuarios.UsuarioID = fotos.UsuarioID;

-- 28. FULL OUTER JOIN: Mostrar todos los usuarios y fotos, incluidas las que no tienen relación entre sí.
select usuarios.Nombre, fotos.FotoID from usuarios left join fotos on usuarios.UsuarioID = fotos.UsuarioID
union
select usuarios.Nombre, fotos.FotoID from usuarios right join fotos on usuarios.UsuarioID = fotos.UsuarioID;

-- 29. INNER JOIN: Relacionar fotos con los comentarios recibidos.
select fotos.FotoID, comentarios.Comentario from fotos inner join comentarios on fotos.FotoID = comentarios.FotoID;

-- 30. LEFT JOIN: Mostrar todas las fotos, incluyendo las que no tienen comentarios.
select fotos.FotoID from fotos left join comentarios on fotos.FotoID = comentarios.FotoID;

-- 31. RIGHT JOIN: Mostrar todos los comentarios, incluso los que no están asociados a ninguna foto.
select comentarios.Comentario from fotos right join comentarios on fotos.FotoID = comentarios.FotoID;

-- 32. FULL OUTER JOIN: Mostrar todas las fotos y comentarios, incluidos los no relacionados entre sí.
select fotos.FotoID, comentarios.Comentario from fotos left join comentarios on fotos.FotoID = comentarios.FotoID
union
select fotos.FotoID, comentarios.Comentario from fotos right join comentarios on fotos.FotoID = comentarios.FotoID;

-- 33. INNER JOIN: Relacionar usuarios con sus comentarios realizados.
select usuarios.Nombre, comentarios.Comentario from usuarios inner join comentarios on usuarios.UsuarioID = comentarios.UsuarioID;

-- 34. LEFT JOIN: Mostrar todos los usuarios, incluyendo aquellos que no han realizado ningún comentario.
select usuarios.Nombre from usuarios left join comentarios on usuarios.UsuarioID = comentarios.UsuarioID;

-- 35. RIGHT JOIN: Mostrar todos los comentarios, incluso los que no están asociados a ningún usuario.
select comentarios.Comentario from usuarios right join comentarios on usuarios.UsuarioID = comentarios.UsuarioID;

-- 36. FULL OUTER JOIN: Mostrar todos los usuarios y comentarios, incluidos los no relacionados entre sí.
select usuarios.Nombre, comentarios.Comentario from usuarios left join comentarios on usuarios.UsuarioID = comentarios.UsuarioID
union
select usuarios.Nombre, comentarios.Comentario from usuarios right join comentarios on usuarios.UsuarioID = comentarios.UsuarioID;



