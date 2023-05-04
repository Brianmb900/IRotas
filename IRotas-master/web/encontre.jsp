<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/Logo2.png">
        <title>Encontre</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>

            <div class="row justify-content-center">
                <div class="col-5">
                    <div class="filtro" style="margin-top: 30px;">
                        <h1 style="padding-bottom: 5px;">Filtrar por</h1>
                        <br>
                  
                        <form autocomplete="off" method="POST">
                            <input class="form-control" type="hidden" name="id" value="1">
                         
                            <div class="row">
                                <div class="col" style="padding-right">
                                    <h4 style="padding-bottom: 1px;">Classificação</h4>
                                    <%@include file="WEB-INF/jspf/estrela.jspf" %>
                                                                   
                                </div>
                                    
                                    <div class="col" style="align-content">
                                        <h4 style="padding-bottom: 1px;" >Tipo</h4>
                                        <div class="checkbox">
                                            <label for="Teorica">Teórica</label>
                                            <input type="checkbox" id="Teorica" name="Teorica" checked> 
                                        </div>

                                        <div class="checkbox">
                                            <label for="Pratica">Pratica</label>
                                            <input type="checkbox" id="Pratica" name="Pratica">
                                        </div>
                                    </div>
                                    
                                    <div class="col" style="align-content">
                                        <h4 style="padding-bottom: 1px;">Preço</h4>
                                    <div>
                                    <div class="textFiltro">
                                    <label>MIN</label>
                                    </div>
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="Min" placeholder="R$" required> 
                                    <div class="textFiltro">
                                    <label>MAX</label>
                                    </div>
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="Max" placeholder="R$" required>  
                                   </div>
                                    </div>
                                        
                                <div class="col" style="padding-right">
                                    <h4 style="padding-bottom: 1px;">Localização</h4>
                                    <div class="textFiltro">
                                        <label>Cidade</label>
                                    </div>
                                        <select class="form-select" name="city" required>
                                            <option value="SV"> São Vicente</option>
                                            <option value="SA"> Santos</option>
                                            <option value="PG"> Praia Grande</option>
                                        </select>
                                    
                                </div>
                            </div>
                            <hr>
                            <input class="btn btn-primary" type="submit" name="searchCli" value="Buscar">
                        </form>
                    </div>
                </div>
            </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>