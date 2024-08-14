<%-- 
    Document   : editarContato
    Created on : 14 de ago. de 2024, 14:59:51
    Author     : Aluno
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.contatos.Contato" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Contato</title>
</head>
<body>
    <h2>Editar Contato</h2>
    
    <%
        String idS = request.getParameter("id");
        if (idS != null && !idS.isEmpty()) {
            int id = Integer.parseInt(idS);
            List<Contato> contatos = Contato.getContato(id);
            if (!contatos.isEmpty()) {
                Contato contato = contatos.get(0); // Supondo que getContato retorna uma lista com um único contato
    %> 
    <form action="atualizaContato.jsp" method="post">
        <input type="hidden" id="id" name="id" value="<%= contato.getId() %>">
        Nome: <input type="text" name="nome" required value="<%= contato.getNome() %>"><br>
        Telefone: <input type="text" name="telefone" required value="<%= contato.getTelefone() %>"><br>
        Idade: <input type="number" name="idade" required value="<%= contato.getIdade() %>" min="0"><br>
        <input type="submit" value="Salvar Contato">
    </form>
    <%
            } else {
                out.print("Contato não encontrado.");
            }
        } else {
            out.print("ID do contato não fornecido.");
        }
    %>
</body>
</html>

