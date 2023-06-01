<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.time.*"%>
<!DOCTYPE html>
<%
    session.setAttribute("ORDER", "1");
    session.setAttribute("ORDER2", " ASC");
    session.setAttribute("SEARCH", "0");
    String addException = null;
    try {
        if (request.getParameter("cadCli") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            int adm = 0;
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String email = request.getParameter("email");
            String telefone = request.getParameter("phone");
            LocalDate nascimento = LocalDate.parse(request.getParameter("bDate"));
            LocalDate curDate = LocalDate.now();
            if (Period.between(nascimento, curDate).getYears() < 18) {
                addException = "Você deve ser maior de idade!";
                throw new java.lang.RuntimeException(addException);
            } else if (Period.between(nascimento, curDate).getYears() > 130) {
                addException = "Imortalidade (ainda) Não Existe!";
                throw new java.lang.RuntimeException(addException);
            }
            String Sexo = request.getParameter("sex");
            char sexo = Sexo.charAt(0);
            String senha = request.getParameter("password");
            String senha2 = request.getParameter("pass2");
            if (senha.equals(senha2)) {
            } else {
                addException = "Senhas Não Correspondentes!";
                throw new java.lang.RuntimeException(addException);
            }
            User user = new User(
                    id,
                    adm,
                    nome,
                    sobrenome,
                    email,
                    senha,
                    telefone,
                    nascimento,
                    sexo
            );
            User.addUser(user);
            Session.getLoginUser(request, response);
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
        <title>Cadastro - Usuário</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid" justify-content: center;" style="margin-bottom: 30px">
            <div class="row justify-content-center">
                <div class="col-5">
                    <div class="caixa" style="margin-top: 30px;">
                        <h1 style="padding-bottom: 5px;">Cadastro Aluno</h1>
                        <%if (addException != null) {%>
                        <div style="color: black; font-size: 30px; border: 10px double red;">
                            <%= addException%>
                        </div>
                        <br>
                        <%}%>
                        <form autocomplete="off" method="POST">
                            <input class="form-control" type="hidden" name="id" value="1">
                            <div class="row">
                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="nome" placeholder="Nome" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="text" name="sobrenome" placeholder="Sobrenome" required>

                                <input class="form-control" style="margin-bottom: 10px;" type="email" name="email" placeholder="E-mail" required>
                            </div>
                            <div class="row">
                                <div class="col" style="padding-left: 0px;">
                                    <input class="form-control" type="text" name="phone" placeholder="Telefone Celular Ex: (xx)xxxxx-xxxx"
                                           pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                                           title="Núemro do telefone celular Ex: (xx)xxxxx-xxxx" required>
                                </div>
                                <div class="col" style="padding-right: 0px;">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="inputGroup">Sexo</span>
                                        <select class="form-select" name="sex" required>
                                            <option value="M">Masculino</option>
                                            <option value="F">Feminino</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <input class="form-control" style="margin-bottom: 10px;" type="date" name="bDate" placeholder="Data de Nascimento" required>
                            </div>
                            <div class="row">
                                <div class="col" style="padding-left: 0px;">
                                    <input class="form-control" type="password" name="password" placeholder="Senha" required>
                                </div>
                                <div class="col" style="padding-right: 0px;">
                                    <input class="form-control" type="password" name="pass2" placeholder="Confirmar Senha" required>
                                </div>
                            </div>
                            <hr>
                            <input class="btn btn-primary" type="submit" name="cadCli" value="Registrar">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>