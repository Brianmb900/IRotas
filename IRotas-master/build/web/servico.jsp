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
        <div class="col" style="margin-top: 20px;">
                <img class="rounded-circle" src="https://img.freepik.com/vetores-premium/homem-perfil-caricatura_18591-58482.jpg?w=2000" alt="img" height="150" width="155">
                 <b style="font-size: 30px; margin-left: 15px;">Serviço Auto Escola</b>
                </div>
        <hr> 
       
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
                            <h1 style="padding-bottom: 40px;">Serviço Auto Escola</h1>
                            <div class="container text-start">
  <div class="row ">
    <div class="col" >
                                <h4 style="padding-bottom: 1px;" >Tipo de Aula Oferecida:</h4>
                                <div class="checkbox">
                                    <label for="Teorica">Teórica</label>
                                    <input type="checkbox" id="Teorica" name="Teorica" checked> 
                                </div>

                                <div class="checkbox">
                                    <label for="Pratica">Prática</label>
                                    <input type="checkbox" id="Pratica" name="Pratica">
                                </div>
                                
                                <h4 style="padding-bottom: 1px;" >Categorias de Habilitação:</h4>
                                <div class="checkbox">
                                    <label for="A">A</label>
                                    <input type="checkbox" id="A" name="A" checked> 
                                    <label for="B">B</label>
                                    <input type="checkbox" id="B" name="B">
                                    <label for="C">C</label>
                                    <input type="checkbox" id="C" name="C">
                                    <label for="D">D</label>
                                    <input type="checkbox" id="D" name="D">
                                    <label for="E">E</label>
                                    <input type="checkbox" id="E" name="E">
                                </div>
                                
                                <div class="row">
                                    <h4 style="padding-bottom: 1px;">Preço:</h4>
                                    <div class="col">
                                        <label>Valor das aulas práticas:</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="number" name="ValorP" placeholder="R$" required>
                                    
                                    
                                        <label>Valor das aulas teóricas:</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="number" name="ValorT" placeholder="R$" required>
                                    </div>
                                </div>
                                
                                <div class="col-xs-1" align="center" style="padding-top: 15px;">
                             <input class="btn btn-primary" type="submit" name="voltar" value="Voltar">
                             </div>
      
    </div>
    <div class="col" >
      <div class="row">
          
          
          
                                    <h4 style="padding-bottom: 1px;">Horario:</h4>
                                    <div class="col">
                                        <label>Inicio:</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="number" name="Inicio" required>

                                        <label>Fim:</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="number" name="Fim" required>
                                    </div>
                                </div>
                            <h4 style="padding-bottom: 1px;">Descrição:</h4>
                            <textarea class="form-control" rows="6" name="descricao"></textarea>
                            <br>
                            <div class="col-xs-1" align="center">
                            <input class="btn btn-primary" type="submit" name="avancar" value="Avançar">
                            </div>
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
