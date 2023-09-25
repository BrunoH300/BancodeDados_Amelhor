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

