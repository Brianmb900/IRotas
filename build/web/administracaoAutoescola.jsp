<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    String admException = null;
    ArrayList<DrivingSchool> schools = new ArrayList<>();
    ArrayList<DrivingSchool> schoolSearch = new ArrayList<>();
    int limite = 5;
    int total = 0;
    try {
        int pageid = Integer.parseInt(request.getParameter("page"));
        if (pageid == 1) {
        } else {
            pageid = (pageid - 1) * limite + 1;
        }
        schools = DrivingSchool.getSchools(pageid, limite, (session.getAttribute("ORDER").toString()), (session.getAttribute("ORDER2").toString()));
        schoolSearch = DrivingSchool.searchSchool(session.getAttribute("SEARCH").toString(), pageid, limite, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString());
        if (session.getAttribute("SEARCH").toString().equals("0")) {
            total = DrivingSchool.getTotalSchools().size();
        } else {
            total = DrivingSchool.searchSchool(session.getAttribute("SEARCH").toString(), pageid, 100000, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString()).size();
        }
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
                admException = "Senhas Não Correspondentes!";
                throw new java.lang.RuntimeException(admException);
            }
            int avali = 0;
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
                    avali
            );
            DrivingSchool.addDrivingSchool(school);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("altAuto") != null) {
            Integer id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String desc = request.getParameter("descricao");
            String endereco = request.getParameter("endereco");
            String cidade = request.getParameter("cidade");
            String bairro = request.getParameter("bairro");
            String cep = request.getParameter("cep");
            String telefone = request.getParameter("phone");
            String email = request.getParameter("email");
            String senha = "0";
            int avali = 0;
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
                    avali
            );
            DrivingSchool.alterDrivingSchool(school);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("delAuto") != null) {
            int idenAuto = Integer.parseInt(request.getParameter("idenAutoDel"));
            DrivingSchool.deleteDrivingSchool(idenAuto);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=1");
        }

        if (request.getParameter("altSenha") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String senhaNova1 = request.getParameter("passNew1");
            String senhaNova2 = request.getParameter("passNew2");
            if (senhaNova1.equals(senhaNova2)) {
                User.alterarSenhaUser(senhaNova1, id);
            } else {
                admException = "Senhas Não Correspondentes!";
                throw new java.lang.RuntimeException(admException);
            }
        }

        //ORDENAÇÕES
        if (request.getParameter("orderAutoId") != null) {
            if (session.getAttribute("ORDER").toString().equals("1") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoNome") != null) {
            if (session.getAttribute("ORDER").toString().equals("2") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoDesc") != null) {
            if (session.getAttribute("ORDER").toString().equals("3") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoEnd") != null) {
            if (session.getAttribute("ORDER").toString().equals("4") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "4");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "4");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoCid") != null) {
            if (session.getAttribute("ORDER").toString().equals("5") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "5");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "5");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoBai") != null) {
            if (session.getAttribute("ORDER").toString().equals("6") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "6");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "6");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoCep") != null) {
            if (session.getAttribute("ORDER").toString().equals("7") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "7");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "7");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoTel") != null) {
            if (session.getAttribute("ORDER").toString().equals("8") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "8");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "8");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoMail") != null) {
            if (session.getAttribute("ORDER").toString().equals("9") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "9");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "9");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoAval") != null) {
            if (session.getAttribute("ORDER").toString().equals("10") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "10");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "10");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=" + request.getParameter("page"));
        }
        //FIM ORDENAÇÕES
        if (request.getParameter("searchAuto") != null) {
            session.setAttribute("SEARCH", request.getParameter("search"));
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=1");
        }

        if (request.getParameter("limpaBusca") != null) {
            session.setAttribute("SEARCH", "0");
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=1");
        }

    } catch (Exception ex) {
        admException = ex.getMessage();
    }
%>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/Logo2.png">
        <title>Administração</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if (session.getAttribute("user") == null) {%>
        <%} else {%> 
        <%if (((User) session.getAttribute("user")).getAdministrator() == 0) {%>
        <%out.print("Você deve ser administrador para acessar o conteúdo desta página");%>
        <%} else {%>
        <div class="container-fluid" justify-content: center;">
            <div class="row justify-content-center">
                <div class="col-10">
                    <div class="caixa" style="margin-top: 30px;">
                        <h1 style="padding-bottom: 5px;">Lista de Autoescolas</h1>
                        <%if (admException != null) {%>
                        <div style="color: black; font-size: 30px; border: 10px double red;">
                            <% out.print(admException);%>
                        </div>
                        <br>
                        <%}%>
                        <form autocomplete="off" method="POST">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup">Buscar por:</span>
                                <input class="form-control" type="text" name="search" placeholder="Nome da Autoescola" required>
                                <input type="submit" name="searchAuto" value="Buscar" class="btn btn-primary"/>
                            </div>
                        </form>
                        <table class="table table-my table-bordered" style="">
                            <thead>
                                <tr class="table-my">
                            <form autocomplete="off" method="POST">
                                <th><input class="orderADM" type="submit" name="orderAutoId" value="ID"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoNome" value="Nome"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoDesc" value="Descrição"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoEnd" value="Endereço"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoCid" value="Cidade"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoBai" value="Bairro"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoCep" value="CEP"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoTel" value="Telefone"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoMail" value="E-mail"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoAval" value="Avaliação"/></th>
                                <th>Ações</th>
                            </form>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (session.getAttribute("SEARCH").toString().equals("0")) {
                                        for (DrivingSchool d : schools) {%>
                                <tr class="table-my">
                                    <td><%= d.getIdAutoescola()%></td>
                                    <td><%= d.getNome()%></td>
                                    <td><%= d.getDescricao()%></td>
                                    <td><%= d.getEndereco()%></td>
                                    <td><%= d.getCidade()%></td>
                                    <td><%= d.getBairro()%></td>
                                    <td><%= d.getCep()%></td>
                                    <td><%= d.getTelefone()%></td>
                                    <td><%= d.getEmail()%></td>
                                    <td><%= d.getAvalaicao()%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altAutoescola"
                                                   onclick="setaDataAuto('<%= d.getIdAutoescola()%>', '<%= d.getNome()%>', '<%= d.getDescricao()%>', '<%= d.getEmail()%>',
                                                                   '<%= d.getTelefone()%>', '<%= d.getEndereco()%>', '<%= d.getBairro()%>', '<%= d.getCidade()%>', '<%= d.getCep()%>', )">
                                                    <b>Alterar</b></a>
                                            </button>
                                            <button class="btn btn-primary" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altSenha"
                                                   onclick="setaIdSenha('<%= d.getIdAutoescola()%>')"><b>Alterar Senha</b></a>
                                            </button>
                                            <input type="hidden" name="idenAutoDel" value="<%= d.getIdAutoescola()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delAuto" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                } else {
                                    for (DrivingSchool d : schoolSearch) {%>
                                <tr class="table-my">
                                    <td><%= d.getIdAutoescola()%></td>
                                    <td><%= d.getNome()%></td>
                                    <td><%= d.getDescricao()%></td>
                                    <td><%= d.getEndereco()%></td>
                                    <td><%= d.getCidade()%></td>
                                    <td><%= d.getBairro()%></td>
                                    <td><%= d.getCep()%></td>
                                    <td><%= d.getTelefone()%></td>
                                    <td><%= d.getEmail()%></td>
                                    <td><%= d.getAvalaicao()%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altAutoescola"
                                                   onclick="setaDataAuto('<%= d.getIdAutoescola()%>', '<%= d.getNome()%>', '<%= d.getDescricao()%>', '<%= d.getEmail()%>',
                                                                   '<%= d.getTelefone()%>', '<%= d.getEndereco()%>', '<%= d.getBairro()%>', '<%= d.getCidade()%>', '<%= d.getCep()%>')">
                                                    <b>Alterar</b></a>
                                            </button>
                                            <button class="btn btn-primary" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altSenha"
                                                   onclick="setaIdSenha('<%= d.getIdAutoescola()%>')"><b>Alterar Senha</b></a>
                                            </button>
                                            <input type="hidden" name="idenAutoDel" value="<%= d.getIdAutoescola()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delAuto" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                    }%>
                            </tbody>
                        </table>
                        <!--Modal de Alteração de Dados da Autoescola-->
                        <div class="modal fade" style="color: black" id="altAutoescola" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl text-center">
                                <div class="modal-content">
                                    <div class="modal-body">                    
                                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Alterar Autoescolas</h4><hr>
                                        <div class="row">
                                            <form autocomplete="off" method="POST">
                                                <div class="row justify-content-center">
                                                    <div class="col">
                                                        <input class="form-control" type="hidden" name="id" id="id">
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
                                                <hr>
                                                <div class="row" style="margin-top: 20px;">
                                                    <div class="col-2-center">
                                                        <input type="submit" name="altAuto" value="Salvar Alterações" class="btn btn-primary" style="margin-right: 20%">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Modal de Cadastro de Autoescolas-->
                        <div class="modal fade" style="color: black" id="cadAutoescola" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg text-center">
                                <div class="modal-content">
                                    <div class="modal-body">                    
                                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Cadastrar Autoescola</h4><hr>
                                        <form autocomplete="off" method="POST">
                                            <div class="row justify-content-center">
                                                <div class="col">
                                                    <input class="form-control" type="hidden" name="id" value="1">
                                                    <input class="form-control" type="text" name="nome" placeholder="Nome:"required>
                                                    <br><br>
                                                    <input class="form-control" type="text" name="descricao" placeholder="Descrição:"required>
                                                    <br><br>
                                                    <input class="form-control" type="email" name="email" placeholder="E-mail:">required
                                                    <br><br>
                                                    <input class="form-control" type="text" name="phone" placeholder="Telefone Ex: (xx)xxxxx-xxxx"
                                                           pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                                                           title="Núemro do telefone celular Ex: (xx)xxxxx-xxxx"required>
                                                    <br><br>
                                                </div>
                                                <div class="col">
                                                    <input class="form-control" type="text" name="endereco" placeholder="Endereço:"required>
                                                    <br><br>
                                                    <input class="form-control" type="text" name="bairro" placeholder="Bairro:"required>
                                                    <br><br>
                                                    <div class="row">
                                                        <div class="col">
                                                            <input class="form-control" type="text" name="cidade placeholder="Cidade:"required>
                                                        </div>
                                                    </div>
                                                    <br><br>
                                                    <input class="form-control" type="text" name="cep" placeholder="CEP:"
                                                           pattern="[0-9]{5}[-]{1}[0-9]{3}"
                                                           title="Núemro do cep Ex: 12345-123" required>
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
                        <!--Modal de Alteração de Senha de Usuários-->
                        <div class="modal fade" style="color: black" id="altSenha" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm text-center">
                                <div class="modal-content">
                                    <div class="modal-body">                    
                                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Alterar Senha</h4><hr>
                                        <form method="post">
                                            <input class="form-control" type="hidden" name="id" id="idenAutoSenha">
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

                        <div style="display: inline-flex">
                            <button class="btn btn-primary" style="color: white;">
                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#cadAutoescola"><b>Cadastrar</b></a>
                            </button>
                            <%if (session.getAttribute("SEARCH").toString().equals("0")) {
                                } else {%>
                            <form autocomplete="off" method="POST">
                                <input type="submit" name="limpaBusca" value="Limpar Busca" class="btn btn-dark" style="margin-left: 20px"/>
                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 18%; <% if (Integer.parseInt(request.getParameter("page")) == 1) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAutoescola.jsp?page=<%= Integer.parseInt(request.getParameter("page")) - 1%>"><</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%;" href="administracaoAutoescola.jsp?page=1">1</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAutoescola.jsp?page=2">2</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 11) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAutoescola.jsp?page=3">3</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 16) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAutoescola.jsp?page=4">4</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 17%; <% if (total < 21) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAutoescola.jsp?page=5">5</a>
                    <a style="text-decoration: none; font-size: 30px; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAutoescola.jsp?page=<%=Integer.parseInt(request.getParameter("page")) + 1%>">></a>
                </div>
            </div>
        </div>  
        <%}%>
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script>
            function setaDataAuto(id, nome, descricao, email, phone, endereco, bairro, cidade, cep) {
                document.getElementById('id').value = id;
                document.getElementById('nome').value = nome;
                document.getElementById('descricao').value = descricao;
                document.getElementById('e-mail').value = email;
                document.getElementById('phone').value = phone;
                document.getElementById('endereco').value = endereco;
                document.getElementById('bairro').value = bairro;
                document.getElementById('cidade').value = cidade;
                document.getElementById('cep').value = cep;
            }

            function setaIdSenha(id) {
                document.getElementById('idenAutoSenha').value = id;
            }
        </script>
    </body>
</html>