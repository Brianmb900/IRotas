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
    ArrayList<Evaluation> avaliacoes = new ArrayList<>();
    ArrayList<Evaluation> avaliacoesBusca = new ArrayList<>();
    ArrayList<User> users = new ArrayList<>();
    ArrayList<DrivingSchool> schools = new ArrayList<>();
    int limite = 5;
    int total = 0;
    try {
        schools = DrivingSchool.getTotalSchools();
        users = User.getTotalUsers();
        int pageid = Integer.parseInt(request.getParameter("page"));
        if (pageid == 1) {
        } else {
            pageid = (pageid - 1) * limite + 1;
        }
        avaliacoes = Evaluation.getEvaluations(pageid, limite, (session.getAttribute("ORDER").toString()), (session.getAttribute("ORDER2").toString()));
        avaliacoesBusca = Evaluation.searchEvaluation(session.getAttribute("SEARCH").toString(), pageid, limite, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString());
        if (session.getAttribute("SEARCH").toString().equals("0")) {
            total = Evaluation.getTotalEvaluations().size();
        } else {
            total = Evaluation.searchEvaluation(session.getAttribute("SEARCH").toString(), pageid, 100000, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString()).size();
        }

        if (request.getParameter("delAvali") != null) {
            int idAvaliacao = Integer.parseInt(request.getParameter("idAvali"));
            Evaluation.deleteEvaluation(idAvaliacao);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAvaliacoes.jsp?page=" + request.getParameter("page"));
        }

        //ORDENAÇÕES
        if (request.getParameter("orderAvaliacaoId") != null) {
            if (session.getAttribute("ORDER").toString().equals("1") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAvaliacoes.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoId") != null) {
            if (session.getAttribute("ORDER").toString().equals("2") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAvaliacoes.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderUserId") != null) {
            if (session.getAttribute("ORDER").toString().equals("3") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAvaliacoes.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderVlAvali") != null) {
            if (session.getAttribute("ORDER").toString().equals("4") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "4");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "4");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAvaliacoes.jsp?page=" + request.getParameter("page"));
        }
        //FIM ORDENAÇÕES
        if (request.getParameter("searchAvaliacao") != null) {
            session.setAttribute("SEARCH", request.getParameter("search"));
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAvaliacoes.jsp?page=1");
        }

        if (request.getParameter("limpaBusca") != null) {
            session.setAttribute("SEARCH", "0");
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAvaliacoes.jsp?page=1");
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
                        <h1 style="padding-bottom: 5px;">Lista de Avaliações</h1>
                        <%if (admException != null) {%>
                        <div style="color: black; font-size: 30px; border: 10px double red;">
                            <% out.print(admException);%>
                        </div>
                        <br>
                        <%}%>
                        <form autocomplete="off" method="POST">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup">Buscar por:</span>
                                <select class="form-select" name="search" required>
                                    <%for (DrivingSchool d : schools) {%>
                                    <option value="<%=d.getIdAutoescola()%>"><%=d.getNome()%></option>
                                    <%}%>
                                </select>
                                <input type="submit" name="searchAvaliacao" value="Buscar" class="btn btn-primary"/>
                            </div>
                        </form>
                        <table class="table table-my table-bordered" style="">
                            <thead>
                                <tr class="table-my">
                            <form autocomplete="off" method="POST">
                                <th><input class="orderADM" type="submit" name="orderAvaliacaoId" value="ID Avaliação"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoId" value="Autoescola"/></th>
                                <th><input class="orderADM" type="submit" name="orderUserId" value="Aluno"/></th>
                                <th><input class="orderADM" type="submit" name="orderVlAvali" value="Avaliação"/></th>
                                <th>Ação</th>
                            </form>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (session.getAttribute("SEARCH").toString().equals("0")) {
                                        for (Evaluation e : avaliacoes) {%>
                                <tr class="table-my">
                                    <td><%= e.getIdAvaliacao()%></td>
                                    <td><%= DrivingSchool.getDrivingSchoolView(e.getIdAutoescola().toString()).getNome()%></td>
                                    <td><%= User.getUserId(e.getIdCLiente().toString()).getNome().concat(" " + User.getUserId(e.getIdCLiente().toString()).getSobrenome())%></td>
                                    <td><%= e.getAvaliacao()%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <input type="hidden" name="idAvali" value="<%= e.getIdAvaliacao()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delAvali" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                } else {
                                    for (Evaluation e : avaliacoesBusca) {%>
                                <tr class="table-my">
                                    <td><%= e.getIdAvaliacao()%></td>
                                    <td><%= DrivingSchool.getDrivingSchoolView(e.getIdAutoescola().toString()).getNome()%></td>
                                    <td><%= User.getUserId(e.getIdCLiente().toString()).getNome().concat(" " + User.getUserId(e.getIdCLiente().toString()).getSobrenome())%></td>
                                    <td><%= e.getAvaliacao()%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <input type="hidden" name="idAvali" value="<%= e.getIdAvaliacao()%>" />
                                            <input style="font-weight: bold;" type="submit" name="delAvali" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                    }%>
                            </tbody>
                        </table>
                        <div style="display: inline-flex">
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
                        }%>" href="administracaoAvaliacoes.jsp?page=<%= Integer.parseInt(request.getParameter("page")) - 1%>"><</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%;" href="administracaoAvaliacoes.jsp?page=1">1</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAvaliacoes.jsp?page=2">2</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 11) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAvaliacoes.jsp?page=3">3</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 16) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAvaliacoes.jsp?page=4">4</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 17%; <% if (total < 21) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAvaliacoes.jsp?page=5">5</a>
                    <a style="text-decoration: none; font-size: 30px; <% if ((((Integer.parseInt(request.getParameter("page")) + 1) - 1) * limite + 1) > total || total <= 5) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoAvaliacoes.jsp?page=<%=Integer.parseInt(request.getParameter("page")) + 1%>">></a>
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