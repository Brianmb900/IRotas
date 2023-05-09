<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.time.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String admException = null;
    ArrayList<User> users = new ArrayList<>();
    ArrayList<User> userSearch = new ArrayList<>();
    int limite = 5;
    int total = 0;
    try {
        int pageid = Integer.parseInt(request.getParameter("page"));
        if (pageid == 1) {
        } else {
            pageid = (pageid - 1) * limite + 1;
        }
        users = User.getUsers(pageid, limite, Integer.parseInt(session.getAttribute("ORDER").toString()));
        userSearch = User.searchUser(session.getAttribute("SEARCH").toString(), pageid, limite, Integer.parseInt(session.getAttribute("ORDER").toString()));
        if (session.getAttribute("SEARCH").toString().equals("0")) {
            total = User.getTotalUsers().size();
        } else {
            total = User.searchUser(session.getAttribute("SEARCH").toString(), pageid, 100000, Integer.parseInt(session.getAttribute("ORDER").toString())).size();
        }
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
                admException = "O aluno ser maior de idade!";
                throw new java.lang.RuntimeException(admException);
            } else if (Period.between(nascimento, curDate).getYears() > 130) {
                admException = "Imortalidade (Ainda) Não Existe!";
                throw new java.lang.RuntimeException(admException);
            }
            String Sexo = request.getParameter("sex");
            char sexo = Sexo.charAt(0);
            String senha = request.getParameter("password");
            String senha2 = request.getParameter("pass2");
            if (senha.equals(senha2)) {
            } else {
                admException = "Senhas Não Correspondentes!";
                throw new java.lang.RuntimeException(admException);
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
            response.sendRedirect("http://localhost:8080/IRotas/administracao.jsp?page=" + request.getParameter("page"));
        }

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
                admException = "Você deve ser maior de idade!";
                throw new java.lang.RuntimeException(admException);
            } else if (Period.between(nascimento, curDate).getYears() > 130) {
                admException = "Imortalidade (Ainda) Não Existe!";
                throw new java.lang.RuntimeException(admException);
            }
            char sexo = ((User) session.getAttribute("user")).getSexo();
            String senha = "0";
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
            response.sendRedirect("http://localhost:8080/IRotas/administracao.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("delCli") != null) {
            int idenCli = Integer.parseInt(request.getParameter("idenCliDel"));
            User.deleteUser(idenCli);
            response.sendRedirect("http://localhost:8080/IRotas/administracao.jsp?page=" + request.getParameter("page"));
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

        if (request.getParameter("orderCli") != null) {
            session.setAttribute("ORDER", Integer.parseInt(request.getParameter("order")));
            response.sendRedirect("http://localhost:8080/IRotas/administracao.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("searchCli") != null) {
            session.setAttribute("SEARCH", request.getParameter("search"));
            response.sendRedirect("http://localhost:8080/IRotas/administracao.jsp?page=1");
        }

        if (request.getParameter("limpaBusca") != null) {
            session.setAttribute("SEARCH", "0");
            response.sendRedirect("http://localhost:8080/IRotas/administracao.jsp?page=1");
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
                        <h1 style="padding-bottom: 5px;">Lista de Alunos</h1>
                        <%if (admException != null) {%>
                        <div style="color: black; font-size: 30px; border: 10px double red;">
                            <% out.print(admException);%>
                        </div>
                        <br>
                        <%}%>
                        <form autocomplete="off" method="POST">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup">Buscar por:</span>
                                <input class="form-control" type="text" name="search" placeholder="Nome do Usuário" required>
                                <input type="submit" name="searchCli" value="Buscar" class="btn btn-primary"/>
                            </div>
                        </form>
                        <form autocomplete="off" method="POST">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup">Ordenar por:</span>
                                <select class="form-select" name="order" required>
                                    <option value="1">ID</option>
                                    <option value="2">Administrador</option>
                                    <option value="3">Nome</option>
                                    <option value="4">Sobrenome</option>
                                    <option value="5">E-mail</option>
                                    <option value="7">Telefone</option>
                                    <option value="8">Data de Nascimento</option>
                                    <option value="9">Sexo</option>
                                </select>
                                <input type="submit" name="orderCli" value="Ordenar" class="btn btn-primary"/>
                            </div>
                        </form>
                        <table class="table table-my table-bordered" style="">
                            <thead>
                                <tr class="table-my">
                            <form autocomplete="off" method="POST">
                                <th><input type="submit" name="orderCliId" value="ID" style="background: transparent; color: white; font-weight: 700; border: 0; padding: 0; text-decoration: underline white;"/></th>
                                <th>Administrador</th>
                                <th>Nome</th>
                                <th>Sobrenome</th>
                                <th>E-mail</th>
                                <th>Telefone</th>
                                <th>Data de Nascimento</th>
                                <th>Sexo</th>
                                <th>Ações</th>
                            </form>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (session.getAttribute("SEARCH").toString().equals("0")) {
                                        for (User u : users) {%>
                                <tr class="table-my">
                                    <td><%= u.getIdCLiente()%></td>
                                    <td><% if (u.getAdministrator() == 1) {
                                            out.print("Sim");
                                        } else {
                                            out.print("Não");
                                        }%></td>
                                    <td><%= u.getNome()%></td>
                                    <td><%= u.getSobrenome()%></td>
                                    <td><%= u.getEmail()%></td>
                                    <td><%= u.getTelefone()%></td>
                                    <td><% String strNor = u.getDataNascimento().toString();
                                        String strCorreta = "";
                                        String dia = "";
                                        String mes = "";
                                        String ano = "";
                                        for (int i = 0; i < strNor.length(); i++) {
                                            if (i <= 3) {
                                                ano += strNor.charAt(i);

                                            } else if (i == 4) {
                                                mes += '/';
                                            } else if (i >= 5 && i <= 6) {
                                                mes += strNor.charAt(i);

                                            } else if (i == 7) {
                                                mes += '/';
                                            } else {
                                                dia += strNor.charAt(i);
                                            }

                                        }
                                        strCorreta = dia + mes + ano;
                                        out.print(strCorreta);%></td>
                                    <td><% if (u.getSexo() == 'M') {
                                            out.print("Masculino");
                                        } else {
                                            out.print("Feminino");
                                        }%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altCliente"
                                                   onclick="setaDataCli('<%= u.getIdCLiente()%>', '<%= u.getNome()%>', '<%= u.getSobrenome()%>',
                                                                   '<%= u.getEmail()%>', '<%= u.getTelefone()%>', '<%= u.getDataNascimento().toString()%>')"> <b>Alterar</b></a>
                                            </button>
                                            <button class="btn btn-primary" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altSenha"
                                                   onclick="setaIdSenha('<%= u.getIdCLiente()%>')"><b>Alterar Senha</b></a>
                                            </button>
                                            <input type="hidden" name="idenCliDel" value="<%= u.getIdCLiente()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delCli" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                } else {
                                    for (User u : userSearch) {%>
                                <tr class="table-my">
                                    <td><%= u.getIdCLiente()%></td>
                                    <td><% if (u.getAdministrator() == 1) {
                                            out.print("Sim");
                                        } else {
                                            out.print("Não");
                                        }%></td>
                                    <td><%= u.getNome()%></td>
                                    <td><%= u.getSobrenome()%></td>
                                    <td><%= u.getEmail()%></td>
                                    <td><%= u.getTelefone()%></td>
                                    <td><% String strNor = u.getDataNascimento().toString();
                                        String strCorreta = "";
                                        String dia = "";
                                        String mes = "";
                                        String ano = "";
                                        for (int i = 0; i < strNor.length(); i++) {
                                            if (i <= 3) {
                                                ano += strNor.charAt(i);

                                            } else if (i == 4) {
                                                mes += '/';
                                            } else if (i >= 5 && i <= 6) {
                                                mes += strNor.charAt(i);

                                            } else if (i == 7) {
                                                mes += '/';
                                            } else {
                                                dia += strNor.charAt(i);
                                            }

                                        }
                                        strCorreta = dia + mes + ano;
                                        out.print(strCorreta);%></td>
                                    <td><% if (u.getSexo() == 'M') {
                                            out.print("Masculino");
                                        } else {
                                            out.print("Feminino");
                                        }%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="margin-right: 10%; color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altCliente"
                                                   onclick="setaDataCli('<%= u.getIdCLiente()%>', '<%= u.getNome()%>', '<%= u.getSobrenome()%>',
                                                                   '<%= u.getEmail()%>', '<%= u.getTelefone()%>', '<%= u.getDataNascimento().toString()%>')"> <b>Alterar</b></a>
                                            </button>
                                            <button class="btn btn-primary" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altSenha"
                                                   onclick="setaIdSenha('<%= u.getIdCLiente()%>')"><b>Alterar Senha</b></a>
                                            </button>
                                            <input type="hidden" name="idenCliDel" value="<%= u.getIdCLiente()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delCli" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                    }%>
                            </tbody>
                        </table>
                        <!--Modal de Alteração de Dados de Usuários-->
                        <div class="modal fade" style="color: black" id="altCliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl text-center">
                                <div class="modal-content">
                                    <div class="modal-body">                    
                                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Alterar Aluno</h4><hr>
                                        <div class="row">
                                            <form autocomplete="off" method="POST">
                                                <input class="form-control" type="hidden" name="id" id="idenCli">
                                                <div class="row">
                                                    <div class="input-group mb-3">
                                                        <span class="input-group-text" id="inputGroup">Administrador</span>
                                                        <select class="form-select" name="adm" required>
                                                            <option value="1">Sim</option>
                                                            <option value="0">Não</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <input class="form-control" type="text" name="nome" id="nome" placeholder="Primeiro Nome" required>
                                                    <br><br>
                                                    <input class="form-control" type="email" name="e-mail" id="e-mail" placeholder="E-mail" required>
                                                    <br><br>
                                                    <input class="form-control" type="text" name="phone" id="phone"  placeholder="Telefone Celular Ex: (xx)xxxxx-xxxx"
                                                           pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                                                           title="Núemro do telefone celular Ex: (xx)xxxxx-xxxx" required>
                                                </div>
                                                <div class="col">
                                                    <input class="form-control" type="text" name="sobrenome" id="sobrenome" placeholder="Sobrenome" required>
                                                    <br><br>
                                                    <div class="row" style="height: 38px;">
                                                        <div class="col">
                                                            <input class="form-control" type="date" name="bDate" id="bDate" placeholder="Data de Nascimento" required>
                                                        </div>
                                                        <div class="col">
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text" id="inputGroup">Sexo</span>
                                                                <select class="form-select" name="sex" required>
                                                                    <option value="M">Masculino</option>
                                                                    <option value="F">Feminino</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 20px;">
                                                    <div class="col-2-center">
                                                        <input type="submit" name="altCli" value="Salvar Alterações" class="btn btn-primary" style="margin-right: 20%">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>      
                                                        </form>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Modal de Cadastro de Usuários-->
                        <div class="modal fade" style="color: black" id="cadCliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg text-center">
                                <div class="modal-content">
                                    <div class="modal-body">                    
                                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Cadastrar Aluno</h4><hr>
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
                        <!--Modal de Alteração de Senha de Usuários-->
                        <div class="modal fade" style="color: black" id="altSenha" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm text-center">
                                <div class="modal-content">
                                    <div class="modal-body">                    
                                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Alterar Senha</h4><hr>
                                        <form method="post">
                                            <input class="form-control" type="hidden" name="id" id="idenCliSenha">
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
                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#cadCliente"><b>Cadastrar</b></a>
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
                        }%>" href="administracao.jsp?page=<%= Integer.parseInt(request.getParameter("page")) - 1%>"><</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%;" href="administracao.jsp?page=1">1</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracao.jsp?page=2">2</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 11) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracao.jsp?page=3">3</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 16) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracao.jsp?page=4">4</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 17%; <% if (total < 21) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracao.jsp?page=5">5</a>
                    <a style="text-decoration: none; font-size: 30px; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracao.jsp?page=<%=Integer.parseInt(request.getParameter("page")) + 1%>">></a>
                </div>
            </div>
        </div>  
        <%}%>
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script>
            function setaDataCli(id, nome, sobrenome, email, telefone, bDate) {
                document.getElementById('idenCli').value = id;
                document.getElementById('nome').value = nome;
                document.getElementById('sobrenome').value = sobrenome;
                document.getElementById('e-mail').value = email;
                document.getElementById('phone').value = telefone;
                document.getElementById('bDate').value = bDate;
            }

            function setaIdSenha(id) {
                document.getElementById('idenCliSenha').value = id;
            }
        </script>
    </body>
</html>