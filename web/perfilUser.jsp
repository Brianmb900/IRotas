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
                    <input class="form-control" type="text" name="nome" value="<%= ((User) session.getAttribute("user")).getNome()%>" placeholder="Primeiro Nome">
                    <br><br>
                    <input class="form-control" type="email" name="e-mail" value="<%= ((User) session.getAttribute("user")).getEmail()%>" placeholder="Email">
                    <br><br>
                    <input class="form-control" type="text" name="phone" value="<%= ((User) session.getAttribute("user")).getTelefone()%>" placeholder=" Número do Telefone">
                </div>
                <div class="col">
                    <input class="form-control" type="text" name="sobrenome" value="<%= ((User) session.getAttribute("user")).getSobrenome()%>" placeholder="Último Sobrenome">
                    <br><br>
                    <div class="row">
                        <div class="col">
                            <input class="form-control" type="text" name="bDate" value="<%
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
                                   %>" placeholder="Data de Nascimento">
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="sex" value="<%= ((User) session.getAttribute("user")).getSexo()%>" placeholder="Seu sexo">
                        </div>
                    </div>
                    <br><br>
                    <input class="form-control" type="password" name="pass" placeholder="******">
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>