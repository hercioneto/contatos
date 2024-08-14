<%-- 
    Document   : salvarContatos
    Created on : 14 de ago. de 2024, 14:55:47
    Author     : Aluno
--%>

<%@ page import="com.mycompany.contatos.Contato" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Salvar Contato</title>
</head>
<body>
    <h1>Salvando Contato</h1>
<%
    // Recupera os parâmetros do formulário
    String nome = request.getParameter("nome");
    String telefone = request.getParameter("telefone");
    int idade = Integer.parseInt(request.getParameter("idade"));
    int categoriaId = Integer.parseInt(request.getParameter("categoria_id")); // Novo campo de categoria

    // Cria uma instância de Contato e define os valores
    Contato contato = new Contato();
    contato.setNome(nome);
    contato.setTelefone(telefone);
    contato.setIdade(idade);
    contato.setIdCategoria(categoriaId); // Define o ID da categoria

    // Tenta salvar o contato e exibe a mensagem apropriada
    boolean sucesso = contato.salvar();

    if (sucesso) {
        out.println("Contato salvo com sucesso!");
    } else {
        out.println("Erro ao salvar contato.");
    }
%>

<p><a href="cadastrarContato.jsp">Voltar</a></p>
</body>
</html>