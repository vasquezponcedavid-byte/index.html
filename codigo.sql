-- Scripts SQL para la base de datos de Resbaladera App

-- Crear la tabla USUARIO para almacenar la información de los clientes.
CREATE TABLE USUARIO (
    id_usuario UUID PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    contrasena_hashed VARCHAR(255) NOT NULL,
    puntos_acumulados INT DEFAULT 0,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla PROMOCION para gestionar las ofertas del negocio.
CREATE TABLE PROMOCION (
    id_promocion UUID PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

-- Crear la tabla RECOMPENSA para definir los items que pueden ser canjeados.
CREATE TABLE RECOMPENSA (
    id_recompensa UUID PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    puntos_requeridos INT NOT NULL,
    url_imagen VARCHAR(255),
    fecha_vigencia DATE,
    fecha_fin DATE
);

-- Crear la tabla COMPRA para registrar las transacciones de los usuarios.
CREATE TABLE COMPRA (
    id_compra UUID PRIMARY KEY,
    id_usuario UUID,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    monto_total DECIMAL(10, 2) NOT NULL,
    puntos_obtenidos INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

-- Crear la tabla de unión CANJE_RECOMPENSA para registrar los canjes de puntos.
CREATE TABLE CANJE_RECOMPENSA (
    id_canje UUID PRIMARY KEY,
    id_usuario UUID,
    id_recompensa UUID,
    fecha_canje TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_recompensa) REFERENCES RECOMPENSA(id_recompensa)
);
