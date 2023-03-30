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
    ArrayList<User> usersT = new ArrayList<>();
    int limite = 5;
    int total = 0;
    try {
        int pageid = Integer.parseInt(request.getParameter("page"));
        if (pageid == 1) {
        } else {
            pageid = (pageid - 1) * limite + 1;
        }
        users = User.getUsers(pageid, limite);
        usersT = User.getTotalUsers();
        total = usersT.size();
        if (request.getParameter("cadCli") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            int adm = 0;
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String email = request.getParameter("e-mail");
            String telefone = request.getParameter("phone");
            LocalDate nascimento = LocalDate.parse(request.getParameter("bDate"));
            LocalDate curDate = LocalDate.now();
            if (Period.between(nascimento, curDate).getYears() < 18) {
                admException = "O aluno ser maior de idade!";
                throw new java.lang.RuntimeException("Você deve ser maior de idade!");
            } else if (Period.between(nascimento, curDate).getYears() > 130) {
                admException = "Imortalidade Não Existe!";
                throw new java.lang.RuntimeException("Imortalidade Não Existe!");
            }
            String Sexo = request.getParameter("sex");
            char sexo = Sexo.charAt(0);
            String senha = request.getParameter("pass");
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
            response.sendRedirect(request.getRequestURI());
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
                throw new java.lang.RuntimeException("Você deve ser maior de idade!");
            } else if (Period.between(nascimento, curDate).getYears() > 130) {
                admException = "Imortalidade Não Existe!";
                throw new java.lang.RuntimeException("Imortalidade Não Existe!");
            }
            char sexo = ((User) session.getAttribute("user")).getSexo();
            String senha = request.getParameter("pass");
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
            response.sendRedirect(request.getRequestURI());
        }

        if (request.getParameter("delCli") != null) {
            int idenCli = Integer.parseInt(request.getParameter("idenCliDel"));
            User.deleteUser(idenCli);
            response.sendRedirect(request.getRequestURI());
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
                        <table class="table table-my table-bordered" style="">
                            <thead>
                                <tr class="table-my">
                                    <th>ID</th>
                                    <th>Administrador</th>
                                    <th>Nome</th>
                                    <th>Sobrenome</th>
                                    <th>E-mail</th>
                                    <th>Telefone</th>
                                    <th>Data de Nascimento</th>
                                    <th>Sexo</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (User u : users) {%>
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
                                        <form>
                                            <button class="btn btn-warning" style="margin-right: 10%; color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altCliente"
                                                   onclick="setaDataCli('<%= u.getIdCLiente()%>', '<%= u.getNome()%>', '<%= u.getSobrenome()%>',
                                                                   '<%= u.getEmail()%>', '<%= u.getTelefone()%>', '<%= u.getDataNascimento().toString()%>')"> <b>Alterar</b></a>
                                            </button>
                                            <input type="hidden" name="idenCliDel" value="<%= u.getIdCLiente()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delCli" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>

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
                                                        <br><br>
                                                        <input class="form-control" type="password" name="pass" placeholder="" id="pass" value="" required>
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
                            <div class="modal fade" style="color: black" id="cadCliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl text-center">
                                    <div class="modal-content">
                                        <div class="modal-body">                    
                                            <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Cadastrar Aluno</h4><hr>
                                            <div class="row">
                                                <form autocomplete="off" method="POST">
                                                    <input class="form-control" type="hidden" name="id" value="1">
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
                                                        <input class="form-control" type="text" name="phone" id="phone" placeholder="Telefone Celular Ex: (xx)xxxxx-xxxx"
                                                               pattern="[(]{1}[0-9]{2}[)]{1}[0-9]{5}[-]{1}[0-9]{4}"
                                                               title="Núemro do telefone celular Ex: (xx)xxxxx-xxxx" required>
                                                    </div>
                                                    <div class="col">
                                                        <input class="form-control" type="text" name="sobrenome" id="sobrenome" placeholder="Sobrenome" required>
                                                        <br><br>
                                                        <div class="row">
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
                                                        <br><br>
                                                        <input class="form-control" type="password" name="pass" placeholder="" id="pass" value="" required>
                                                    </div>
                                                    <div class="row" style="margin-top: 20px;">
                                                        <div class="col-2-center">
                                                            <input type="submit" name="cadCli" value="Cadastrar" class="btn btn-primary" style="margin-right: 20%">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>      
                                                            </form>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%}%>
                            </tbody>
                        </table>
                        <button class="btn btn-primary" style="color: white;">
                            <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#cadCliente"><b>Cadastrar</b></a>
                        </button>
                    </div>
                </div>
                <div>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 18%;" href="administracao.jsp?page=<%= Integer.parseInt(request.getParameter("page")) - 1%>"><</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%;" href="administracao.jsp?page=1">1</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5;");
                        }%>" href="administracao.jsp?page=2">2</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 11) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5;");
                        }%>" href="administracao.jsp?page=3">3</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 16) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5;");
                        }%>" href="administracao.jsp?page=4">4</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 17%; <% if (total < 21) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5;");
                        }%>" href="administracao.jsp?page=5">5</a>
                    <a style="text-decoration: none; font-size: 30px; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5;");
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
        </script>
    </body>
</html>