<%-- 
    Document   : verCategoria
    Created on : 14 de ago. de 2024, 16:20:00
    Author     : Aluno
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.contatos.Categoria" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Visualizar Categoria</title>
</head>
<body>
    <h1>Visualizar Categoria</h1>
    <%
        String idS = request.getParameter("id");
        if (idS != null && !idS.isEmpty()) {
            try {
                int id = Integer.parseInt(idS);
                List<Categoria> categorias = Categoria.getCategoria(id);
                if (categorias.isEmpty()) {
                    out.println("Categoria não encontrada.");
                } else {
                    Categoria categoria = categorias.get(0); // Assumindo que getCategoria retorna uma lista com um único item.
    %>
    <div><strong>Nome:</strong> <%= categoria.getNome() %></div>
    <%
                }
            } catch (NumberFormatException e) {
                out.println("ID da categoria inválido.");
            }
        } else {
            out.println("ID da categoria não fornecido.");
        }
    %>
    <p><a href="listaCategorias.jsp">Voltar para a lista de categorias</a></p>
    <p><a href="cadastrarCategoria.jsp">Cadastrar nova categoria</a></p>
</body>
</html>
