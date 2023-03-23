<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid" style="display: flex; justify-content: center;">
            <div class="row">
                <div class="col">
                    <div class="caixa">
                        <form autocomplete="off" action="" method="POST">
                            <h1 style="padding-bottom: 40px;">Cadastro</h1>
                            <input class="form-control" type="text" name="nome" placeholder="Nome" required>
                            <br>
                            <input class="form-control" type="text" name="sobrenome" placeholder="Sobrenome" required>
                            <br>
                            <input class="form-control" type="email" name="e-mail" placeholder="E-mail" required>
                            <br>
                            <input class="form-control2" type="password" name="senha1" placeholder="Senha" required>
                            <input class="form-control2" type="password" name="senha2" placeholder="Confirme Senha" required>
                            <br><br>
                            <input class="btn btn-primary" type="submit" name="submit" value="Registrar">
                        </form>
                    </div>
                </div>

                <div class="col">
                    <div class="caixa2">
                        <form autocomplete="off" action="" method="POST">
                            <h1 style="padding-bottom: 40px;">Cadastro Auto</h1>
                            <input class="form-control" type="text" name="nome" placeholder="Nome" required>
                            <br>
                            <input class="form-control" type="text" name="sobrenome" placeholder="Sobrenome" required>
                            <br>
                            <input class="form-control" type="email" name="e-mail" placeholder="E-mail" required>
                            <br>
                            <input class="form-control2" type="password" name="senha" placeholder="Senha" required>
                            <input class="form-control2" type="password" name="senha2" placeholder="Confirme Senha" required>
                            <br><br>
                            <input class="btn btn-primary" type="submit" name="submit" value="Registar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>