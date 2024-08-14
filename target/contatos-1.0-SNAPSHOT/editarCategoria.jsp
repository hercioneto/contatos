<%-- 
    Document   : editarCategoria
    Created on : 14 de ago. de 2024, 16:00:00
    Author     : Aluno
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.contatos.Categoria" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Categoria</title>
</head>
<body>
    <h2>Editar Categoria</h2>
    
    <%
        String idS = request.getParameter("id");
        if (idS != null && !idS.isEmpty()) {
            int id = Integer.parseInt(idS);
            List<Categoria> categorias = Categoria.getCategoria(id);
            if (!categorias.isEmpty()) {
                Categoria categoria = categorias.get(0); // Supondo que getCategoria retorna uma lista com uma única categoria
    %> 
    <form action="atualizaCategoria.jsp" method="post">
        <input type="hidden" id="id" name="id" value="<%= categoria.getId() %>">
        Nome: <input type="text" name="nome" required value="<%= categoria.getNome() %>"><br>
        <input type="submit" value="Salvar Categoria">
    </form>
    <%
            } else {
                out.print("Categoria não encontrada.");
            }
        } else {
            out.print("ID da categoria não fornecido.");
        }
    %>
</body>
</html>
