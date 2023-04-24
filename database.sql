# Database creation

CREATE DATABASE biblioteca;

CREATE TABLE libro (
	idLibro INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    editorial VARCHAR(255) NOT NULL,
    area VARCHAR(255) NOT NULL
);

CREATE TABLE autor (
	idAutor INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    nacionalidad VARCHAR(255) NOT NULL
);

CREATE TABLE libroautor (
    idAutor INT,
    idLibro INT,
    FOREIGN KEY (idAutor) REFERENCES autor(idAutor),
    FOREIGN KEY (idLibro) REFERENCES libro(idLibro)
);

CREATE TABLE estudiante (
	idLector INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    carrera VARCHAR(255) NOT NULL,
    edad INT
);

CREATE TABLE prestamo (
	idLector INT,
    idLibro INT,
    FOREIGN KEY (idLector) REFERENCES estudiante(idLector),
    FOREIGN KEY (idLibro) REFERENCES libro(idLibro),
    fechaPrestamo DATE,
    fechaDevolucion DATE,
    devuelto BOOLEAN
);

# INSERTS para la tabla libro
INSERT INTO libro (idLibro, titulo, editorial, area) VALUES (1, 'Cien años de soledad', 'Sudamericana', 'Literatura');
INSERT INTO libro (idLibro, titulo, editorial, area) VALUES (2, 'El Quijote', 'Espasa-Calpe', 'Literatura');
INSERT INTO libro (idLibro, titulo, editorial, area) VALUES (3, 'Fundamentos de programación', 'McGraw-Hill', 'Informática');
INSERT INTO libro (idLibro, titulo, editorial, area) VALUES (4, 'La Historia del Tiempo', 'Bantam', 'Ciencias');
INSERT INTO libro (idLibro, titulo, editorial, area) VALUES (5, 'El jardín de las mariposas', 'Harper Collins', 'Misterio');

# INSERTS para la tabla autor
INSERT INTO autor (idAutor, nombre, nacionalidad) VALUES (1, 'Gabriel García Márquez', 'Colombiano');
INSERT INTO autor (idAutor, nombre, nacionalidad) VALUES (2, 'Miguel de Cervantes', 'Español');
INSERT INTO autor (idAutor, nombre, nacionalidad) VALUES (3, 'Luis Joyanes Aguilar', 'Español');
INSERT INTO autor (idAutor, nombre, nacionalidad) VALUES (4, 'Stephen Hawking', 'Británico');
INSERT INTO autor (idAutor, nombre, nacionalidad) VALUES (5, 'Dot Hutchison', 'Estadounidense');

# INSERTS para la tabla LibroAutor
INSERT INTO libroautor (idAutor, idLibro) VALUES (1, 1);
INSERT INTO libroautor (idAutor, idLibro) VALUES (2, 2);
INSERT INTO libroautor (idAutor, idLibro) VALUES (3, 3);
INSERT INTO libroautor (idAutor, idLibro) VALUES (4, 4);
INSERT INTO libroautor (idAutor, idLibro) VALUES (5, 5);

# INSERTS para la tabla Estudiante
INSERT INTO estudiante (idLector, nombre, apellido, direccion, carrera, edad) VALUES (1, 'Juan', 'Pérez', 'Calle 123', 'Ingeniería Civil', 21);
INSERT INTO estudiante (idLector, nombre, apellido, direccion, carrera, edad) VALUES (2, 'María', 'González', 'Avenida 456', 'Psicología', 24);
INSERT INTO estudiante (idLector, nombre, apellido, direccion, carrera, edad) VALUES (3, 'Pedro', 'Gómez', 'Calle 789', 'Medicina', 20);
INSERT INTO estudiante (idLector, nombre, apellido, direccion, carrera, edad) VALUES (4, 'Luis', 'Rodríguez', 'Calle 1011', 'Derecho', 23);
INSERT INTO estudiante (idLector, nombre, apellido, direccion, carrera, edad) VALUES (5, 'Ana', 'Hernández', 'Avenida 1213', 'Ingeniería Industrial', 22);

# INSERTS para la tabla Prestamo
INSERT INTO prestamo (idLector, idLibro, fechaPrestamo, fechaDevolucion, devuelto) VALUES (1, 1, '2022-02-01', '2022-02-15', true);
INSERT INTO prestamo (idLector, idLibro, fechaPrestamo, fechaDevolucion, devuelto) VALUES (2, 2, '2022-03-01', '2022-03-15', false);
INSERT INTO prestamo (idLector, idLibro, fechaPrestamo, fechaDevolucion, devuelto) VALUES (3, 3, '2022-04-01', '2022-04-15', true);
INSERT INTO prestamo (idLector, idLibro, fechaPrestamo, fechaDevolucion, devuelto) VALUES (4, 4, '2022-05-01', '2022-05-15', false);
INSERT INTO prestamo (idLector, idLibro, fechaPrestamo, fechaDevolucion, devuelto) VALUES (5, 5, '2022-06-01', '2022-06-15', true);