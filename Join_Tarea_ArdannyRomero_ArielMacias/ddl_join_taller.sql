-- Tabla clinica
-- SQL Script to create the database based on the EER diagram

-- Create the 'pacientes' table
create database clinica;

use clinica;

-- Tabla pacientes 
CREATE TABLE pacientes (
PacienteID INT PRIMARY KEY,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Edad INT,
Ciudad VARCHAR(50),
Direccion VARCHAR(100)
);

-- Tabla doctores
CREATE TABLE doctores (
DoctorID INT PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Especialidad VARCHAR(50)
);

-- Tabla medicamentos
CREATE TABLE medicamentos (
MedicamentoID INT PRIMARY KEY,
Nombre VARCHAR(50),
Descripcion VARCHAR(100)
);

-- Tabla consultas
CREATE TABLE consultas (
ConsultaID INT PRIMARY KEY,
PacienteID INT,
DoctorID INT,
Fecha DATE,
FOREIGN KEY (PacienteID) REFERENCES pacientes(PacienteID),
FOREIGN KEY (DoctorID) REFERENCES doctores(DoctorID)
);

-- Tabla recetas
CREATE TABLE recetas (
RecetaID INT PRIMARY KEY,
PacienteID INT,
MedicamentoID INT,
DoctorID INT,
Fecha DATE,
FOREIGN KEY (PacienteID) REFERENCES pacientes(PacienteID),
FOREIGN KEY (MedicamentoID) REFERENCES medicamentos(MedicamentoID),
FOREIGN KEY (DoctorID) REFERENCES doctores(DoctorID)
);

-- registros en la tabla pacientes
INSERT INTO pacientes (PacienteID, Nombre, Apellido, Edad, Ciudad, Direccion) VALUES
(1, 'Juan', 'Perez', 30, 'Quito', 'Av. 10 de Agosto 123'),
(2, 'Maria', 'Gomez', 25, 'Guayaquil', 'Calle Nueve 456'),
(3, 'Carlos', 'Lopez', 45, 'Cuenca', 'Av. Ordoñez Lasso 789'),
(4, 'Ana', 'Rodriguez', 38, 'Quito', 'Pasaje Los Olivos 101'),
(5, 'Pedro', 'Martinez', 50, 'Ambato', 'Calle Bolivar 202');

-- registros en la tabla doctores
INSERT INTO doctores (DoctorID, Nombre, Apellido, Especialidad) VALUES
(101, 'Dr. Luis', 'Fernandez', 'Cardiologia'),
(102, 'Dra. Sofia', 'Diaz', 'Pediatria'),
(103, 'Dr. Ricardo', 'Silva', 'Dermatologia'),
(104, 'Dra. Elena', 'Vargas', 'Medicina General'),
(105, 'Dr. Jorge', 'Morales', 'Neurologia');

-- registros en la tabla medicamentos
INSERT INTO medicamentos (MedicamentoID, Nombre, Descripcion) VALUES
(1001, 'Amoxicilina', 'Antibiotico de amplio espectro'),
(1002, 'Ibuprofeno', 'Antiinflamatorio no esteroideo'),
(1003, 'Paracetamol', 'Analgésico y antipirético'),
(1004, 'Omeprazol', 'Inhibidor de la bomba de protones'),
(1005, 'Losartan', 'Antihipertensivo');

-- registros en la tabla consultas
INSERT INTO consultas (ConsultaID, PacienteID, DoctorID, Fecha) VALUES
(1, 1, 101, '2025-05-20'),
(2, 2, 102, '2025-05-21'),
(3, 3, 103, '2025-05-22'),
(4, 4, 104, '2025-05-23'),
(5, 5, 105, '2025-05-24');

-- registros en la tabla recetas
INSERT INTO recetas (RecetaID, PacienteID, MedicamentoID, DoctorID, Fecha) VALUES
(1, 1, 1001, 101, '2025-05-20'),
(2, 2, 1003, 102, '2025-05-21'),
(3, 3, 1002, 103, '2025-05-22'),
(4, 4, 1004, 104, '2025-05-23'),
(5, 5, 1005, 105, '2025-05-24');


-- Creacion de la base de datos Cursos Online

create database CursosOnline;

use CursosOnline;

CREATE TABLE instructores (
    InstructorID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Especialidad VARCHAR(100)
);

-- Tabla cursos
CREATE TABLE cursos (
    CursoID INT PRIMARY KEY,
    NombreCurso VARCHAR(100),
    FechaInscripcion DATE,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES instructores(InstructorID)
);

-- Tabla estudiantes 
CREATE TABLE estudiantes (
    EstudianteID INT PRIMARY KEY,
    NombreEstudiante VARCHAR(100),
    FechaInscripcion DATE
);

-- Tabla inscripciones 
CREATE TABLE inscripciones (
    InscripcionID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    FOREIGN KEY (EstudianteID) REFERENCES estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES cursos(CursoID)
);

-- Tabla leccionescompletadas 
CREATE TABLE leccionescompletadas (
    LeccionID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    LeccionesCompletadas INT,
    FOREIGN KEY (EstudianteID) REFERENCES estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES cursos(CursoID)
);

-- registros en la tabla instructores
INSERT INTO instructores (InstructorID, Nombre, Especialidad) VALUES
(1, 'Dr. Alejandro Gomez', 'Desarrollo Web'),
(2, 'Ing. Laura Flores', 'Base de Datos'),
(3, 'Lic. Miguel Torres', 'Diseño Gráfico'),
(4, 'MSc. Patricia Ruiz', 'Inteligencia Artificial'),
(5, 'Dr. Daniel Castro', 'Redes de Computadoras');

-- registros en la tabla cursos
INSERT INTO cursos (CursoID, NombreCurso, FechaInscripcion, InstructorID) VALUES
(101, 'Programación con Python', '2025-01-15', 1),
(102, 'Bases de Datos SQL', '2025-02-01', 2),
(103, 'Introducción a Photoshop', '2025-03-10', 3),
(104, 'Machine Learning Básico', '2025-04-05', 4),
(105, 'Configuración de Redes', '2025-05-01', 5);

-- registros en la tabla estudiantes
INSERT INTO estudiantes (EstudianteID, NombreEstudiante, FechaInscripcion) VALUES
(201, 'Andrea Vega', '2025-01-10'),
(202, 'Roberto Solis', '2025-01-25'),
(203, 'Carolina Herrera', '2025-02-15'),
(204, 'Fernando Quintero', '2025-03-01'),
(205, 'Gabriela Pinto', '2025-04-10');

-- registros en la tabla inscripciones
INSERT INTO inscripciones (InscripcionID, EstudianteID, CursoID) VALUES
(1, 201, 101),
(2, 202, 102),
(3, 203, 103),
(4, 204, 104),
(5, 205, 105);

-- registros en la tabla leccionescompletadas
INSERT INTO leccionescompletadas (LeccionID, EstudianteID, CursoID, LeccionesCompletadas) VALUES
(1001, 201, 101, 10),
(1002, 202, 102, 5),
(1003, 203, 103, 8),
(1004, 204, 104, 3),
(1005, 205, 105, 7);

-- Creación de la base de datos RedesSociales

create database RedesSociales;

use RedesSociales;

-- Tabla usuarios
CREATE TABLE usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Ciudad VARCHAR(50),
    Edad INT,
    Seguidores INT,
    FotosPublicadas INT
);

-- Tabla fotos
CREATE TABLE fotos (
    FotoID INT PRIMARY KEY,
    UsuarioID INT,
    Descripcion VARCHAR(255),
    Fecha DATE,
    MeGusta INT,
    FOREIGN KEY (UsuarioID) REFERENCES usuarios(UsuarioID)
);

-- Tabla comentarios
CREATE TABLE comentarios (
    ComentarioID INT PRIMARY KEY,
    FotoID INT,
    UsuarioID INT,
    Comentario TEXT,
    Fecha DATE,
    FOREIGN KEY (FotoID) REFERENCES fotos(FotoID),
    FOREIGN KEY (UsuarioID) REFERENCES usuarios(UsuarioID)
);

-- registros en la tabla usuarios
INSERT INTO usuarios (UsuarioID, Nombre, Apellido, Ciudad, Edad, Seguidores, FotosPublicadas) VALUES
(1, 'Alice', 'Smith', 'Nueva York', 28, 1500, 50),
(2, 'Bob', 'Johnson', 'Los Angeles', 35, 2300, 75),
(3, 'Charlie', 'Brown', 'Chicago', 22, 800, 30),
(4, 'Diana', 'Prince', 'Miami', 40, 5000, 120),
(5, 'Eve', 'Davis', 'San Francisco', 30, 1000, 40);

-- registros en la tabla fotos
INSERT INTO fotos (FotoID, UsuarioID, Descripcion, Fecha, MeGusta) VALUES
(101, 1, 'Atardecer en la playa', '2024-03-10', 120),
(102, 2, 'Mi mascota favorita', '2024-03-12', 250),
(103, 3, 'Vista desde la montaña', '2024-03-15', 80),
(104, 4, 'Recuerdo de mis vacaciones', '2024-03-18', 400),
(105, 5, 'Comida deliciosa', '2024-03-20', 180);

-- registros en la tabla comentarios
INSERT INTO comentarios (ComentarioID, FotoID, UsuarioID, Comentario, Fecha) VALUES
(1001, 101, 2, '¡Qué hermosa vista!', '2024-03-11'),
(1002, 102, 1, '¡Adorable!', '2024-03-13'),
(1003, 103, 4, 'Me encanta la naturaleza', '2024-03-16'),
(1004, 104, 3, '¡Excelente foto!', '2024-03-19'),
(1005, 105, 5, 'Se ve delicioso', '2024-03-21');