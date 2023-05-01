<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String addException = null;
    try {
        if (request.getParameter("cadCli") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            int adm = 0;
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String email = request.getParameter("e-mail");
            String telefone = request.getParameter("phone");
            LocalDate nascimento = LocalDate.parse(request.getParameter("bDate"));
            LocalDate curDate = LocalDate.now();
            if (Period.between(nascimento, curDate).getYears() < 18) {
                addException = "Você deve ser maior de idade!";
                throw new java.lang.RuntimeException("Você deve ser maior de idade!");
            } else if (Period.between(nascimento, curDate).getYears() > 130) {
                addException = "Imortalidade Não Existe!";
                throw new java.lang.RuntimeException("Imortalidade Não Existe!");
            }
            String Sexo = request.getParameter("sex");
            char sexo = Sexo.charAt(0);
            String senha = request.getParameter("pass");
            User user = new User(
                    id,
                    adm,
                    nome,
                    sobrenome,
                    email,
                    senha,
                    telefone,
                    nascimento,
                    sexo
            );
            User.addUser(user);
            response.sendRedirect("http://localhost:8080/IRotas/login.jsp");
        }

    } catch (Exception ex) {
        addException = ex.getMessage();
    }
%>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/Logo2.png">
        <title>Cadastro</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid" justify-content: center;">
            <div class="row justify-content-center">
                <div class="col-5">
                    <div class="caixa" style="margin-top: 30px;">
                        <h1 style="padding-bottom: 5px;">Cadastro Auto Escola</h1>
                        <%if (addException != null) {%>
                        <div style="color: black; font-size: 30px; border: 10px double red;">
                            <%= addException%>
                        </div>
                        <br>
                        <%}%>
                        <form autocomplete="off" method="POST">
                            <input class="form-control" type="hidden" name="id" value="1">
                            <div class="row">
                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="nome" placeholder="Nome do Auto Escola:" required>
                                
                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="nome" placeholder="Endereço:" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="nome" placeholder="Cidade:" required>
                                
                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="nome" placeholder="Bairro:" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="email" name="e-mail" placeholder="E-mail:" required>
                            </div>

                            <div class="row">
                                <div class="col" style="padding-left: 0px;">
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="phone" placeholder="Telefone Ex: (xx)xxxxx-xxxx"
                                           pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                                           title="Núemro do telefone Ex: (xx)xxxxx-xxxx" required>
                                </div>
                                <div class="col" style="padding-right: 0px;">
                                    <div class="input-group mb-3">
                                  <input class="form-control" style="margin-bottom: 10px;" type="text" name="CEP" placeholder="CEP:"
                                         pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"> 
                            </div>                                  
                            <hr >
                            <input class="btn btn-primary" type="submit" name="cadCli" value="Registrar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>