<%-- 
    Document   : verContato
    Created on : 14 de ago. de 2024, 15:03:22
    Author     : Aluno
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.contatos.Contato" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Visualizar Contato</title>
</head>
<body>
    <h1>Visualizar Contato</h1>
    <%
        String idS = request.getParameter("id");
        if (idS != null && !idS.isEmpty()) {
            try {
                int id = Integer.parseInt(idS);
                List<Contato> contatos = Contato.getContato(id);
                if (contatos.isEmpty()) {
                    out.println("Contato não encontrado.");
                } else {
                    Contato contato = contatos.get(0); // Assumindo que getContato retorna uma lista com um único item.
    %>
    <div><strong>Nome:</strong> <%= contato.getNome() %></div>
    <div><strong>Telefone:</strong> <%= contato.getTelefone() %></div>
    <div><strong>Idade:</strong> <%= contato.getIdade() %></div>
    <%
                }
            } catch (NumberFormatException e) {
                out.println("ID do contato inválido.");
            }
        } else {
            out.println("ID do contato não fornecido.");
        }
    %>
    <p><a href="listaContatos.jsp">Voltar para a lista de contatos</a></p>
    <p><a href="cadastrarContato.jsp">Cadastrar novo contato</a></p>
</body>
</html>

