Use autenticacion;

CREATE TABLE Usuario (
	ID INT NOT NULL AUTO_INCREMENT, 
	Nombre VARCHAR(50) NOT NULL, 
	Apellido VARCHAR(50), 
	Email VARCHAR(100), 
	Fecha_Nacimiento DATE,
	Activo TINYINT,
	PRIMARY KEY (ID)
);
ALTER TABLE Usuario ADD CONSTRAINT UK_Email UNIQUE (Email);


CREATE TABLE Historial_Conexion (
	ID INT NOT NULL AUTO_INCREMENT,
	ID_Usuario INT NOT NULL,
	Fecha_Hora DATETIME NOT NULL,
	IP VARCHAR(15), 
	Navegador VARCHAR(50), 
	PRIMARY KEY (ID),
	FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID)
);


CREATE TABLE Menu (
	ID INT NOT NULL AUTO_INCREMENT,
	Titulo VARCHAR(50) NOT NULL, 
	Descripcion VARCHAR(150), 
	URL VARCHAR(150), 
	Activo TINYINT DEFAULT 0 NOT NULL,
	PRIMARY KEY (ID),
	CONSTRAINT CHK_Menu_Activo CHECK (Activo IN (0, 1))
);


CREATE TABLE Menu_Usuario (
	ID_Usuario INT,
	ID_Menu INT,
	Fecha_Habilitado DATE
);

ALTER TABLE Menu_Usuario MODIFY Fecha_Habilitado DATETIME;
ALTER TABLE Menu_Usuario ADD CONSTRAINT PK_Menu_Usuario PRIMARY KEY (ID_Usuario, ID_Menu);
ALTER TABLE Menu_Usuario ADD FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID);
ALTER TABLE Menu_Usuario ADD FOREIGN KEY (ID_Menu) REFERENCES Menu(ID);