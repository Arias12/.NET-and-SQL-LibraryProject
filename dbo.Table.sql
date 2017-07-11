CREATE TABLE [dbo].[Ksiazki]
(
	[Id] INT NOT NULL , 
    [TytulKsiazki] VARCHAR(MAX) NOT NULL, 
	[Autor] VARCHAR(50) NOT NULL,
    [Egzemplarz] INT NOT NULL, 
    [DataWypozyczenia] DATE NULL, 
    [DataZwrotu] DATE NULL, 
    [Wypozyczajacy] VARCHAR(50) NULL, 
    [Status] VARCHAR(MAX) NOT NULL, 
    PRIMARY KEY ([Id]), 
    
)
