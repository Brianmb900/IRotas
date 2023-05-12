<%-- 
    Document   : perfilusuario
    Created on : 16/03/2023, 13:53:42
    Author     : Alex
--%>

<%@page import="java.time.*"%>
<!DOCTYPE html>
<%
    String altException = null;
    session.setAttribute("ORDER", 1);
    session.setAttribute("SEARCH", "0");
    try {
        if (request.getParameter("altAuto") != null) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String desc = request.getParameter("descricao");
            String endereco = request.getParameter("endereco");
            String cidade = request.getParameter("cidade");
            String bairro = request.getParameter("bairro");
            String cep = request.getParameter("cep");
            String telefone = request.getParameter("phone");
            String email = request.getParameter("e-mail");
            String senha = ((DrivingSchool) session.getAttribute("school")).getSenha();
            double avali = 0;
            double qtdeAvali = 0;
            double rAvali = 0;
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
            DrivingSchool.alterDrivingSchool(school);
            Session.altDataSchool(request, response, senha);
        }

        if (request.getParameter("altSenha") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String senhaOriginal = ((DrivingSchool) session.getAttribute("school")).passwordMD5(request.getParameter("passOri"));
            String senhaOriginalBD = ((DrivingSchool) session.getAttribute("school")).getSenha();
            String senhaNova1 = request.getParameter("passNew1");
            String senhaNova2 = request.getParameter("passNew2");
            if (senhaOriginal.equals(senhaOriginalBD)) {
                if (senhaNova1.equals(senhaNova2)) {
                    DrivingSchool.alterarSenhaSchool(senhaNova1, id);
                    Session.getLogoff(request, response);
                } else {
                    altException = "Senhas Não Correspondentes!";
                    throw new java.lang.RuntimeException(altException);
                }
            } else {
                altException = "Senha Atual Incorreta!";
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
        <%if (session.getAttribute("user") == null && session.getAttribute("school") == null) {%>
        <%out.print("Você deve realizar login para acessar o conteúdo desta página");%>
        <%} else if (session.getAttribute("school") != null) {%> 
        <div class="container-fluid" style="margin-bottom: 30px">
            <div class="row justify-content-center">
                <%if (altException != null) {%>
                <div style="color: black; font-size: 30px; border: 10px double red;">
                    <%= altException%>
                </div>
                <br>
                <%}%>
                <div class="col" style="margin-top: 20px;">
                    <b style="font-size: 30px; margin-left: 15px;"><%= ((DrivingSchool) session.getAttribute("school")).getNome()%> - Avaliação: <%=((DrivingSchool) session.getAttribute("school")).getAvalaicao()%>/5.0</b>
                </div>
            </div>
            <hr>
            <div class="row justify-content-center">
                <div class="col">
                    <form autocomplete="off" method="POST">
                        <input class="form-control" type="hidden" name="id" value="<%= ((DrivingSchool) session.getAttribute("school")).getIdAutoescola()%>">
                        <input class="form-control" type="hidden" name="avali" value="<%= ((DrivingSchool) session.getAttribute("school")).getAvalaicao()%>">
                        <input class="form-control" type="text" name="nome" id="nome" value="<%= ((DrivingSchool) session.getAttribute("school")).getNome()%>" placeholder="Nome:" disabled>
                        <br><br>
                        <input class="form-control" type="text" name="descricao" id="descricao" value="<%= ((DrivingSchool) session.getAttribute("school")).getDescricao()%>" placeholder="Drescrição:" disabled>
                        <br><br>
                        <input class="form-control" type="email" name="e-mail" id="e-mail" value="<%= ((DrivingSchool) session.getAttribute("school")).getEmail()%>" placeholder="E-mail:" disabled>
                        <br><br>
                        <input class="form-control" type="text" name="phone" id="phone" value="<%= ((DrivingSchool) session.getAttribute("school")).getTelefone()%>"  placeholder="Telefone Ex: (xx)xxxxx-xxxx"
                               pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                               title="Núemro do telefone celular Ex: (xx)xxxxx-xxxx" disabled>
                        <br><br>
                        </div>
                        <div class="col">
                            <input class="form-control" type="text" name="endereco" id="endereco" value="<%= ((DrivingSchool) session.getAttribute("school")).getEndereco()%>" placeholder="Endereço:" disabled>
                            <br><br>
                            <input class="form-control" type="text" name="bairro" id="bairro" value="<%= ((DrivingSchool) session.getAttribute("school")).getBairro()%>" placeholder="Bairro:" disabled>
                            <br><br>
                            <div class="row">
                                <div class="col">
                                    <input class="form-control" type="text" name="cidade" id="cidade" value="<%= ((DrivingSchool) session.getAttribute("school")).getCidade()%>" placeholder="Cidade:" disabled>
                                </div>
                            </div>
                            <br><br>
                            <input class="form-control" type="text" name="cep" id="cep" value="<%= ((DrivingSchool) session.getAttribute("school")).getCep()%>"  placeholder="CEP:"
                                   pattern="[0-9]{5}[-]{1}[0-9]{3}"
                                   title="Núemro do cep Ex: 12345-123" disabled>
                        </div>
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-2-center">
                                <input class="btn btn-primary" style="margin-right: 5%" type="submit" name="altAuto" id="altAuto" value="Salvar Alteração" disabled="">
                                </form>
                                <button class="btn btn-primary" style="margin-right: 5%">
                                    <a onclick="removeDisabled()"> Alterar Dados</a>
                                </button>
                                <button class="btn btn-primary" style="color: white;">
                                    <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altSenha">Alterar Senha</a>
                                </button>
                            </div>
                        </div>
                </div>
                <hr>
                <div class="row justify-content-center">
                    <b style="font-size: 30px; padding: 0;">Pré-Visualização Do Seu Card</b>
                    <div class="col-md-2" style="margin-bottom: 30px; margin-top: 20px">
                        <div class="card" style="width: 16rem; height: 30em">
                            <img src="https://i.pinimg.com/564x/0c/db/b7/0cdbb7b44011d6d4e2e910cc059401e8.jpg" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title"><%= ((DrivingSchool) session.getAttribute("school")).getNome()%></h5>
                                <p class="card-text"><%= ((DrivingSchool) session.getAttribute("school")).getDescricao()%></p>
                                <p class="card-text"><%= ((DrivingSchool) session.getAttribute("school")).getCidade()%></p>
                                <p class="card-text">Avaliação: <%= ((DrivingSchool) session.getAttribute("school")).getAvalaicao() / ((DrivingSchool) session.getAttribute("school")).getQtdeAvalaicao()%>/5</p>
                                <div style="align-items: center; position: absolute; bottom: 30px; right: 60px">
                                    <input type="submit" class="btn btn-primary" value="Descubra mais">
                                </div>
                            </div>
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
                                <input class="form-control" type="hidden" name="id" value="<%= ((DrivingSchool) session.getAttribute("school")).getIdAutoescola()%>">
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
                    document.getElementById('descricao').removeAttribute("disabled");
                    document.getElementById('descricao').setAttribute("required", "");
                    document.getElementById('e-mail').removeAttribute("disabled");
                    document.getElementById('e-mail').setAttribute("required", "");
                    document.getElementById('phone').removeAttribute("disabled");
                    document.getElementById('phone').setAttribute("required", "");
                    document.getElementById('endereco').removeAttribute("disabled");
                    document.getElementById('endereco').setAttribute("required", "");
                    document.getElementById('bairro').removeAttribute("disabled");
                    document.getElementById('bairro').setAttribute("required", "");
                    document.getElementById('cidade').removeAttribute("disabled");
                    document.getElementById('cidade').setAttribute("required", "");
                    document.getElementById('cep').removeAttribute("disabled");
                    document.getElementById('cep').setAttribute("required", "");
                    document.getElementById('altAuto').removeAttribute("disabled");
                }
            </script>
            <%}%>
            <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>