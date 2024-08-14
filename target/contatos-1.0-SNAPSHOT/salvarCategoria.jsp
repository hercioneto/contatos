<%-- 
    Document   : salvarCategoria
    Created on : 14 de ago. de 2024, 16:15:00
    Author     : Aluno
--%>

<%@ page import="com.mycompany.contatos.Categoria" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String nome = request.getParameter("nome");

    Categoria categoria = new Categoria();
    categoria.setNome(nome);

    boolean sucesso = categoria.salvar();

    if (sucesso) {
        out.println("Categoria salva com sucesso!");
    } else {
        out.println("Erro ao salvar categoria.");
    }
%>

<p><a href="cadastrarCategoria.jsp">Voltar</a></p>
