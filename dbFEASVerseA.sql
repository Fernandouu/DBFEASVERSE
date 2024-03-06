DROP DATABASE IF EXISTS db_feasverse;
CREATE DATABASE db_feasverse;
USE db_feasverse;

CREATE TABLE tb_niveles
(
	id_nivel INT PRIMARY KEY AUTO_INCREMENT,
	nivel VARCHAR(20) NOT NULL
);

CREATE TABLE tb_trabajadores
(
	id_trabajador INT PRIMARY KEY AUTO_INCREMENT,
	nombre_trabajador VARCHAR(20) NOT NULL,
	apellido_trabajador VARCHAR(20) NOT NULL,
	dui_trabajador  VARCHAR(10) NOT NULL,
	telefono_trabajador  VARCHAR(9) NOT NULL,
	correo_trabajador VARCHAR(30) NOT NULL,
	clave_trabajador VARCHAR(30) NOT NULL,
	fecha_de_registro DATE NOT NULL,
	fecha_de_nacimiento DATE NOT NULL,
	id_nivel INT NOT NULL,
	estado_trabajador ENUM('Activo', 'Desactivo') NOT NULL
);

##------------------------------------------------------CONSTRAINST (TRABAJADORES)
ALTER TABLE tb_trabajadores
ADD CONSTRAINT fk_tb_trabajadores_tb_niveles 
FOREIGN KEY (id_nivel) REFERENCES tb_niveles(id_nivel);

ALTER TABLE tb_trabajadores
ADD CONSTRAINT ck_estado_trabajador 
CHECK (estado_trabajador IN ('Activo', 'Desactivo'));
##------------------------------------------------------

CREATE TABLE tb_marcas
(
	id_marca INT PRIMARY KEY AUTO_INCREMENT,
	nombre_marca VARCHAR(20) NOT NULL,
	foto_marca VARCHAR(20) NOT NULL,
	descripcion_marca VARCHAR(100) NOT NULL
);

##------------------------------------------------------CONSTRAINST (MARCAS)
ALTER TABLE tb_marcas
ADD CONSTRAINT uq_nombre_marca 
UNIQUE (nombre_marca);
#----------------------------------------------------

CREATE TABLE tb_zapatos
(
	id_zapato INT PRIMARY KEY AUTO_INCREMENT,
	id_trabajador INT NOT NULL,
	id_marca INT NOT NULL,
	nombre_zapato VARCHAR(20) NOT NULL,
	genero_zapato ENUM('Unisex', 'Masculino', 'Femenino') NOT NULL,
	descripcion_zapato VARCHAR(200) NOT NULL,
	estado_zapato ENUM('Activo', 'Desactivo') NOT NULL
);
##------------------------------------------------------CONSTRAINT (ZAPATOS)
ALTER TABLE tb_zapatos
ADD CONSTRAINT ck_estado_trabajador
FOREIGN KEY (id_trabajador) REFERENCES tb_trabajadores(id_trabajador);

ALTER TABLE tb_zapatos
ADD constraint fk_tb_zapatos_tb_marca
FOREIGN KEY (id_marca) REFERENCES tb_marcas(id_marca);
##------------------------------------------------------

CREATE TABLE tb_colores
(
	id_color INT PRIMARY KEY AUTO_INCREMENT,
	nombre_color VARCHAR(20) NOT NULL
);

##------------------------------------------------------CONSTRAINT (COLORES)
ALTER TABLE tb_colores
ADD CONSTRAINT uq_nombre_color 
UNIQUE (nombre_color);
##------------------------------------------------------

CREATE TABLE tb_detalles_colores_zapatos
(
	id_detalle_color_zapato INT PRIMARY KEY AUTO_INCREMENT,
	foto_zapato_color VARCHAR(20) NOT NULL,
	id_color INT NOT NULL
);

##------------------------------------------------------CONSTRAINT (DETALLES COLOR ZAPATO)
ALTER TABLE tb_detalles_colores_zapatos 
ADD CONSTRAINT fk_detalles_colores_zapatos  
FOREIGN KEY (id_color) REFERENCES tb_colores(id_color);
##------------------------------------------------------

CREATE TABLE tb_mas_colores_de_zapatos
(
	id_mas_color_de_zapato INT PRIMARY KEY AUTO_INCREMENT,
	id_color INT NOT NULL,
	id_detalle_color_zapato INT NOT NULL
);

##------------------------------------------------------CONSTRAINT (MAS COLORES ZAPATO)
ALTER TABLE tb_mas_colores_de_zapatos
ADD CONSTRAINT fk_mas_colores 
FOREIGN KEY (id_detalle_color_zapato) REFERENCES tb_detalles_colores_zapatos(id_detalle_color_zapato);

ALTER TABLE tb_mas_colores_de_zapatos
ADD CONSTRAINT fk_color 
FOREIGN KEY (id_color) REFERENCES tb_colores(id_color);
##------------------------------------------------------

CREATE TABLE tb_tallas
(
	id_talla INT PRIMARY KEY AUTO_INCREMENT,
	num_talla VARCHAR(4) NOT NUlL
);

##------------------------------------------------------CONSTRAINT(TALLAS)
ALTER TABLE tb_tallas
ADD CONSTRAINT uq_num_talla 
UNIQUE (num_talla);
##------------------------------------------------------

CREATE TABLE tb_detalle_zapatos
(
	id_detalle_zapato INT PRIMARY KEY AUTO_INCREMENT,
	id_zapato INT NOT NULL, 
	id_talla INT NOT NULL,
	cantidad_zapato INT NOT NULL,
	id_detalle_color_zapato INT NOT NULL,
	precio_unitario_zapato DECIMAL(6,2)
);

##------------------------------------------------------CONSTRAINT (DETALLES ZAPATO)
ALTER TABLE tb_detalle_zapatos
ADD CONSTRAINT fk_talla
FOREIGN KEY (id_talla) REFERENCES tb_tallas(id_talla);

ALTER TABLE tb_detalle_zapatos
ADD CONSTRAINT fk_zapato 
FOREIGN KEY (id_zapato) REFERENCES tb_zapatos(id_zapato);

ALTER TABLE tb_detalle_zapatos
ADD CONSTRAINT fk_detalle_color 
FOREIGN KEY (id_detalle_color_zapato) REFERENCES tb_detalles_colores_zapatos(id_detalle_color_zapato);
##------------------------------------------------------

CREATE TABLE tb_clientes
(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT, 
	nombre_cliente VARCHAR(20) NOT NULL,
	apellido_cliente VARCHAR(20) NOT NULL,
	dui_cliente VARCHAR(10) NOT NULL,
	telefono_cliente VARCHAR(9) NOT NULL,
	correo_cliente VARCHAR(30) NOT NULL,
	direccion_cliente VARCHAR(30) NOT NULL,
	clave_cliente VARCHAR(30) NOT NULL,
	fecha_de_registro DATE NOT NULL, 
	fecha_de_nacimiento DATE NOT NULL,
	estado_cliente ENUM('Activo', 'Desactivo')
);

##------------------------------------------------------CONSTRAINT (clientes)
ALTER TABLE tb_clientes 
ADD CONSTRAINT uq_dui_cliente 
UNIQUE (dui_cliente);
    
ALTER TABLE tb_clientes 
ADD CONSTRAINT uq_telefono_cliente 
UNIQUE (telefono_cliente);

ALTER TABLE tb_clientes
ADD CONSTRAINT uq_correo_cliente
UNIQUE (correo_cliente);
#-----------------------------

CREATE TABLE tb_departamentos
(
	id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO tb_departamentos (nombre_departamento)
VALUES
    ('Ahuachapán'),
    ('Cabañas'),
    ('Chalatenango'),
    ('Cuscatlán'),
    ('La Libertad'),
    ('La Paz'),
    ('La Unión'),
    ('Morazán'),
    ('San Miguel'),
    ('San Salvador'),
    ('San Vicente'),
    ('Santa Ana'),
    ('Sonsonate'),
    ('Usulután');

CREATE TABLE tb_costos_de_envio_por_departamento
(
	id_costo_de_envio_por_departamento INT PRIMARY KEY AUTO_INCREMENT,
    id_departamento INT NOT NULL UNIQUE,
    costo_de_envio DECIMAL(5,2)
);

##------------------------------------------------------CONStRAINT (COSTOS DE ENVIO)
ALTER TABLE tb_costos_de_envio_por_departamento
ADD CONSTRAINT fk_costo_departamento
FOREIGN KEY (id_departamento) REFERENCES tb_departamentos(id_departamento);
##------------------------------------------------------

INSERT INTO tb_costos_de_envio_por_departamento (id_departamento, costo_de_envio)
VALUES
    (1, 10.50),
    (2, 12.75),
    (3, 9.00),
    (4, 11.25),
    (5, 15.00),
    (6, 13.50),
    (7, 10.75),
    (8, 14.25),
    (9, 12.00),
    (10, 16.50),
    (11, 11.75),
    (12, 13.00),
    (13, 14.50),
    (14, 12.25);


CREATE TABLE tb_pedidos_clientes
(
	id_pedido_cliente INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
	id_repartidor INT NOT NULL,
	estado_pedido ENUM('Pendiente', 'En camino', 'Entregado') NOT NULL,
	precio_total DECIMAL(8,2) NOT NULL,
	fecha_de_inicio DATE NOT NULL,
	fecha_de_entrega DATE NULL,
    id_costo_de_envio_por_departamento INT NOT NULL 
);
##------------------------------------------------------CONSTRAINT (PEDIDOS CLIENTES)
ALTER TABLE tb_pedidos_clientes
ADD CONSTRAINT fk_pedidos_clientes 
FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente);

ALTER TABLE tb_pedidos_clientes
ADD CONSTRAINT fk_pedidos_repartidor 
FOREIGN KEY (id_repartidor) REFERENCES tb_trabajadores(id_trabajador);

ALTER TABLE tb_pedidos_clientes
ADD CONSTRAINT fk_pedidos_costo
FOREIGN KEY (id_costo_de_envio_por_departamento) REFERENCES tb_costos_de_envio_por_departamento(id_costo_de_envio_por_departamento);

ALTER TABLE tb_pedidos_clientes
ADD CONSTRAINT ck_precio_total CHECK (precio_total > 0);

##------------------------------------------------------

CREATE TABLE tb_detalles_pedidos
(
	id_detalles_pedido INT PRIMARY KEY AUTO_INCREMENT,
	id_pedido_cliente INT NOT NULL,
	id_detalle_zapato INT NOT NULL,
	cantidad_pedido INT NOT NULL,
	precio_del_zapato DECIMAL(5,2) NOT NULL
);

##------------------------------------------------------CONSTRAINT (DETALLES PEDIDOS)
ALTER TABLE tb_detalles_pedidos
ADD CONSTRAINT fk_detalle_zapato 
FOREIGN KEY (id_detalle_zapato) REFERENCES tb_detalle_zapatos(id_detalle_zapato);

ALTER TABLE tb_detalles_pedidos
ADD CONSTRAINT fk_detalle_pedidos
FOREIGN KEY (id_pedido_cliente) REFERENCES tb_pedidos_clientes(id_pedido_cliente);

ALTER TABLE tb_detalles_pedidos
ADD CONSTRAINT ck_cantidad_pedido CHECK (cantidad_pedido >= 0);

ALTER TABLE tb_detalles_pedidos
ADD CONSTRAINT ck_precio_del_zapato CHECK (precio_del_zapato > 0);

##------------------------------------------------------

CREATE TABLE tb_comentarios
(
	id_comentario INT PRIMARY KEY AUTO_INCREMENT,
	titulo_comentario VARCHAR(165) NOT NULL,
	descripcion_comentario VARCHAR(165) NOT NULL,
	calificacion_comentario INT NOT NULL,
	estado_comentario ENUM('Activo', 'Desactivo'),
	fecha_del_comentario DATE,
    id_detalles_pedido INT
);

ALTER TABLE tb_comentarios
ADD CONSTRAINT fk_comentario_detalle 
FOREIGN KEY (id_detalles_pedido) REFERENCES tb_detalles_pedidos(id_detalles_pedido);

##-----TRIGERR
DELIMITER //
 
CREATE TRIGGER actualizar_existencias_zapato
AFTER INSERT ON tb_detalles_pedidos
FOR EACH ROW
BEGIN
    UPDATE tb_detalle_zapatos
    SET cantidad_zapato = cantidad_zapato - NEW.cantidad_pedido
    WHERE id_detalle_zapato = NEW.id_detalle_zapato;
END
 
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_tb_trabajadores
BEFORE INSERT ON tb_trabajadores
FOR EACH ROW
BEGIN
    IF NEW.fecha_de_nacimiento >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de nacimiento debe ser anterior a la fecha actual';
    END IF;
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER before_insert_tb_pedidos_clientes
BEFORE INSERT ON tb_pedidos_clientes
FOR EACH ROW
BEGIN
    IF NEW.fecha_de_entrega >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrega debe ser anterior a la fecha actual.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_insert_tb_pedidos_clientes_fi
BEFORE INSERT ON tb_pedidos_clientes
FOR EACH ROW
BEGIN
    IF NEW.fecha_de_inicio >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrega debe ser anterior a la fecha actual.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_insert_tb_comentarios
BEFORE INSERT ON tb_comentarios
FOR EACH ROW
BEGIN
    IF NEW.fecha_del_comentario >= CURRENT_DATE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La fecha de entrega debe ser anterior a la fecha actual.';
    END IF;
END;
//
DELIMITER ;

#----PROCEDIMIENTO
DELIMITER //

CREATE PROCEDURE Insertar_Trabajadores(
    IN nombre_trabajador VARCHAR(20),
    IN apellido_trabajador VARCHAR(20),
    IN dui_trabajador VARCHAR(10),
    IN telefono_trabajador VARCHAR(9),
    IN correo_trabajador VARCHAR(30),
    IN clave_trabajador VARCHAR(30),
    IN fecha_de_registro DATE,
    IN fecha_de_nacimiento DATE,
    IN id_nivel INT,
    IN estado_trabajador ENUM('Activo', 'Desactivo')
)
BEGIN
    -- Insertar datos en la tabla de trabajadores
    INSERT INTO tb_trabajadores (
        nombre_trabajador,
        apellido_trabajador,
        dui_trabajador,
        telefono_trabajador,
        correo_trabajador,
        clave_trabajador,
        fecha_de_registro,
        fecha_de_nacimiento,
        id_nivel,
        estado_trabajador
    ) VALUES (
        nombre_trabajador,
        apellido_trabajador,
        dui_trabajador,
        telefono_trabajador,
        correo_trabajador,
        clave_trabajador,
        fecha_de_registro,
        fecha_de_nacimiento,
        id_nivel,
        estado_trabajador
    );
END //

DELIMITER ;
 
 
#-------FUNCION
DELIMITER //
CREATE FUNCTION calcular_precio_total(id_pedido_cliente INT) RETURNS DOUBLE
BEGIN
    DECLARE total DOUBLE;
    SELECT SUM(d.cantidad_pedido * dz.precio_unitario_zapato) INTO total
    FROM tb_detalles_pedidos d
    INNER JOIN tb_detalle_zapatos dz ON d.id_detalle_zapato = dz.id_detalle_zapato
    WHERE d.id_pedido_cliente = id_pedido_cliente;
    RETURN total;
END //
DELIMITER ;

##INSERT NIVEL 
INSERT INTO tb_niveles (nivel)
VALUES
    ('Admin'),
    ('Trabajador'),
    ('Repartidor');

##INSERCION DE LOS TRABAJADORES
INSERT INTO tb_trabajadores (nombre_trabajador, apellido_trabajador, dui_trabajador, telefono_trabajador, correo_trabajador, clave_trabajador, fecha_de_registro, fecha_de_nacimiento, id_nivel, estado_trabajador)
VALUES
    ('Juan', 'Pérez', '12345678-9', '123456789', 'juan.perez@email.com', 'clave123', '2024-03-06', '1990-01-15', 1, 'Activo'),
    ('María', 'López', '98765432-1', '987654321', 'maria.lopez@email.com', 'clave456', '2024-03-06', '1985-08-22', 2, 'Activo'),
    ('Elena', 'García', '11122334-4', '111223344', 'elena.garcia@email.com', 'clave789', '2024-03-06', '1982-04-10', 3, 'Activo'),
    ('Carlos', 'Rodríguez', '87654321-0', '876543210', 'carlos.rodriguez@email.com', 'claveabc', '2024-03-06', '1995-12-03', 1, 'Activo'),
    ('Ana', 'Martínez', '56789012-3', '567890123', 'ana.martinez@email.com', 'clavexyz', '2024-03-06', '1988-07-17', 2, 'Activo'),
    ('Luis', 'Gómez', '11223344-5', '112233445', 'luis.gomez@email.com', 'clave123', '2024-03-06', '1992-11-28', 3, 'Activo'),
    ('Isabel', 'Hernández', '98765432-1', '987654321', 'isabel.hernandez@email.com', 'clave456', '2024-03-06', '1983-09-05', 1, 'Activo'),
    ('Javier', 'Sánchez', '22324455-6', '223344556', 'javier.sanchez@email.com', 'clave789', '2024-03-06', '1994-06-12', 2, 'Activo'),
    ('Carmen', 'Díaz', '33445566-7', '334445667', 'carmen.diaz@email.com', 'claveabc', '2024-03-06', '1987-02-20', 3, 'Activo'),
    ('Pedro', 'Ramírez', '44553677-8', '445866778', 'pedro.ramirez@email.com', 'clavexyz', '2024-03-06', '1998-04-30', 1, 'Activo'),
    ('Laura', 'Torres', '55867788-9', '556670889', 'laura.torres@email.com', 'clave123', '2024-03-06', '1981-10-08', 2, 'Activo'),
    ('Martín', 'Flores', '66778699-0', '667783990', 'martin.flores@email.com', 'clave456', '2024-03-06', '1993-03-25', 3, 'Activo'),
    ('Sofía', 'Lara', '77889600-1', '776899001', 'sofia.lara@email.com', 'clave789', '2024-03-06', '1986-05-14', 1, 'Activo'),
    ('Gabriel', 'Ortega', '88990011-2', '859900112', 'gabriel.ortega@email.com', 'claveabc', '2024-03-06', '1997-08-21', 2, 'Activo'),
    ('Verónica', 'Mendoza', '99001122-3', '990011223', 'veronica.mendoza@email.com', 'clavexyz', '2024-03-06', '1989-12-02', 3, 'Activo'),
    ('Raúl', 'Pinto', '00112233-4', '001122334', 'raul.pinto@email.com', 'clave123', '2024-03-06', '1996-01-09', 1, 'Activo'),
    ('Julia', 'Cruz', '11223344-5', '112233445', 'julia.cruz@email.com', 'clave456', '2024-03-06', '1984-07-18', 2, 'Activo'),
    ('Fernando', 'Salgado', '22634455-6', '223344556', 'fernando.salgado@email.com', 'clave789', '2024-03-06', '1991-09-26', 3, 'Activo'),
    ('Lucía', 'Herrera', '33445766-7', '334454667', 'lucia.herrera@email.com', 'claveabc', '2024-03-06', '1980-04-11', 1, 'Activo'),
    ('Diego', 'Vega', '44556477-8', '445563778', 'diego.vega@email.com', 'clavexyz', '2024-03-06', '1999-06-05', 2, 'Activo'),
    ('Marta', 'Gutierrez', '55467788-9', '506677889', 'marta.gutierrez@email.com', 'clave123', '2024-03-06', '1982-03-15', 3, 'Activo'),
    ('Roberto', 'Suarez', '66777899-0', '667748990', 'roberto.suarez@email.com', 'clave456', '2024-03-06', '1994-05-23', 1, 'Activo'),
    ('Patricia', 'Ríos', '88990011-2', '889900172', 'patricia.rios@email.com', 'claveabc', '2024-03-06', '1996-11-14', 3, 'Activo'),
    ('Gabriel', 'Molina', '99001122-3', '990011223', 'gabriel.molina@email.com', 'clavexyz', '2024-03-06', '1989-02-28', 1, 'Activo'),
    ('Silvia', 'Montes', '77889900-1', '778699001', 'silvia.montes@email.com', 'clave789', '2024-03-06', '1987-08-30', 2, 'Activo');

##INSERT DE LA MARCA
INSERT INTO tb_marcas (nombre_marca, foto_marca, descripcion_marca)
VALUES
    ('Nike', 'nike_logo.jpg', 'Marca reconocida por sus innovadores diseños y tecnología en calzado deportivo.'),
    ('Adidas', 'adidas_logo.jpg', 'Empresa alemana conocida por sus productos deportivos y de moda, incluyendo una amplia gama de zapatos.'),
    ('Puma', 'puma_logo.jpg', 'Marca de ropa y calzado deportivo con un enfoque en el estilo y la comodidad.'),
    ('Reebok', 'reebok_logo.jpg', 'Empresa estadounidense especializada en calzado deportivo y ropa casual.'),
    ('Converse', 'converse_logo.jpg', 'Famosa por sus zapatillas estilo casual, especialmente las icónicas Chuck Taylor.'),
    ('Vans', 'vans_logo.jpg', 'Marca californiana conocida por sus zapatillas de skate y moda urbana.'),
    ('New Balance', 'newbalance_logo.jpg', 'Especializada en calzado deportivo con énfasis en la comodidad y el soporte.'),
    ('Timberland', 'timberland_logo.jpg', 'Reconocida por sus botas resistentes y calzado casual de calidad.'),
    ('Skechers', 'skechers_logo.jpg', 'Empresa estadounidense que ofrece una variedad de calzado cómodo y moderno.'),
    ('Dr. Martens', 'drmartens_logo.jpg', 'Famosa por sus botas con suela de aire, icónicas en la cultura punk y alternativa.'),
    ('Clarks', 'clarks_logo.jpg', 'Marca británica conocida por sus zapatos de calidad y diseño clásico.'),
    ('Salomon', 'salomon_logo.jpg', 'Especializada en calzado para deportes al aire libre y actividades de montaña.'),
    ('Birkenstock', 'birkenstock_logo.jpg', 'Famosa por sus sandalias y zuecos con plantillas ergonómicas.'),
    ('Under Armour', 'underarmour_logo.jpg', 'Marca de ropa y calzado deportivo, especialmente popular en el ámbito del fitness.'),
    ('Mizuno', 'mizuno_logo.jpg', 'Especializada en calzado deportivo, especialmente en running y deportes de equipo.'),
    ('Fila', 'fila_logo.jpg', 'Marca italiana conocida por su calzado deportivo y moda urbana.'),
    ('Merrell', 'merrell_logo.jpg', 'Enfocada en calzado para actividades al aire libre y senderismo.'),
    ('Asics', 'asics_logo.jpg', 'Especializada en calzado para correr y deportes de alto rendimiento.'),
    ('Crocs', 'crocs_logo.jpg', 'Famosa por sus zuecos de plástico ligero y cómodo.'),
    ('Hush Puppies', 'hushpuppies_logo.jpg', 'Conocida por sus zapatos casuales y cómodos.'),
    ('Ecco', 'ecco_logo.jpg', 'Marca danesa reconocida por su calzado de calidad y comodidad.'),
    ('Keen', 'keen_logo.jpg', 'Especializada en calzado para actividades al aire libre y sandalias deportivas.'),
    ('Caterpillar', 'caterpillar_logo.jpg', 'Famosa por sus botas de trabajo resistentes y duraderas.'),
    ('Vivobarefoot', 'vivobarefoot_logo.jpg', 'Enfocada en calzado minimalista y barefoot para una experiencia natural.'),
    ('Saucony', 'saucony_logo.jpg', 'Especializada en calzado para correr con énfasis en la tecnología y rendimiento.');

##INSERT ZAPATO
INSERT INTO tb_zapatos (id_trabajador, id_marca, nombre_zapato, genero_zapato, descripcion_zapato, estado_zapato)
VALUES
    (1, 1, 'Air Max', 'Unisex', 'Zapatillas deportivas con tecnología Air Max de Nike.', 'Activo'),
    (2, 2, 'Ultra Boost', 'Masculino', 'Zapatillas de alto rendimiento para correr de Adidas.', 'Activo'),
    (2, 3, 'Ignite Flash', 'Femenino', 'Zapatillas de running elegantes y cómodas de Puma.', 'Activo'),
    (4, 4, 'Classic Leather', 'Unisex', 'Zapatillas clásicas de cuero de Reebok.', 'Activo'),
    (5, 5, 'Chuck Taylor All Star', 'Unisex', 'Iconicas zapatillas altas de Converse.', 'Activo'),
    (2, 6, 'Old Skool', 'Unisex', 'Zapatillas de skate clásicas de Vans.', 'Activo'),
    (7, 7, 'Fresh Foam 1080', 'Unisex', 'Zapatillas de running con amortiguación de New Balance.', 'Activo'),
    (8, 8, '6-Inch Premium Boot', 'Masculino', 'Botas de cuero impermeables de Timberland.', 'Activo'),
    (2, 9, 'Go Walk 4', 'Femenino', 'Zapatillas deportivas cómodas de Skechers.', 'Activo'),
    (10, 10, '1460', 'Unisex', 'Botas clásicas con cordones de Dr. Martens.', 'Activo'),
    (11, 11, 'Wallabee', 'Masculino', 'Zapatos casuales y cómodos de Clarks.', 'Activo'),
    (2, 12, 'Speedcross 4', 'Unisex', 'Zapatillas de trail running de Salomon.', 'Activo'),
    (13, 13, 'Arizona', 'Unisex', 'Sandalias con plantilla ergonómica de Birkenstock.', 'Activo'),
    (2, 14, 'UA HOVR Phantom', 'Unisex', 'Zapatillas de running con tecnología HOVR de Under Armour.', 'Activo'),
    (15, 15, 'Wave Rider 24', 'Unisex', 'Zapatillas de running de alto rendimiento de Mizuno.', 'Activo'),
    (16, 16, 'Disruptor II', 'Unisex', 'Zapatillas chunky y retro de Fila.', 'Activo'),
    (2, 17, 'Moab 2', 'Unisex', 'Botas de senderismo duraderas de Merrell.', 'Activo'),
    (18, 18, 'Gel-Kayano 27', 'Unisex', 'Zapatillas de running de alto soporte de Asics.', 'Activo'),
    (19, 19, 'Classic Clog', 'Unisex', 'Zuecos ligeros y cómodos de Crocs.', 'Activo'),
    (2, 20, 'Hush Puppies GT', 'Unisex', 'Zapatos casuales y cómodos de Hush Puppies.', 'Activo'),
    (21, 21, 'Soft 7', 'Unisex', 'Zapatos de cuero de calidad de Ecco.', 'Activo'),
    (22, 22, 'Newport H2', 'Unisex', 'Sandalias deportivas y resistentes de Keen.', 'Activo'),
    (2, 23, 'Second Shift Steel Toe', 'Unisex', 'Botas de trabajo con punta de acero de Caterpillar.', 'Activo'),
    (24, 24, 'Primus Lite', 'Unisex', 'Calzado minimalista y barefoot de Vivobarefoot.', 'Activo'),
    (2, 25, 'Ride ISO 2', 'Unisex', 'Zapatillas de running con tecnología ISOFIT de Saucony.', 'Activo');

##COLOR
INSERT INTO tb_colores (nombre_color)
VALUES
    ('Rojo'),
    ('Azul'),
    ('Verde'),
    ('Negro'),
    ('Blanco'),
    ('Amarillo'),
    ('Rosa'),
    ('Morado'),
    ('Naranja'),
    ('Gris'),
    ('Marrón'),
    ('Celeste'),
    ('Beige'),
    ('Turquesa'),
    ('Violeta'),
    ('Cian'),
    ('Ocre'),
    ('Salmon'),
    ('Lila'),
    ('Teal'),
    ('Índigo'),
    ('Caqui'),
    ('Fucsia'),
    ('Coral'),
    ('Aqua');

INSERT INTO tb_detalles_colores_zapatos (foto_zapato_color, id_color)
VALUES
    ('rojo_1.jpg', 1),
    ('azul_1.jpg', 2),
    ('verde_1.jpg', 3),
    ('negro_1.jpg', 4),
    ('blanco_1.jpg', 5),
    ('amarillo_1.jpg', 6),
    ('rosa_1.jpg', 7),
    ('morado_1.jpg', 8),
    ('naranja_1.jpg', 9),
    ('gris_1.jpg', 10),
    ('marron_1.jpg', 11),
    ('celeste_1.jpg', 12),
    ('beige_1.jpg', 13),
    ('turquesa_1.jpg', 14),
    ('violeta_1.jpg', 15),
    ('cian_1.jpg', 16),
    ('ocre_1.jpg', 17),
    ('salmon_1.jpg', 18),
    ('lila_1.jpg', 19),
    ('teal_1.jpg', 20),
    ('indigo_1.jpg', 21),
    ('caqui_1.jpg', 22),
    ('fucsia_1.jpg', 23),
    ('coral_1.jpg', 24),
    ('aqua_1.jpg', 25);

##MAS COLOR 
INSERT INTO tb_detalles_colores_zapatos (foto_zapato_color, id_color)
VALUES
    ('rojo_zapato_1.jpg', 25),
    ('azul_zapato_2.jpg', 24),
    ('verde_zapato_3.jpg', 23),
    ('negro_zapato_4.jpg', 22),
    ('blanco_zapato_5.jpg', 21),
    ('amarillo_zapato_6.jpg', 20),
    ('rosa_zapato_7.jpg', 19),
    ('morado_zapato_8.jpg', 18),
    ('naranja_zapato_9.jpg', 17),
    ('gris_zapato_10.jpg', 16),
    ('marron_zapato_11.jpg', 15),
    ('celeste_zapato_12.jpg', 14),
    ('beige_zapato_13.jpg', 13),
    ('turquesa_zapato_14.jpg', 12),
    ('violeta_zapato_15.jpg', 11),
    ('cian_zapato_16.jpg', 10),
    ('ocre_zapato_17.jpg', 9),
    ('salmon_zapato_18.jpg', 8),
    ('lila_zapato_19.jpg', 7),
    ('teal_zapato_20.jpg', 6),
    ('indigo_zapato_21.jpg', 5),
    ('caqui_zapato_22.jpg', 4),
    ('fucsia_zapato_23.jpg', 3),
    ('coral_zapato_24.jpg', 2),
    ('aqua_zapato_25.jpg', 1);

##INSERT DE TALLA
INSERT INTO tb_tallas (num_talla)
VALUES
    ('35'),
    ('36'),
    ('37'),
    ('38'),
    ('39'),
    ('40'),
    ('41'),
    ('42'),
    ('43'),
    ('44'),
    ('45'),
    ('46'),
    ('47'),
    ('48'),
    ('49'),
    ('50'),
    ('5.5'),
    ('6'),
    ('6.5'),
    ('7'),
    ('7.5'),
    ('8'),
    ('8.5'),
    ('9'),
    ('9.5');

##INSERT DE DETALLE ZAPATO
INSERT INTO tb_detalle_zapatos (id_zapato, id_talla, cantidad_zapato, id_detalle_color_zapato, precio_unitario_zapato)
VALUES
    (1, 1, 5, 1, 89.99),
    (2, 2, 3, 2, 109.99),
    (3, 3, 8, 3, 74.99),
    (4, 4, 10, 4, 129.99),
    (5, 5, 7, 5, 59.99),
    (6, 6, 2, 6, 79.99),
    (7, 7, 4, 7, 94.99),
    (8, 8, 6, 8, 149.99),
    (9, 9, 3, 9, 69.99),
    (10, 10, 9, 10, 119.99),
    (11, 11, 12, 11, 54.99),
    (12, 12, 15, 12, 89.99),
    (13, 13, 8, 13, 79.99),
    (14, 14, 5, 14, 109.99),
    (15, 15, 7, 15, 64.99),
    (16, 16, 10, 16, 129.99),
    (17, 17, 4, 17, 44.99),
    (18, 18, 6, 18, 94.99),
    (19, 19, 3, 19, 69.99),
    (20, 20, 9, 20, 119.99),
    (21, 21, 12, 21, 54.99),
    (22, 22, 15, 22, 89.99),
    (23, 23, 8, 23, 79.99),
    (24, 24, 5, 24, 109.99),
    (25, 25, 7, 25, 64.99);

##INSERt de cliente 
INSERT INTO tb_clientes (nombre_cliente, apellido_cliente, dui_cliente, telefono_cliente, correo_cliente, direccion_cliente, clave_cliente, fecha_de_registro, fecha_de_nacimiento, estado_cliente)
VALUES
    ('Javier', 'Sánchez', '22334455-6', '334455607', 'javier.sanchez@email.com', 'Calle de los Olivos #1415', 'clave1415', '2024-03-06', '1994-06-12', 'Activo'),
    ('Carmen', 'Díaz', '3445566-7', '44556678', 'carmen.diaz@email.com', 'Avenida del Parque #1617', 'clave1617', '2024-03-06', '1987-02-20', 'Activo'),
    ('Pedro', 'Ramírez', '44556477-8', '516677889', 'pedro.ramirez@email.com', 'Calle de las Flores #1819', 'clave1819', '2024-03-06', '1998-04-30', 'Activo'),
    ('Laura', 'Torres', '55637788-9', '667588990', 'laura.torres@email.com', 'Boulevard de la Luna #2021', 'clave2021', '2024-03-06', '1981-10-08', 'Activo'),
    ('Martín', 'Flores', '66778889-0', '748899001', 'martin.flores@email.com', 'Calle de los Sueños #2223', 'clave2223', '2024-03-06', '1993-03-25', 'Activo'),
    ('Sofía', 'Lara', '77889900-1', '889900212', 'sofia.lara@email.com', 'Avenida de las Estrellas #2425', 'clave2425', '2024-03-06', '1986-05-14', 'Activo'),
    ('Gabriel', 'Ortega', '88990011-2', '990011223', 'gabriel.ortega@email.com', 'Calle de la Aurora #2627', 'clave2627', '2024-03-06', '1997-08-21', 'Activo'),
    ('Verónica', 'Mendoza', '99001122-3', '112233445', 'veronica.mendoza@email.com', 'Boulevard del Sol #2829', 'clave2829', '2024-03-06', '1989-12-02', 'Activo'),
    ('Raúl', 'Pinto', '00112233-4', '223344556', 'raul.pinto@email.com', 'Avenida del Cielo #3031', 'clave3031', '2024-03-06', '1996-01-09', 'Activo'),
    ('Julia', 'Cruz', '11223344-5', '334455667', 'julia.cruz@email.com', 'Calle del Mar #3233', 'clave3233', '2024-03-06', '1984-07-18', 'Activo'),
    ('Fernando', 'Salgado', '22334555-6', '045566778', 'fernando.salgado@email.com', 'Boulevard del Viento #3435', 'clave3435', '2024-03-06', '1991-09-26', 'Activo'),
    ('Lucía', 'Herrera', '33445566-7', '557677889', 'lucia.herrera@email.com', 'Calle del Océano #3637', 'clave3637', '2024-03-06', '1980-04-11', 'Activo'),
    ('Diego', 'Vega', '44556977-8', '667688990', 'diego.vega@email.com', 'Avenida de la Montaña #3839', 'clave3839', '2024-03-06', '1999-06-05', 'Activo'),
    ('Marta', 'Gutierrez', '55667688-9', '778499001', 'marta.gutierrez@email.com', 'Boulevard del Bosque #4041', 'clave4041', '2024-03-06', '1982-03-15', 'Activo'),
    ('Roberto', 'Suarez', '66778859-0', '889970112', 'roberto.suarez@email.com', 'Calle del Río #4243', 'clave4243', '2024-03-06', '1994-05-23', 'Activo'),
    ('Patricia', 'Ríos', '88990012-2', '990511223', 'patricia.rios@email.com', 'Avenida del Campo #4445', 'clave4445', '2024-03-06', '1996-11-14', 'Activo'),
    ('Gabriel', 'Molina', '99001122-9', '112236445', 'gabriel.molina@email.com', 'Boulevard de las Aves #4647', 'clave4647', '2024-03-06', '1989-02-28', 'Activo'),
    ('Silvia', 'Montes', '77889900-3', '223344656', 'silvia.montes@email.com', 'Calle de la Selva #4849', 'clave4849', '2024-03-06', '1987-08-30', 'Activo'),
    ('Jorge', 'Navarro', '66778599-0', '445566878', 'jorge.navarro@email.com', 'Boulevard del Desierto #5051', 'clave5051', '2024-03-06', '1994-01-17', 'Activo'),
    ('Natalia', 'Castañeda', '44556577-8', '667787990', 'natalia.castaneda@email.com', 'Avenida de la Luna #5253', 'clave5253', '2024-03-06', '1985-06-28', 'Activo'),
    ('Hugo', 'Contreras', '55663788-9', '879900112', 'hugo.contreras@email.com', 'Calle del Arco Iris #5455', 'clave5455', '2024-03-06', '1993-09-10', 'Activo'),
    ('Ana', 'Pérez', '44546677-8', '556977889', 'ana.perez@email.com', 'Boulevard de las Mariposas #5657', 'clave5657', '2024-03-06', '1988-12-24', 'Activo'),
    ('Luis', 'Vargas', '77889900-9', '667784990', 'luis.vargas@email.com', 'Avenida del Vino #5859', 'clave5859', '2024-03-06', '1982-02-06', 'Activo'),
    ('Marcela', 'García', '11223364-5', '223444556', 'marcela.garcia@email.com', 'Calle de las Palmeras #6061', 'clave6061', '2024-03-06', '1991-08-14', 'Activo'),
    ('Ricardo', 'López', '33545566-7', '445266778', 'ricardo.lopez@email.com', 'Boulevard de las Flores #6263', 'clave6263', '2024-03-06', '1986-03-30', 'Activo'),
    ('Eva', 'Martínez', '55767788-9', '667780990', 'eva.martinez@email.com', 'Avenida de las Fuentes #6465', 'clave6465', '2024-03-06', '1980-11-09', 'Activo');

CALL sp_realizar_pedido(7, 8, 'En proceso', 165.25, '2024-03-01', '2024-03-05', 4, 15, 3, 55.75, 7, 'Excelente calidad de productos', 5, true);
CALL sp_realizar_pedido(9, 10, 'En espera', 135.50, '2024-03-06', '2024-03-06', 3, 6, 4, 32.99, 8, 'Envío rápido y seguro', 4, true);
CALL sp_realizar_pedido(11, 12, 'Entregado', 220.00, '2024-03-06', '2024-03-06', 1, 8, 2, 110.00, 9, 'Producto tal como se describe', 5, true);
CALL sp_realizar_pedido(23, 24, 'En proceso', 195.99, '2024-03-06', '2024-03-06', 2, 20, 5, 45.99, 15, 'Buen servicio al cliente', 4, true);
CALL sp_realizar_pedido(1, 2, 'En proceso', 150.99, '2024-03-06', '2024-03-06', 3, 1, 2, 75.99, 1, '¡Excelente servicio!', 5, true);
CALL sp_realizar_pedido(3, 4, 'En espera', 120.50, '2024-03-06', '2024-03-06', 1, 2, 3, 89.50, 2, 'Pedido rápido y eficiente', 4, true);
CALL sp_realizar_pedido(5, 6, 'Entregado', 200.75, '2024-03-06', '2024-03-06', 2, 3, 1, 200.75, 3, 'Producto de alta calidad', 5, true);
CALL sp_realizar_pedido(7, 8, 'En proceso', 165.25, '2024-03-06', '2024-03-06', 4, 4, 2, 55.75, 4, 'Excelente calidad de productos', 5, true);
CALL sp_realizar_pedido(9, 10, 'En espera', 135.50, '2024-03-06', '2024-03-06', 3, 5, 4, 32.99, 5, 'Envío rápido y seguro', 4, true);
CALL sp_realizar_pedido(11, 12, 'Entregado', 220.00, '2024-03-06', '2024-03-06', 1, 6, 1, 110.00, 6, 'Producto tal como se describe', 5, true);
CALL sp_realizar_pedido(13, 14, 'En proceso', 185.99, '2024-03-06', '2024-03-06', 5, 7, 3, 45.99, 7, 'Buen servicio al cliente', 4, true);
CALL sp_realizar_pedido(15, 16, 'En espera', 155.25, '2024-03-06', '2024-03-06', 2, 8, 2, 77.62, 8, 'Recomendado totalmente', 5, true);
CALL sp_realizar_pedido(17, 18, 'Entregado', 240.50, '2024-03-06', '2024-03-06', 4, 9, 5, 48.10, 9, 'Satisfecho con la compra', 4, true);
CALL sp_realizar_pedido(19, 20, 'En proceso', 210.75, '2024-03-06', '2024-03-06', 3, 10, 4, 52.69, 10, 'Entrega rápida y eficiente', 5, true);
CALL sp_realizar_pedido(21, 22, 'Entregado', 185.25, '2024-03-06', '2024-03-06', 1, 11, 3, 61.75, 11, 'Muy contento con mi pedido', 5, true);
CALL sp_realizar_pedido(23, 24, 'En proceso', 195.99, '2024-03-06', '2024-03-06', 2, 12, 5, 39.20, 12, 'Excelente atención al cliente', 4, true);
CALL sp_realizar_pedido(2, 3, 'En espera', 170.50, '2024-03-06', '2024-03-06', 3, 13, 2, 85.25, 13, 'Buena calidad, entrega rápida', 5, true);
CALL sp_realizar_pedido(4, 5, 'Entregado', 210.00, '2024-03-06', '2024-03-06', 4, 14, 4, 52.50, 14, 'Producto cumplió mis expectativas', 4, true);
CALL sp_realizar_pedido(6, 7, 'En proceso', 180.25, '2024-03-06', '2024-03-06', 5, 15, 3, 60.08, 15, 'Muy satisfecho con la compra', 5, true);
CALL sp_realizar_pedido(8, 9, 'En espera', 195.75, '2024-03-06', '2024-03-06', 2, 16, 5, 39.15, 16, 'Buena atención al cliente', 4, true);
CALL sp_realizar_pedido(10, 11, 'Entregado', 230.50, '2024-03-06', '2024-03-06', 3, 17, 2, 115.25, 17, 'Pedido recibido en perfectas condiciones', 5, true);
CALL sp_realizar_pedido(12, 13, 'En proceso', 185.99, '2024-03-06', '2024-03-06', 4, 18, 4, 46.50, 18, 'Muy rápido el envío', 4, true);
CALL sp_realizar_pedido(14, 15, 'En espera', 155.25, '2024-03-06', '2024-03-06', 1, 19, 3, 51.75, 19, 'Producto de buena calidad', 5, true);
CALL sp_realizar_pedido(16, 17, 'Entregado', 240.50, '2024-03-06', '2024-03-06', 5, 20, 5, 48.10, 20, 'Satisfecho con la compra', 4, true);
CALL sp_realizar_pedido(18, 19, 'En proceso', 210.75, '2024-03-06', '2024-03-06', 3, 21, 4, 52.69, 21, 'Entrega rápida y eficiente', 5, true);
