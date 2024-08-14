<%-- 
    Document   : excluirContato
    Created on : 14 de ago. de 2024, 15:02:34
    Author     : Aluno
--%>

<%@ page import="com.mycompany.contatos.Contato" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Excluir Contato</title>
</head>
<body>
    <h1>Excluindo Contato!</h1>
    <%
        String idS = request.getParameter("id");
        if (idS != null && !idS.isEmpty()) {
            try {
                int id = Integer.parseInt(idS);
                Contato contato = new Contato();
                contato.setId(id);

                boolean sucesso = contato.deletar();

                if (sucesso) {
                    out.println("Contato excluído com sucesso!");
                } else {
                    out.println("Erro ao excluir contato.");
                }
            } catch (NumberFormatException e) {
                out.println("ID do contato inválido.");
            }
        } else {
            out.println("ID do contato não fornecido.");
        }
    %>
    <p><a href="listaContatos.jsp">Voltar para lista de contatos.</a></p>
    <p><a href="cadastrarContato.jsp">Cadastrar novo contato</a></p>
</body>
</html>
