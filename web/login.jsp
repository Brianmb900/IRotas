<%-- 
    Document   : login
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/Logo2.png">
        <title>Login - Aluno</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container" style="margin-bottom: 30px">
            <div class="row justify-content-center" style="margin-top: 30px;">
                <%if (loginException != null) {%>
                <div style="color: black; font-size: 30px; border: 10px double red;">
                    <%= loginException%>
                </div>
                <%}%>
                <div class="col-5">
                    <div class="caixa">
                        <form method="POST">
                            <h1 style="padding-bottom: 40px;">Login Aluno</h1>
                            <input class="form-control" type="text" name="email" placeholder="E-mail">
                            <br><br>
                            <input class="form-control" type="password" name="password" placeholder="Senha">
                            <br><br>
                            <a href="cadastro.jsp" style="color: white">Cadastre-se</a>
                            <br><br>
                            <input class="btn btn-primary" type="submit" name="login" value="Entrar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
