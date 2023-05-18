<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.time.LocalTime"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    String admException = null;
    ArrayList<Interested> interessados = new ArrayList<>();
    ArrayList<Interested> interessadoBusca = new ArrayList<>();
    int limite = 5;
    int total = 0;
    try {
        int pageid = Integer.parseInt(request.getParameter("page"));
        if (pageid == 1) {
        } else {
            pageid = (pageid - 1) * limite + 1;
        }
        interessados = Interested.getInteresteds(pageid, limite, (session.getAttribute("ORDER").toString()), (session.getAttribute("ORDER2").toString()));
        interessadoBusca = Interested.searchInterested(session.getAttribute("SEARCH").toString(), pageid, limite, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString());
        if (session.getAttribute("SEARCH").toString().equals("0")) {
            total = Interested.getTotalInteresteds().size();
        } else {
            total = Service.searchServico(session.getAttribute("SEARCH").toString(), pageid, 100000, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString()).size();
        }

        if (request.getParameter("cadInteressado") != null) {
            Interested interessado = new Interested(
                    0,
                    Integer.parseInt(request.getParameter("idAutoescola")),
                    Integer.parseInt(request.getParameter("idAluno"))
            );
            Interested.addInterested(interessado);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=1");
        }
        if (request.getParameter("altInteressado") != null) {
            Interested interessado = new Interested(
                    Integer.parseInt(request.getParameter("idInteressado")),
                    Integer.parseInt(request.getParameter("idAutoescola")),
                    Integer.parseInt(request.getParameter("idAluno"))
            );
            Interested.altInterested(interessado);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("delInteressado") != null) {
            int idInteressado = Integer.parseInt(request.getParameter("idenInteressadoDel"));
            Interested.deleteInterestedAdm(idInteressado);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=" + request.getParameter("page"));
        }

        //ORDENAÇÕES
        if (request.getParameter("orderInteressadoId") != null) {
            if (session.getAttribute("ORDER").toString().equals("1") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoId") != null) {
            if (session.getAttribute("ORDER").toString().equals("2") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderUserId") != null) {
            if (session.getAttribute("ORDER").toString().equals("3") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=" + request.getParameter("page"));
        }
        //FIM ORDENAÇÕES
        if (request.getParameter("searchInteressado") != null) {
            session.setAttribute("SEARCH", request.getParameter("search"));
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=1");
        }

        if (request.getParameter("limpaBusca") != null) {
            session.setAttribute("SEARCH", "0");
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoInteressados.jsp?page=1");
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
                        <h1 style="padding-bottom: 5px;">Lista de Interessados</h1>
                        <%if (admException != null) {%>
                        <div style="color: black; font-size: 30px; border: 10px double red;">
                            <% out.print(admException);%>
                        </div>
                        <br>
                        <%}%>
                        <form autocomplete="off" method="POST">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup">Buscar por:</span>
                                <input class="form-control" type="number" name="search" placeholder="ID do Interessado" required>
                                <input type="submit" name="searchInteressado" value="Buscar" class="btn btn-primary"/>
                            </div>
                        </form>
                        <table class="table table-my table-bordered" style="">
                            <thead>
                                <tr class="table-my">
                            <form autocomplete="off" method="POST">
                                <th><input class="orderADM" type="submit" name="orderInteressadoId" value="ID Interessado"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoId" value="ID Autoescola"/></th>
                                <th><input class="orderADM" type="submit" name="orderUserId" value="ID Aluno"/></th>
                                <th>Ações</th>
                            </form>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (session.getAttribute("SEARCH").toString().equals("0")) {
                                        for (Interested i : interessados) {%>
                                <tr class="table-my">
                                    <td><%= i.getIdInteressado()%></td>
                                    <td><%= i.getIdAutoescola()%></td>
                                    <td><%= i.getIdCLiente()%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altInteressado"
                                                   onclick="dadosAltInteressado('<%=i.getIdInteressado()%>', '<%=i.getIdAutoescola()%>', '<%=i.getIdCLiente()%>')">
                                                    <b>Alterar</b>
                                                </a>
                                            </button>
                                            <input type="hidden" name="idenInteressadoDel" value="<%= i.getIdInteressado()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delInteressado" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                } else {
                                    for (Interested i : interessadoBusca) {%>
                                <tr class="table-my">
                                    <td><%= i.getIdInteressado()%></td>
                                    <td><%= i.getIdAutoescola()%></td>
                                    <td><%= i.getIdCLiente()%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altInteressado"
                                                   onclick="dadosAltInteressado('<%=i.getIdInteressado()%>', '<%=i.getIdAutoescola()%>', '<%=i.getIdCLiente()%>')">
                                                    <b>Alterar</b>
                                                </a>
                                            </button>
                                            <input type="hidden" name="idenInteressadoDel" value="<%= i.getIdInteressado()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delInteressado" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                    }%>
                            </tbody>
                        </table>
                        <div style="display: inline-flex">
                            <button class="btn btn-primary" style="color: white;">
                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#cadInteressado"><b>Cadastrar</b></a>
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
                <div class="modal fade" id="altInteressado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg text-center">
                        <div class="modal-content">
                            <div class="modal-body">
                                <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Alterar Interessado</h4>
                                <hr style="margin-bottom: 7px; margin-top: 7px">
                                <div class="container" style="margin-bottom: 30px">
                                    <div class="row justify-content-center">
                                        <form method="POST">
                                            <input type="hidden" id="idInteressado" name="idInteressado">
                                            <div class="row ">
                                                <div class="row">
                                                    <div class="col">
                                                        <h4 style="padding-bottom: 1px;" >ID da Autoescola:</h4>
                                                        <div class="input-group mb-3">
                                                            <input class="form-control" type="number" step="1" id="idAutoescola" name="idAutoescola" placeholder="ID da Autoescola" required>
                                                            <a class="btn btn-primary" href="administracaoAutoescola.jsp?page=1">Ver Autoescolas</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <h4 style="padding-bottom: 1px;" >ID do Aluno:</h4>
                                                    <div class="col">
                                                        <div class="input-group mb-3">
                                                            <input class="form-control" type="number" step="1" id="idAluno" name="idAluno" placeholder="ID do Aluno" required>
                                                            <a class="btn btn-primary" href="administracao.jsp?page=1">Ver Alunos</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr style="margin-top: 16px">
                                                <div class="row" style="margin-top: 20px;">
                                                    <div class="col-2-center">
                                                        <input type="submit" name="altInteressado" value="Salvar Alterações" class="btn btn-primary" style="margin-right: 20%">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="cadInteressado" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg text-center">
                        <div class="modal-content">
                            <div class="modal-body">
                                <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Cadastrar Interessado</h4><hr>
                                <div class="container" style="margin-bottom: 30px">
                                    <div class="row justify-content-center">
                                        <form method="POST">
                                            <div class="row ">
                                                <div class="row">
                                                    <div class="col">
                                                        <h4 style="padding-bottom: 1px;" >ID da Autoescola:</h4>
                                                        <div class="input-group mb-3">
                                                            <input class="form-control" type="number" step="1" name="idAutoescola" placeholder="ID da Autoescola" required>
                                                            <a class="btn btn-primary" href="administracaoAutoescola.jsp?page=1">Ver Autoescolas</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <h4 style="padding-bottom: 1px;" >ID do Aluno:</h4>
                                                    <div class="col">
                                                        <div class="input-group mb-3">
                                                            <input class="form-control" type="number" step="1" name="idAluno" placeholder="ID do Aluno" required>
                                                            <a class="btn btn-primary" href="administracao.jsp?page=1">Ver Alunos</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row" style="margin-top: 20px;">
                                                    <div class="col-2-center">
                                                        <input type="submit" name="cadInteressado" value="Cadastrar" class="btn btn-primary" style="margin-right: 20%">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 18%; <% if (Integer.parseInt(request.getParameter("page")) == 1) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoInteressados.jsp?page=<%= Integer.parseInt(request.getParameter("page")) - 1%>"><</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%;" href="administracaoInteressados.jsp?page=1">1</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoInteressados.jsp?page=2">2</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 11) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoInteressados.jsp?page=3">3</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 16) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoInteressados.jsp?page=4">4</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 17%; <% if (total < 21) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoInteressados.jsp?page=5">5</a>
                    <a style="text-decoration: none; font-size: 30px; <% if (total < 6) {
                                out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                            }%>" href="administracaoInteressados.jsp?page=<%=Integer.parseInt(request.getParameter("page")) + 1%>">></a>
                </div>
            </div>
        </div>  
        <%}%>
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script>
            function dadosAltInteressado(idI, idA, idU) {
                document.getElementById('idInteressado').value = idI;
                document.getElementById('idAutoescola').value = idA;
                document.getElementById('idAluno').value = idU;
            }
        </script>
    </body>
</html>