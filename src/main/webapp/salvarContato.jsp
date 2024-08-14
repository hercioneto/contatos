<%-- 
    Document   : salvarContatos
    Created on : 14 de ago. de 2024, 14:55:47
    Author     : Aluno
--%>

<%@ page import="com.mycompany.contatos.Contato" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String nome = request.getParameter("nome");
    String telefone = request.getParameter("telefone");
    int idade = Integer.parseInt(request.getParameter("idade"));

    Contato contato = new Contato();
    contato.setNome(nome);
    contato.setTelefone(telefone);
    contato.setIdade(idade);

    boolean sucesso = contato.salvar();

    if (sucesso) {
        out.println("Contato salvo com sucesso!");
    } else {
        out.println("Erro ao salvar contato.");
    }
%>

<p><a href="cadastrarContato.jsp">Voltar</a></p>