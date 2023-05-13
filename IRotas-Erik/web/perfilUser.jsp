<%-- 
    Document   : perfilusuario
    Created on : 16/03/2023, 13:53:42
    Author     : Alex
--%>

<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String altException = null;
    session.setAttribute("ORDER", 1);
    session.setAttribute("SEARCH", "0");
    try {
        if (request.getParameter("altCli") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            int adm = Integer.parseInt(request.getParameter("adm"));
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String email = request.getParameter("e-mail");
            String telefone = request.getParameter("phone");
            LocalDate nascimento = LocalDate.parse(request.getParameter("bDate"));
            LocalDate curDate = LocalDate.now();
            if (Period.between(nascimento, curDate).getYears() < 18) {
                altException = "Você deve ser maior de idade!";
                throw new java.lang.RuntimeException(altException);
            } else if (Period.between(nascimento, curDate).getYears() > 130) {
                altException = "Imortalidade (ainda) Não Existe!";
                throw new java.lang.RuntimeException(altException);
            }
            char sexo = ((User) session.getAttribute("user")).getSexo();
            String senha = ((User) session.getAttribute("user")).getPassword();
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
            User.alterarUser(user);
            Session.getLogoff(request, response);
        }

        if (request.getParameter("altSenha") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String senhaOriginal = ((User) session.getAttribute("user")).passwordMD5(request.getParameter("passOri"));
            String senhaOriginalBD = ((User) session.getAttribute("user")).getPassword();
            String senhaNova1 = request.getParameter("passNew1");
            String senhaNova2 = request.getParameter("passNew2");
            if (senhaOriginal.equals(senhaOriginalBD)) {
                if (senhaNova1.equals(senhaNova2)) {
                    User.alterarSenhaUser(senhaNova1, id);
                    Session.getLogoff(request, response);
                    altException = "Senhas Não Correspondentes! - " + senhaNova1 + " - " + senhaNova2;
                    throw new java.lang.RuntimeException(altException);
                } else {
                    altException = "Senhas Não Correspondentes! - " + senhaNova1 + " - " + senhaNova2;
                    throw new java.lang.RuntimeException(altException);
                }
            } else {
                altException = "Senha Original Inválida!";
                throw new java.lang.RuntimeException(altException);
            }
        }

    } catch (Exception ex) {
        altException = ex.getMessage();
    }
%>
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
        <%if (session.getAttribute("user") == null) {%>
        <%out.print("Você deve realizar login para acessar o conteúdo desta página");%>
        <%} else {%> 
        <div class="container-fluid">
            <div class="row justify-content-center">
                <%if (altException != null) {%>
                <div style="color: black; font-size: 30px; border: 10px double red;">
                    <%= altException%>
                </div>
                <br>
                <%}%>
                <div class="col" style="margin-top: 20px;">
                    <% if (((User) session.getAttribute("user")).getSexo() == 'M') { %>
                    <img class="rounded-circle" src="https://img.freepik.com/vetores-premium/homem-perfil-caricatura_18591-58482.jpg?w=2000" alt="img" height="150" width="155">
                    <% } else { %>
                    <img class="rounded-circle" src="https://img.freepik.com/vetores-premium/desenho-de-perfil-de-mulher_18591-58480.jpg?w=2000" alt="img" height="150" width="155">
                    <% }%>
                    <b style="font-size: 30px; margin-left: 15px;">Meu Perfil</b>
                </div>
            </div>
            <hr>
            <div class="row justify-content-center">
                <div class="col">
                    <form autocomplete="off" method="POST">
                        <input class="form-control" type="hidden" name="id" value="<%=((User) session.getAttribute("user")).getIdCLiente()%>">
                        <input class="form-control" type="hidden" name="adm" value="<%=((User) session.getAttribute("user")).getAdministrator()%>">
                        <input class="form-control" type="text" name="nome" id="nome" value="<%= ((User) session.getAttribute("user")).getNome()%>" placeholder="Primeiro Nome" disabled>
                        <br><br>
                        <input class="form-control" type="email" name="e-mail" id="e-mail" value="<%= ((User) session.getAttribute("user")).getEmail()%>" placeholder="Email" disabled>
                        <br><br>
                        <input class="form-control" type="text" name="phone" id="phone" value="<%= ((User) session.getAttribute("user")).getTelefone()%>"  placeholder="Telefone Celular Ex: (xx)xxxxx-xxxx"
                               pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                               title="Núemro do telefone celular Ex: (xx)xxxxx-xxxx" disabled>
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="sobrenome" id="sobrenome" value="<%= ((User) session.getAttribute("user")).getSobrenome()%>" placeholder="Último Sobrenome" disabled>
                            <br><br>
                            <div class="row">
                                <div class="col">
                                    <input class="form-control" type="date" name="bDate" id="bDate" value="<%=((User) session.getAttribute("user")).getDataNascimento().toString()%>" placeholder="Data de Nascimento" disabled>
                                </div>
                                <div class="col">
                                    <input class="form-control" type="text" name="sex" id="sex" value="<% if (((User) session.getAttribute("user")).getSexo() == 'M') {
                                            out.print("Masculino");
                                        } else {
                                            out.print("Feminino");
                                        }%>" placeholder="Seu sexo" disabled>
                                </div>
                            </div>
                            <br><br>
                            <button class="btn btn-primary" style="color: white;">
                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altSenha">Alterar Senha</a>
                            </button>
                        </div>
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-2-center">
                                <input class="btn btn-primary" style="margin-right: 5%" type="submit" name="altCli" id="altCli" value="Salvar Alteração" disabled="">
                                </form>
                                <button class="btn btn-primary">
                                    <a onclick="removeDisabled()"> Alterar Dados</a>
                                </button>
                            </div>
                        </div>
                </div>
            </div>

            <div class="modal fade" id="altSenha" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm text-center">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Alterar Senha</h4><hr>
                            <form method="post">
                                <input class="form-control" type="hidden" name="id" value="<%=((User) session.getAttribute("user")).getIdCLiente()%>">
                                <div class="mb-3">
                                    <label for="text" class="form-label">Senha Atual</label>
                                    <input name="passOri" type="password" class="form-control" required>
                                </div><hr>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Senha Nova</label>
                                    <input name="passNew1" type="password" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Senha Nova - Confirmação</label>
                                    <input name="passNew2" type="password" class="form-control" required>
                                </div>
                                <hr>
                                <div class="container" style="margin: auto;">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button name="altSenha" type="submit" class="btn btn-primary" type="submit">Confirmar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function removeDisabled() {
                    document.getElementById('nome').removeAttribute("disabled");
                    document.getElementById('nome').setAttribute("required", "");
                    document.getElementById('e-mail').removeAttribute("disabled");
                    document.getElementById('e-mail').setAttribute("required", "");
                    document.getElementById('phone').removeAttribute("disabled");
                    document.getElementById('phone').setAttribute("required", "");
                    document.getElementById('sobrenome').removeAttribute("disabled");
                    document.getElementById('sobrenome').setAttribute("required", "");
                    document.getElementById('bDate').removeAttribute("disabled");
                    document.getElementById('bDate').setAttribute("required", "");
                    document.getElementById('altCli').removeAttribute("disabled");
                }
            </script>
            <%}%>
            <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>