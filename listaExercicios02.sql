Questão 1{
  CREATE PROCEDURE sp_ListarAutores
AS
BEGIN
    SELECT * FROM Autores;
END;
}
Questão 2{
  CREATE PROCEDURE sp_LivrosPorCategoria
    Categoria NVARCHAR(50)
AS
BEGIN
    SELECT Livros.Titulo
    FROM Livros
    INNER JOIN Categorias ON Livros.CategoriaID = Categorias.ID
    WHERE Categorias.Nome = Categoria;
END;
}
Questão 3{
  CREATE PROCEDURE sp_ContarLivrosPorCategoria
    Categoria NVARCHAR(50)
AS
BEGIN
    SELECT COUNT(Livros.ID) AS TotalLivros
    FROM Livros
    INNER JOIN Categorias ON Livros.CategoriaID = Categorias.ID
    WHERE Categorias.Nome = Categoria;
END;
}
Questão 4 {
  CREATE PROCEDURE sp_VerificarLivrosCategoria
    Categoria NVARCHAR(50)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Livros
        INNER JOIN Categorias ON Livros.CategoriaID = Categorias.ID
        WHERE Categorias.Nome = Categoria
    )
    BEGIN
        PRINT 'A categoria possui livros.';
    END
    ELSE
    BEGIN
        PRINT 'A categoria não possui livros.';
    END
END;
}
Questão 5 {
  CREATE PROCEDURE sp_LivrosAteAno
    Ano INT
AS
BEGIN
    SELECT Titulo
    FROM Livros
    WHERE AnoPublicacao <= Ano;
END;
}

Questão 6 {
  CREATE PROCEDURE sp_TitulosPorCategoria
    Categoria NVARCHAR(50)
AS
BEGIN
    DECLARE Titulo NVARCHAR(100);
    
    DECLARE cur CURSOR FOR
    SELECT Livros.Titulo
    FROM Livros
    INNER JOIN Categorias ON Livros.CategoriaID = Categorias.ID
    WHERE Categorias.Nome = Categoria;

    OPEN cur;

    FETCH NEXT FROM cur INTO Titulo;

    WHILE FETCH_STATUS = 0
    BEGIN
        PRINT Titulo;
        FETCH NEXT FROM cur INTO Titulo;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
}

Questão 7 {
  CREATE PROCEDURE sp_AdicionarLivro
    Titulo NVARCHAR(100),
    AutorID INT,
    CategoriaID INT,
    AnoPublicacao INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Livros (Titulo, AutorID, CategoriaID, AnoPublicacao)
        VALUES (Titulo, AutorID, CategoriaID, AnoPublicacao);
        PRINT 'Livro adicionado com sucesso.';
    END TRY
    BEGIN CATCH
        PRINT 'Erro ao adicionar o livro: ' + ERROR_MESSAGE();
    END CATCH;
END;
0
}




