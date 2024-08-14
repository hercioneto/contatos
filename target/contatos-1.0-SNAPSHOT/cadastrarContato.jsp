<%-- 
    Document   : cadastrarContato
    Created on : 14 de ago. de 2024, 14:54:39
    Author     : Aluno
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.contatos.Categoria" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Contato</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Cadastrar Novo Contato</h1>

    <form action="salvarContato.jsp" method="post">
        <fieldset>
            <legend>Informações do Contato</legend>
            
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required="required" />
            <br/><br/>
            
            <label for="telefone">Telefone:</label>
            <input type="text" id="telefone" name="telefone" required="required" />
            <br/><br/>
            
            <label for="categoria">Categoria:</label>
            <select id="categoria" name="categoria_id" required="required">
                <option value="">Selecione uma categoria</option>
                <%
                    List<Categoria> categorias = Categoria.getAllCategorias();
                    for (Categoria categoria : categorias) {
                %>
                    <option value="<%= categoria.getId() %>"><%= categoria.getNome() %></option>
                <%
                    }
                %>
            </select>
            <br/><br/>
            
            <label for="idade">Idade:</label>
            <input type="number" id="idade" name="idade" required="required" min="0" />
            <br/><br/>
            
            <input type="submit" value="Salvar" />
            <input type="reset" value="Limpar" />
        </fieldset>
    </form>

    <a href="index.jsp">Voltar para a página inicial</a>
</body>
</html>

