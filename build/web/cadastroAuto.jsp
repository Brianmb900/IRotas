<%-- 
    Document   : cadastro Auto-Escola
    Created on : 9 de mar de 2023, 19:51:52
    Author     : Erik
--%>

<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cadastro Auto-Escola</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid" justify-content: center;">
            <div class="row justify-content-center">
                <div class="col-5">
                    <div class="caixa" style="margin-top: 30px;">
                        <h1 style="padding-bottom: 5px;">Cadastro Auto-Escola</h1>
                        <form autocomplete="off" method="POST">
                            <input class="form-control" type="hidden" name="id" value="1">
                            <div class="row">
                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="nome" placeholder="Nome" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="sobrenome" placeholder="Sobrenome" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="email" name="e-mail" placeholder="E-mail" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="endereco" placeholder="Endereço" required>
                            </div>

                            <div class="row">
                                <div class="col" style="padding-left: 0px;">
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="cidade" placeholder="Cidade" required>

                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="bairro" placeholder="Bairro" required>
                                </div>

                                <div class="col" style="padding-right: 0px;">
                                    <input class="form-control" style="margin-bottom: 10px;" type="number" name="cep" placeholder="CEP" required>

                                    <input class="form-control" style="margin-bottom: 10px;" type="tel" name="phone" placeholder="Telefone" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <input  class="form-control w-50 d-inline" type="password" name="pass" placeholder="Senha" required>
                                </div>
                            </div>
                            <hr>
                            <input class="btn btn-warning" type="submit" name="cadCli" value="Registrar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>