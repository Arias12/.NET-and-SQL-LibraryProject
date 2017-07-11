CREATE TABLE [dbo].[Table]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [TytulKsiazki] VARCHAR(MAX) NOT NULL, 
    [Egzemplarz] NCHAR(10) NOT NULL, 
    [DataWypozyczenia] NCHAR(10) NULL, 
    [DataZwrotu] NCHAR(10) NULL, 
    [Wypozyczajacy] NCHAR(10) NULL
)
