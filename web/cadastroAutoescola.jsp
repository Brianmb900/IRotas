<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.time.*"%>
<!DOCTYPE html>
<%
    String addException = null;
    try {
        if (request.getParameter("cadAuto") != null) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String desc = request.getParameter("descricao");
            String endereco = request.getParameter("endereco");
            String cidade = request.getParameter("cidade");
            String bairro = request.getParameter("bairro");
            String cep = request.getParameter("cep");
            String telefone = request.getParameter("phone");
            String email = request.getParameter("email");
            String senha = request.getParameter("password");
            String senha2 = request.getParameter("pass2");
            if (senha.equals(senha2)) {
            } else {
                addException = "Senhas Não Correspondentes!";
                throw new java.lang.RuntimeException(addException);
            }
            double avali = 0.0;
            double qtdeAvali = 0.0;
            double rAvali = 0.0;
            DrivingSchool school = new DrivingSchool(
                    id,
                    nome,
                    desc,
                    endereco,
                    cidade,
                    bairro,
                    cep,
                    telefone,
                    email,
                    senha,
                    avali,
                    qtdeAvali,
                    rAvali
            );
            DrivingSchool.addDrivingSchool(school);
            Session.getLoginSchool(request, response);
        }

    } catch (Exception ex) {
        addException = ex.getMessage();
    }
%>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/Logo2.png">
        <title>Cadastro</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid" justify-content: center;" style="margin-bottom: 30px">
            <div class="row justify-content-center">
                <div class="col-5">
                    <div class="caixa" style="margin-top: 30px;">
                        <h1 style="padding-bottom: 5px;">Cadastro Auto Escola</h1>
                        <%if (addException != null) {%>
                        <div style="color: black; font-size: 30px; border: 10px double red;">
                            <%= addException%>
                        </div>
                        <br>
                        <%}%>
                        <form autocomplete="off" method="POST">
                            <div class="row justify-content-center">
                                <div class="col">
                                    <input class="form-control" type="hidden" name="id" value="1">
                                    <input class="form-control" type="text" name="nome" id="nome" placeholder="Nome:"required>
                                    <br><br>
                                    <input class="form-control" type="text" name="descricao" id="descricao" placeholder="Descrição:"required>
                                    <br><br>
                                    <input class="form-control" type="email" name="email" id="e-mail" placeholder="E-mail:"required>
                                    <br><br>
                                    <input class="form-control" type="text" name="phone" id="phone"  placeholder="Telefone Ex: (xx)xxxxx-xxxx"
                                           pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                                           title="Núemro do telefone celular Ex: (xx)xxxxx-xxxx"required>
                                    <br><br>
                                </div>
                                <div class="col">
                                    <input class="form-control" type="text" name="endereco" id="endereco" placeholder="Endereço:"required>
                                    <br><br>
                                    <input class="form-control" type="text" name="bairro" id="bairro" placeholder="Bairro:"required>
                                    <br><br>
                                    <div class="row">
                                        <div class="col">
                                            <input class="form-control" type="text" name="cidade" id="cidade" placeholder="Cidade:"required>
                                        </div>
                                    </div>
                                    <br><br>
                                    <input class="form-control" type="text" name="cep" id="cep" placeholder="CEP:"
                                           pattern="[0-9]{5}[-]{1}[0-9]{3}"
                                           title="Núemro do cep Ex: 12345-123"required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <input class="form-control" type="password" name="password" placeholder="Senha" required>
                                </div>
                                <div class="col">
                                    <input class="form-control" type="password" name="pass2" placeholder="Confirmar Senha" required>
                                </div>
                            </div>
                            <div class="col">
                                <hr>
                                <input class="btn btn-primary" type="submit" name="cadAuto" value="Registrar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>