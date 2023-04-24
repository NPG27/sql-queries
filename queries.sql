# ---------------------------------------------- QUERIES ----------------------------------------------

# Listar los datos de los autores
SELECT * FROM autor;

# Listar nombre y edad de los estudiantes
SELECT nombre, edad FROM estudiante;

# ¿Qué estudiantes pertenecen a la carrera Medicina?
SELECT *
FROM estudiante
WHERE carrera = "Medicina";

# ¿Qué autores son de nacionalidad Español o Británico?
SELECT *
FROM autor
WHERE nacionalidad = "Español" OR nacionalidad = "Británico";

# ¿Qué libros no son del área de Informática?
SELECT *
FROM libro
WHERE area <> "Informática";

# Listar los libros de la editorial McGraw-Hill.
SELECT *
FROM libro
WHERE editorial = "McGraw-Hill";

# Listar los datos de los estudiantes cuya edad es mayor al promedio.
SELECT *
FROM estudiante
WHERE edad > (
	SELECT AVG(edad)
    FROM estudiante
);

# Listar los nombres de los estudiantes cuyo apellido comience con la letra G.
SELECT nombre
FROM estudiante
WHERE apellido LIKE "G%";

# Listar los autores del libro “El Quijote”. (Se debe listar solamente los nombres).
SELECT a.nombre
FROM autor a
INNER JOIN libroautor la ON a.idAutor = la.idAutor
INNER JOIN libro l ON l.idLibro = la.idLibro
WHERE l.titulo = "El Quijote";

# ¿Qué libros se prestaron al lector “Juan Pérez”?
SELECT l.*
FROM libro l
INNER JOIN prestamo p ON l.idLibro = p.idLibro
INNER JOIN estudiante e ON e.idLector = p.idLector
WHERE e.nombre = "Juan" AND e.apellido = "Pérez";

# Listar el nombre del estudiante de menor edad.
SELECT nombre
FROM estudiante
WHERE edad = (
	SELECT MIN(edad)
    FROM estudiante
);

# Listar nombres de los estudiantes a los que se prestaron libros de Literatura.
SELECT e.nombre
FROM estudiante e
INNER JOIN prestamo p ON p.idLector = e.idLector
INNER JOIN libro l ON p.idLibro = l.idLibro
WHERE l.area = "Literatura";

# Listar los libros que pertenecen a la autora Stephen Hawking.
SELECT l.*
FROM libro l
INNER JOIN libroautor la ON la.idLibro = l.idLibro
INNER JOIN autor a ON la.idAutor = a.idAutor
WHERE a.nombre = "Stephen Hawking";

# Listar títulos de los libros que debían devolverse el 2022-02-15.
SELECT l.titulo
FROM libro l
INNER JOIN prestamo p ON l.idLibro = p.idLibro
WHERE p.fechaDevolucion = '2022-02-15';