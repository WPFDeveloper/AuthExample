CREATE DATABASE TorgDB
GO
USE TorgDB
GO
CREATE TABLE [Role]
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title NVARCHAR(100) NOT NULL
)

CREATE TABLE Person
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Login] NVARCHAR(100) NOT NULL,
	[Password] NVARCHAR(100) NOT NULL,
	Surname NVARCHAR(100) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	Patronymic NVARCHAR(100) NOT NULL,
	Email NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(100) NOT NULL,
	IdRole INT NOT NULL FOREIGN KEY REFERENCES [Role](Id)

)
GO
CREATE TABLE TechnicType
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE Request
(
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IdTechnicType  INT NOT NULL FOREIGN KEY REFERENCES TechnicType(Id),
	IdClient INT NOT NULL FOREIGN KEY REFERENCES Person(Id),
	Model NVARCHAR(100) NOT NULL,
	DateStart DATE NOT NULL,
	Datend DATE NOT NULL,
	[Description]  NVARCHAR(100) NOT NULL,
	IdMaster  INT FOREIGN KEY REFERENCES Person(Id)
)
GO
CREATE PROCEDURE AddPerson(
@Login NVARCHAR(100) ,
	@Password NVARCHAR(100) ,
	@Surname NVARCHAR(100) ,
	@Name NVARCHAR(100) ,
	@Patronymic NVARCHAR(100) ,
	@Email NVARCHAR(100) ,
	@Phone NVARCHAR(100) ,
	@IdRole INT 
)
AS
BEGIN
	INSERT INTO Person VALUES
	(@Login ,
	@Password ,
	@Surname ,
	@Name ,
	@Patronymic ,
	@Email ,
	@Phone ,
	@IdRole  )
END;
GO
CREATE PROCEDURE AddRequest(
	@IdTechnicType  INT ,
	@IdClient INT ,
	@Model NVARCHAR(100) ,
	@DateStart DATE ,
	@Datend DATE ,
	@Description  NVARCHAR(100) ,
	@IdMaster  INT
)
AS
BEGIN
	INSERT INTO Request VALUES
	(	@IdTechnicType   ,
	@IdClient  ,
	@Model  ,
	@DateStart  ,
	@Datend  ,
	@Description   ,
	@IdMaster  )
END;
GO
CREATE PROCEDURE AddRole( @Title NVARCHAR(100))
AS
BEGIN
	INSERT INTO [Role] VALUES
	(@Title)
END;
GO
CREATE PROCEDURE AddTechnicType( @Title NVARCHAR(100))
AS
BEGIN
	INSERT INTO TechnicType VALUES
	(@Title)
END;
GO
CREATE PROCEDURE DeleteRequest
(@Id INT)
AS
BEGIN
	DELETE Request WHERE Id = @Id
END;
GO
CREATE PROCEDURE DeletePerson
(@Id INT)
AS
BEGIN
	DELETE Person WHERE Id = @Id
END;
GO
CREATE PROCEDURE DeleteRole
(@Id INT)
AS 
BEGIN
	DELETE Person WHERE IdRole = @Id
	DELETE [Role] WHERE Id = @Id
END;
GO
CREATE PROCEDURE DeleteTechnicType
(@Id INT)
AS 
BEGIN
	DELETE Request WHERE IdTechnicType = @Id
	DELETE TechnicType WHERE Id = @Id
END;
GO
CREATE PROCEDURE UpdatPerson( @Id INT,
@Login NVARCHAR(100) ,
	@Password NVARCHAR(100) ,
	@Surname NVARCHAR(100) ,
	@Name NVARCHAR(100) ,
	@Patronymic NVARCHAR(100) ,
	@Email NVARCHAR(100) ,
	@Phone NVARCHAR(100) ,
	@IdRole INT 
)
AS
BEGIN
	UPDATE Person SET
	[Login]  = @Login,
	[Password] = @Password ,
	Surname = @Surname ,
	[Name] = @Name ,
	Patronymic = @Patronymic ,
	Email = @Email ,
	Phone = @Phone ,
	IdRole = @IdRole
	WHERE Id = @Id
END;
GO
CREATE PROCEDURE UpdateRequest( @Id INT,
	@IdTechnicType  INT ,
	@IdClient INT ,
	@Model NVARCHAR(100) ,
	@DateStart DATE ,
	@Datend DATE ,
	@Description  NVARCHAR(100) ,
	@IdMaster  INT
)
AS
BEGIN
	UPDATE Request SET
	IdTechnicType = @IdTechnicType  ,
	IdClient = @IdClient ,
	Model = @Model ,
	DateStart = @DateStart ,
	Datend = @Datend ,
	[Description] = @Description ,
	IdMaster  = @IdMaster
	WHERE Id = @Id
END;
GO
CREATE PROCEDURE UpdatRole(@Id INT, @Title NVARCHAR(100))
AS
BEGIN
	UPDATE [Role] SET 
	Title = @Title
	WHERE @Id = Id
END;
GO
CREATE PROCEDURE UpdatTechnicType(@Id INT, @Title NVARCHAR(100))
AS
BEGIN
	UPDATE TechnicType SET 
	Title = @Title
	WHERE @Id = Id
END;

GO

INSERT INTO [Role] VALUES
('Клиент'),
('Сотрудник');

GO

INSERT INTO TechnicType VALUES
('Теливизор'),
('Ноутбук');