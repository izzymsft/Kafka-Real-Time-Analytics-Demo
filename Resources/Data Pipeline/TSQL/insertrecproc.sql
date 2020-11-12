USE [testDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[fruit_insert] as

	Declare @Id int
	Set @Id = 1

	While @Id <= 10 
Begin
	Insert Into fruit values ('Fruit - ' + CAST(@Id as varchar(255)),
              FLOOR(RAND()*(60-10+1))+10)
	Print @Id
	Set @Id = @Id + 1
End
GO