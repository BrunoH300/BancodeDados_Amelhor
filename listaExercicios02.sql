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


