<%-- 
    Document   : perfilusuario
    Created on : 16/03/2023, 13:53:42
    Author     : Alex
--%>

<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu Perfil</title>
        <link rel="icon" href="images/Logo2.png">
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid">
            <div class="row justify-content-center">         
                
                <div class="col" style="margin-top: 20px;" align="center">        
                    <img class="rounded-circle" src="https://img.freepik.com/vetores-premium/homem-perfil-caricatura_18591-58482.jpg?w=2000" alt="img" height="150" width="155">
                    <b style="font-size: 30px; margin-left: 15px;">Meu Perfil</b>
                </div>
            </div>
            <hr>
            
            <div class="row justify-content-center">
                <div class="col-5">
                    <div class="filtro" style="margin-top: 30px;">
                        <h1 style="padding-bottom: 5px;">Filtrar por</h1>
                        <br>
                         <div class="container">
  <div class="row">
    <div class="col">
      1 de 2
      <div class="row">
                                   <div class="col-5">
                                        <h4 style="padding-bottom: 1px;">Tipo de Aula:</h4>
                                        <div class="checkbox">
                                            <label for="Teorica">Teórica</label>
                                            <input type="checkbox" id="Teorica" name="Teorica" checked> 
                                            <label for="Pratica">Pratica</label>
                                            <input type="checkbox" id="Pratica" name="Pratica">
                                        </div>
                                    </div>
                                        <div>
                                            
                                   
                                    <div class="col-5">
                                        <h4 style="padding-bottom: 1px;" >Categoria da CNH</h4>
                                        <div class="checkbox">
                                            <label for="acc">ACC</label>
                                            <input type="checkbox" id="acc" name="acc" checked> 

                                            <label for="a">A</label>
                                            <input type="checkbox" id="a" name="a">
                                
                                     
                                            <label for="b">B</label>
                                            <input type="checkbox" id="b" name="b">
                                       
                                     
                                            <label for="c">C</label>
                                            <input type="checkbox" id="c" name="c">
                                        
                                    
                                            <label for="d">D</label>
                                            <input type="checkbox" id="d" name="d">
                                       
                                            <label for="e">E</label>
                                            <input type="checkbox" id="e" name="e">
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-5" style="align-content">
                                        <h4 style="padding-bottom: 1px;">Preço</h4>
                                    <div>
                                    <div class="textFiltro">
                                    <label>Valor Aula Pratica</label>
                                    </div>
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="Min" placeholder="R$" required> 
                                    <div class="textFiltro">
                                    <label>Valor Aula Teorica   </label>
                                    </div>
                                    <input class="form-control" style="margin-bottom: 10px;" type="text" name="Max" placeholder="R$" required>  
                                   </div>
                                    </div>
    </div>
    <div class="col">
      2 de 2
              
                                <div class="col-5" style="padding-right">
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
  </div>

</div>
                            <hr>
                            <input class="btn btn-primary" type="submit" name="searchCli" value="Buscar">

                    </div>
                </div>
                  
                            </div>
                                   
            </div>

                                    
            
            <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>