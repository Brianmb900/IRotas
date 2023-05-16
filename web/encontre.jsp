<%-- 
    Document   : encontre
    Created on : 9 de mar de 2023, 13:43:52
    Author     : Erik
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    String searchException = null;
    ArrayList<DrivingSchool> schools = new ArrayList<>();
    ArrayList<DrivingSchool> schoolSearch = new ArrayList<>();
    int limite = 12;
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

        if (request.getParameter("searchAuto") != null) {
            session.setAttribute("SEARCH", request.getParameter("search"));
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/encontre.jsp?page=1");
        }

        if (request.getParameter("clearAuto") != null) {
            session.setAttribute("SEARCH", "0");
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/encontre.jsp?page=1");
        }

    } catch (Exception ex) {
        searchException = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="images/Logo2.png">
        <title>Encontre Auto Escola</title>
        <%@include file="WEB-INF/jspf/css.jspf" %>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container-fluid" style="margin-bottom: 30px">
            <h1>Encontre sua Auto Escola</h1>
            <hr>
            <div class="row justify-content-center">
                <div class="col-7">
                    <h1 style="padding-bottom: 5px;">Filtrar e/ou Buscar Por:</h1>
                    <form autocomplete="off" method="POST">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="inputGroup">Buscar por:</span>
                            <input class="form-control" type="text" name="search" placeholder="Nome da Autoescola" required>
                            <input type="submit" name="searchAuto" value="Buscar" class="btn btn-primary"/>
                        </div>
                    </form>
                    <hr>
                    <form autocomplete="off" method="POST">
                        <div class="row">
                            <div class="col">
                                <h4 style="padding-bottom: 1px;" >Tipo</h4>
                                <div class="checkbox">
                                    <label for="Teorica">Teórica</label>
                                    <input type="checkbox" id="Teorica" name="Teorica" checked> 
                                </div>

                                <div class="checkbox">
                                    <label for="Pratica">Pratica</label>
                                    <input type="checkbox" id="Pratica" name="Pratica">
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <h4 style="padding-bottom: 1px;">Preço</h4>
                                    <div class="col">
                                        <label>MIN</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="number" name="Min" placeholder="R$" required>
                                    </div>
                                    <div class="col">
                                        <label>MAX</label>
                                        <input class="form-control" style="margin-bottom: 10px;" type="number" name="Max" placeholder="R$" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <h4 style="padding-bottom: 1px;">Localização</h4>
                                <label>Cidade</label>
                                <select class="form-select" name="city" required>
                                    <option value="SV"> São Vicente</option>
                                    <option value="SA"> Santos</option>
                                    <option value="PG"> Praia Grande</option>
                                </select>
                            </div>
                            <div class="col">
                                <h4 style="padding-bottom: 1px;">Classificação</h4>
                                <ul class="avaliacao">
                                    <li class="star-icon" data-avaliacao="1"></li>
                                    <li class="star-icon" data-avaliacao="2"></li>
                                    <li class="star-icon" data-avaliacao="3"></li>
                                    <li class="star-icon" data-avaliacao="4"></li>
                                    <li class="star-icon ativo" data-avaliacao="5"></li>
                                </ul>
                            </div>
                        </div>
                        <input class="btn btn-primary" style="margin-bottom: 10px" type="submit" name="filter Auto" value="Filtrar">
                    </form>
                    <%if (session.getAttribute("SEARCH").toString().equals("0")) {
                        } else {%>
                        <form autocomplete="off" method="POST">
                        <input style="align-content: center; margin-bottom: 10px" type="submit" name="clearAuto" value="Limpar Busca/Filtro" class="btn btn-dark" style="margin-left: 20px"/>
                    </form>
                    <%}%>
                </div>
                <hr>
            </div>
            <div class="row m-auto">
                <%
                    if (session.getAttribute("SEARCH").toString().equals("0")) {
                        for (DrivingSchool d : schools) {%>
                <div class="col-md-2" style="margin-bottom: 30px">
                    <div class="card" style="width: 16rem; height: 30em">
                        <img src="images/carro.png" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title"><%= d.getNome()%></h5>
                            <p class="card-text"><%= d.getDescricao()%></p>
                            <p class="card-text"><%= d.getCidade()%></p>
                            <p class="card-text">Avaliação: <%= d.getAvalaicao() / d.getQtdeAvalaicao()%>/5</p>
                            <div style="align-items: center; position: absolute; bottom: 30px; right: 60px">
                                <form action="perfilAutoescolaUsuario.jsp" method="GET">
                                    <input type="hidden" name="auto" value="<%=d.getIdAutoescola()%>">
                                    <input type="submit" class="btn btn-primary" value="Descubra mais">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                } else {
                    for (DrivingSchool d : schoolSearch) {%>
                <div class="col-md-2" style="margin-bottom: 30px">
                    <div class="card" style="width: 16rem; height: 30em">
                        <img src="images/carro.png" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title"><%= d.getNome()%></h5>
                            <p class="card-text"><%= d.getDescricao()%></p>
                            <p class="card-text"><%= d.getCidade()%></p>
                            <p class="card-text">Avaliação: <%= d.getAvalaicao() / d.getQtdeAvalaicao()%>/5</p>
                            <div style="align-items: center; position: absolute; bottom: 30px; right: 60px">
                                <form action="perfilAutoescolaUsuario.jsp" method="GET">
                                    <input type="hidden" name="auto" value="<%=d.getIdAutoescola()%>">
                                    <input type="submit" class="btn btn-primary" value="Descubra mais">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                    }%>
            </div>
            <div>
                <a style="text-decoration: none; font-size: 30px; margin-right: 18%; <% if (Integer.parseInt(request.getParameter("page")) == 1) {
                        out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                    }%>" href="encontre.jsp?page=<%= Integer.parseInt(request.getParameter("page")) - 1%>"><</a>
                <a style="text-decoration: none; font-size: 30px; margin-right: 10%;" href="encontre.jsp?page=1">1</a>
                <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 13) {
                        out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                    }%>" href="encontre.jsp?page=2">2</a>
                <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 25) {
                        out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                    }%>" href="encontre.jsp?page=3">3</a>
                <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 37) {
                        out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                    }%>" href="encontre.jsp?page=4">4</a>
                <a style="text-decoration: none; font-size: 30px; margin-right: 17%; <% if (total < 49) {
                        out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                    }%>" href="encontre.jsp?page=5">5</a>
                <a style="text-decoration: none; font-size: 30px; <% if (total < 13) {
                        out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                    }%>" href="encontre.jsp?page=<%=Integer.parseInt(request.getParameter("page")) + 1%>">></a>
            </div>
        </div>
        <script>
            var stars = document.querySelectorAll('.star-icon');
            document.addEventListener('click', function (e) {
                var classStar = e.target.classList;
                if (!classStar.contains('ativo')) {
                    stars.forEach(
                            function (star) {
                                star.classList.remove('ativo');
                            });
                    classStar.add('ativo');
                    console.log(e.target.getAttribute('data-avaliacao'));
                }
            });
            </<scrip>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
    