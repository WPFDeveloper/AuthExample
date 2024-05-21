CREATE DATABASE ExamDB
GO
USE ExamDB
GO
CREATE TABLE [User] (
	Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Login] NVARCHAR(100) NOT NULL,
	[Password] NVARCHAR(100) NOT NULL,
	Surname NVARCHAR(100) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	Patronymic NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(100) NOT NULL,
	Email NVARCHAR(100) NOT NULL,
)
GO
CREATE PROCEDURE AddUser (@Login NVARCHAR(100),
	@Password NVARCHAR(100),
	@Surname NVARCHAR(100),
	@Name NVARCHAR(100),
	@Patronymic NVARCHAR(100),
	@Phone NVARCHAR(100),
	@Email NVARCHAR(100))
AS
BEGIN
	INSERT INTO [User] VALUES 
	(@Login  ,
	@Password  ,
	@Surname,
	@Name  ,
	@Patronymic,
	@Phone ,
	@Email )
END;
GO
CREATE PROCEDURE DeleteUser (@Id INT)
AS
BEGIN
	DELETE [User] WHERE Id = @Id
END;
GO
CREATE PROCEDURE EditUser (@Id INT, @Login NVARCHAR(100) ,
	@Password NVARCHAR(100),
	@Surname NVARCHAR(100),
	@Name NVARCHAR(100),
	@Patronymic NVARCHAR(100),
	@Phone NVARCHAR(100),
	@Email NVARCHAR(100))
AS
BEGIN
	UPDATE [User] SET
	[Login] = @Login  ,
	[Password] = @Password  ,
	[Surname] = @Surname,
	[Name] = @Name  ,
	Patronymic = @Patronymic,
	Phone = @Phone,
	Email = @Email
	WHERE Id = @Id
END;