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
        <title>Serviço Auto Escola</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container" style="margin-bottom: 30px">
            <div class="row justify-content-center" style="margin-top: 30px;">
                <div class="col-7">
                    <div class="caixa">
                        <h1 style="padding-bottom: 40px;">Cadastro de Serviço</h1>
                        <form method="POST">
                            <div class="row ">
                                <div class="row" >
                                    <div class="col">
                                        <h4 style="padding-bottom: 1px;" >Tipo de Aula Oferecida:</h4>
                                        <select class="form-select" name="tipo" required>
                                            <option value="0">Prática</option>
                                            <option value="1">Teórica</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <h4 style="padding-bottom: 1px;">Valor das Aulas:</h4>
                                        <input class="form-control" style="margin-bottom: 10px;" type="number" name="vAula" placeholder="R$" required>
                                    </div>
                                </div>
                                <div class="row" >
                                    <h4 style="margin-top: 20px;">Horario:</h4>
                                    <div class="col">
                                        <label>Inicio:</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="time" name="inicio" required>
                                    </div>
                                    <div class="col">
                                        <label>Fim:</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="time" name="fim" required>
                                    </div>
                                </div>
                                <h4>Descrição:</h4>
                                <textarea class="form-control" rows="6" name="descricao"></textarea>
                                <br>
                                <div class="col-xs-1" align="center" style="margin-top: 15px">
                                    <button class="btn btn-primary" style="margin-right: 20px">
                                        <a href="perfilAutoescola.jsp" style="color: white; text-decoration: none;">Voltar</a>
                                    </button>
                                    <input class="btn btn-primary" type="submit" name="avancar" value="Avançar">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
