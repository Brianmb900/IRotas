<%-- 
    Document   : perfilusuario
    Created on : 16/03/2023, 13:53:42
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu Perfil</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col" style="margin-top: 20px;">
                    <img class="rounded-circle" src="https://extra.globo.com/incoming/2446068-75d-e0a/w976h550-PROP/flyingcow.jpg" alt="img" height="150" width="155">
                    <b style="font-size: 30px; margin-left: 15px;">Meu Perfil</b>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="dados-perfil">
                    <img class="rounded-circle" src="https://extra.globo.com/incoming/2446068-75d-e0a/w976h550-PROP/flyingcow.jpg" alt="img">
                    <p class="dados-pessoais" >Dados Pessoais</p>
                </div>
                <br><br>
                <div class="col-5">
                    <input class="form-control" type="text" name="Nome" placeholder="Nome">
                    <br><br>
                    <input class="form-control" type="Sobrenome" name="sobrenome" placeholder="Sobrenome">
                    <br><br>
                    <input class="form-control" type="text" name="email" placeholder="E-mail">
                    <input class="form-control" type="text" name="email" placeholder="Telefone">
                </div>
            </div>
        </div>
    </body>
</html>