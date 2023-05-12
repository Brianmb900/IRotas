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
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=1");
        }

        if (request.getParameter("limpaBusca") != null) {
            session.setAttribute("SEARCH", "0");
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoAutoescola.jsp?page=1");
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
        <section>
            <div class="container-fluid" style="margin-bottom: 30px">
                <div class="m-5">
                    <h1>Encontre sua Auto Escola</h1>
                </div>
                <div class="row m-auto">
                    <%
                        if (session.getAttribute("SEARCH").toString().equals("0")) {
                            for (DrivingSchool d : schools) {%>
                    <div class="col-md-2" style="margin-bottom: 30px">
                        <div class="card" style="width: 16rem; height: 30em">
                            <img src="https://i.pinimg.com/564x/0c/db/b7/0cdbb7b44011d6d4e2e910cc059401e8.jpg" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title"><%= d.getNome()%></h5>
                                <p class="card-text"><%= d.getDescricao()%></p>
                                <p class="card-text"><%= d.getCidade()%></p>
                                <p class="card-text">Avaliação: <%= d.getAvalaicao() / d.getQtdeAvalaicao()%>/5</p>
                                <div style="align-items: center; position: absolute; bottom: 30px; right: 60px">
                                    <form action="perfilAutoescola.jsp" method="GET">
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
        </section>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
