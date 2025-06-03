use cursosonline;

-- 3. Prácticas para Estudiantes

-- Ejercicio 1
select estudiantes.nombreestudiante, inscripciones.cursoid from estudiantes
left join inscripciones on estudiantes.estudianteid = inscripciones.estudianteid;
-- Ejercicio 2
select cursos.nombrecurso from cursos
left join inscripciones on cursos.cursoid = inscripciones.cursoid where inscripciones.cursoid is null; #Nadie supongo...
-- Ejercicio 3
select estudiantes.nombreestudiante as nombres, cursos.nombrecurso as cursos, sum(leccionescompletadas.leccionescompletadas) as total_lecciones_completadas from estudiantes
left join leccionescompletadas on estudiantes.estudianteid = leccionescompletadas.estudianteid
left join cursos on leccionescompletadas.cursoid = cursos.cursoid group by estudiantes.nombreestudiante, cursos.nombrecurso;
# Nota: El word dice que use count, mas la salida dice que solo hay una leccion completada por alumno-curso lo cual no es verdad. Sum da de forma correcta la salida

-- 6. Prácticas Guiadas (Explicadas)

-- Ejercicio 4
select cursos.nombrecurso, instructores.nombre as nombre_instructor from cursos
join instructores on cursos.instructorid = instructores.instructorid;
-- Ejercicio 5
select estudiantes.nombreestudiante, cursos.nombrecurso from estudiantes
join inscripciones on estudiantes.estudianteid = inscripciones.estudianteid
join cursos on inscripciones.cursoid = cursos.cursoid;
-- Ejercicio 6
select estudiantes.nombreestudiante, inscripciones.cursoid from estudiantes # Este se repitio creo...
left join inscripciones on estudiantes.estudianteid = inscripciones.estudianteid;
-- Ejercicio 7
select cursos.nombrecurso from cursos # Tambien
left join inscripciones on cursos.cursoid = inscripciones.cursoid where inscripciones.cursoid is null;
-- Ejercicio 8
select cursos.nombrecurso, count(inscripciones.estudianteid) as numero_estudiantes_inscritos from cursos
join inscripciones on cursos.cursoid = inscripciones.cursoid group by cursos.nombrecurso; # Esta ves el count si da infro correcta
-- Ejercicio 9
select estudiantes.nombreestudiante, leccionescompletadas.leccionescompletadas from estudiantes
join leccionescompletadas on estudiantes.estudianteid = leccionescompletadas.estudianteid; 
-- Ejercicio 10
select estudiantes.nombreestudiante, leccionescompletadas.leccionescompletadas from estudiantes
right join leccionescompletadas on estudiantes.estudianteid = leccionescompletadas.estudianteid; # Sale lo mismo

-- 7. Prácticas para Resolver

-- Ejercicio 11
select instructores.Nombre as Instructor, cursos.NombreCurso as Curso from instructores
join cursos on cursos.instructorID = instructores.instructorID;
-- Ejercicio 12
select distinct estudiantes.NombreEstudiante as Estudiante, leccionescompletadas.leccionescompletadas as LeccionesCompletadas, cursos.NombreCurso as Curso from estudiantes -- distinct es para que no se repitan (a veces manda nulls cuidado)
join leccionescompletadas on leccionescompletadas.estudianteID = estudiantes.estudianteID
join inscripciones on estudiantes.EstudianteID = inscripciones.EstudianteID
join cursos on inscripciones.CursoID = cursos.CursoID;
-- Ejercicio 13
select cursos.NombreCurso as Curso, leccionescompletadas.leccionescompletadas as LeccionesCompletadas from cursos
join leccionescompletadas on leccionescompletadas.CursoID = cursos.CursoID;
-- Ejercicio 14
select cursos.NombreCurso as Curso, instructores.Nombre as Instructor from instructores
left join cursos on cursos.instructorID = instructores.instructorID;