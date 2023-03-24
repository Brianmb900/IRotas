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
        <div class="container-fluid" justify-content: center;">
            <div class="row justify-content-center">
                <div class="col-5">
                    <div class="caixa" style="margin-top: 30px;">
                        <form autocomplete="off" method="POST">
                            <h1 style="padding-bottom: 5px;">Cadastro Cliente</h1>
                            <input class="form-control" type="hidden" name="id" value="1">
                            <div class="row">
                                <div class="col">
                                    <input class="form-check-input" type="checkbox" id="Alu" name="student" value="1">
                                    <label class="form-check-label" for="Colab"> Quero ser aluno</label>
                                </div>
                                <div class="col">
                                    <input class="form-check-input" type="checkbox" id="Colab" name="collaborator" value="1">
                                    <label class="form-check-label" for="Colab"> Quero ser colaborador</label>
                                </div>
                                <hr>
                            </div>
                            <div class="row">
                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="nome" placeholder="Nome" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="sobrenome" placeholder="Sobrenome" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="email" name="e-mail" placeholder="E-mail" required>
                            </div>

                            <div class="row">
                                <div class="col" style="padding-left: 0px;">
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="senha" placeholder="Telefone" required>

                                    <input class="form-control" type="date" name="bDate" placeholder="Data de Nascimento" required>
                                </div>
                                <div class="col" style="padding-right: 0px;">
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="sex" placeholder="Sexo" required>

                                    <input class="form-control" type="password" name="pass" placeholder="Senha" required>
                                </div>
                            </div>
                            <hr>
                            <input class="btn btn-primary" type="submit" name="cadCli" value="Registrar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>