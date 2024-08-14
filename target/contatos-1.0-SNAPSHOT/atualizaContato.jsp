<%-- 
    Document   : atualizaContato
    Created on : 14 de ago. de 2024, 14:59:06
    Author     : Aluno
--%>

<%@ page import="com.mycompany.contatos.Contato" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Atualizar Contato</title>
</head>
<body>
    <h2>Resultado da Atualização</h2>
    
    <%
        String idS = request.getParameter("id");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        int idade = Integer.parseInt(request.getParameter("idade"));

        if (idS != null && !idS.isEmpty()) {
            int id = Integer.parseInt(idS);
            Contato contato = new Contato();
            contato.setId(id);
            contato.setNome(nome);
            contato.setTelefone(telefone);
            contato.setIdade(idade);

            boolean sucesso = contato.atualizar();

            if (sucesso) {
                out.println("Contato atualizado com sucesso!");
            } else {
                out.println("Erro ao atualizar contato.");
            }
        } else {
            out.println("ID do contato não fornecido.");
        }
    %>
    
    <p><a href="listaContato.jsp">Voltar para a lista de contatos</a></p>
    <p><a href="cadastrarContato.jsp">Cadastrar novo contato</a></p>
</body>
</html>

