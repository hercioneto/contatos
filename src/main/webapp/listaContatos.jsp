<%-- 
    Document   : listaContato
    Created on : 14 de ago. de 2024, 14:56:37
    Author     : Aluno
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.contatos.Contato" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Contatos</title>
</head>
<body>
    <h2>Lista de Contatos</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Telefone</th>
            <th>Idade</th>
            <th>Editar</th>
            <th>Visualizar</th>
            <th>Excluir</th>
        </tr>
        <%
            List<Contato> contatos = Contato.getAllContatos();
            for (Contato contato : contatos) {
        %>
        <tr>
            <td><%= contato.getId() %></td>
            <td><%= contato.getNome() %></td>
            <td><%= contato.getTelefone() %></td>
            <td><%= contato.getIdade() %></td>
            <td><a href="editarContato.jsp?id=<%= contato.getId() %>">Editar</a></td>
            <td><a href="verContato.jsp?id=<%= contato.getId() %>">Ver</a></td>
            <td><a href="excluirContato.jsp?id=<%= contato.getId() %>">Excluir</a></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>

