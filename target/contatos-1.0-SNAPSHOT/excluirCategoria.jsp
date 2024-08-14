<%-- 
    Document   : excluirCategoria
    Created on : 14 de ago. de 2024, 16:05:00
    Author     : Aluno
--%>

<%@ page import="com.mycompany.contatos.Categoria" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Excluir Categoria</title>
</head>
<body>
    <h1>Excluindo Categoria!</h1>
    <%
        String idS = request.getParameter("id");
        if (idS != null && !idS.isEmpty()) {
            try {
                int id = Integer.parseInt(idS);
                Categoria categoria = new Categoria();
                categoria.setId(id);

                boolean sucesso = categoria.deletar();

                if (sucesso) {
                    out.println("Categoria excluída com sucesso!");
                } else {
                    out.println("Erro ao excluir categoria.");
                }
            } catch (NumberFormatException e) {
                out.println("ID da categoria inválido.");
            }
        } else {
            out.println("ID da categoria não fornecido.");
        }
    %>
    <p><a href="listaCategorias.jsp">Voltar para lista de categorias.</a></p>
    <p><a href="cadastrarCategoria.jsp">Cadastrar nova categoria</a></p>
</body>
</html>
