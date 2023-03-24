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
            <div class="row justify-content-center">
                <div class="col">
                    <input class="form-control" type="text" name="Nome" placeholder="<%= ((User) session.getAttribute("user")).getNome()%>">
                    <br><br>
                    <input class="form-control" type="text" name="email" placeholder="<%= ((User) session.getAttribute("user")).getEmail()%>">
                    <br><br>
                    <input class="form-control" type="text" name="email" placeholder="<%= ((User) session.getAttribute("user")).getTelefone()%>">
                </div>
                <div class="col">
                    <input class="form-control" type="Sobrenome" name="sobrenome" placeholder="<%= ((User) session.getAttribute("user")).getSobrenome()%>">
                    <br><br>
                    <div class="row">
                        <div class="col">
                            <input class="form-control" type="text" name="email" placeholder="<%
                                String strNor = ((User) session.getAttribute("user")).getDataNascimento().toString();
                                String strCorreta = "";
                                String dia = "";
                                String mes = "";
                                String ano = "";
                                for (int i = 0; i < strNor.length(); i++) {
                                    if (i <= 3) {
                                        ano += strNor.charAt(i);
                                    } else if (i <= 7) {
                                        mes += strNor.charAt(i);
                                    } else {
                                        dia += strNor.charAt(i);
                                    }
                                }
                                strCorreta = dia + mes + ano;
                                out.print(strCorreta);
                                   %>">
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="email" placeholder="<%= ((User) session.getAttribute("user")).getSexo()%>">
                        </div>
                    </div>
                    <br><br>
                    <input class="form-control" type="text" name="email" placeholder="Senha">
                </div>
            </div>
        </div>
    </body>
</html>