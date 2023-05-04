<%-- 
    Document   : cadastroServiços
    Created on : 16/03/2023, 13:53:42
    Author     : Erik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meus Serviços</title>
        <link rel="icon" href="images/Logo2.png">
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
                <div class="col" style="margin-top: 20px;">
                    <img class="rounded-circle" src="https://img.freepik.com/vetores-premium/homem-perfil-caricatura_18591-58482.jpg?w=2000" alt="img" height="150" width="155">
                    <b style="font-size: 30px; margin-left: 15px;">Meus Serviços</b>
                </div>
            <hr>
            <div class="row justify-content-center">
                <div class="col">
                    <form autocomplete="off" method="POST">

                    <input class="form-control" type="text" name="nome" id="nome">
                    <br><br>
                    <input class="form-control" type="email" name="e-mail" id="e-mail">
                    <br><br>
                    <input class="form-control" type="text" name="phone" id="phone">
                </div>

                <div class="col">
                    <input class="form-control" type="text" name="sobrenome" id="sobrenome">
                    <br><br>

                    <input class="form-control" type="value" name="valor" id="valor">
                    <br><br>
                    
                    <div class="row">
                        <div class="col">
                            <input class="form-control" type="time" name="horaInicio" id="horaIncio">
                        </div>

                        <div class="col">
                            <input class="form-control" type="time" name="horaFim" id="horaFim">
                        </div>
                    </div>
                    
                    <div class="col" style="margin-top: 20px;">
                        <div class="col-2-center">
                            <input class="btn btn-primary" style="margin-right: 5%" type="submit" name="altCli" id="altCli" value="Salvar" >
                    </form>
                        <button class="btn btn-primary">
                            https://getbootstrap.com.br/docs/4.1/components/forms/
                        </button>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>