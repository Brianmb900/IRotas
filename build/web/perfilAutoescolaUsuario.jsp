<%-- 
    Document   : perfilusuario
    Created on : 16/03/2023, 13:53:42
    Author     : Alex
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.time.*"%>
<!DOCTYPE html>
<%
    session.setAttribute("ORDER", "1");
    session.setAttribute("ORDER2", " ASC");
    session.setAttribute("SEARCH", "0");
    String interestedExecption = null;
    Interested interessados = null;
    Evaluation avaliado = null;
    DrivingSchool school = null;
    ArrayList<Service> servico = new ArrayList<>();
    if (Integer.parseInt(request.getParameter("auto")) != 0) {
        try {
            school = DrivingSchool.getDrivingSchoolView(request.getParameter("auto"));
            servico = Service.getServicosAutoescola(request.getParameter("auto"));
            interessados = Interested.getAlredyInteresteds(Integer.parseInt(request.getParameter("auto")), ((User) session.getAttribute("user")).getIdCLiente());
            avaliado = Evaluation.getAlredyEvaluated(Integer.parseInt(request.getParameter("auto")), ((User) session.getAttribute("user")).getIdCLiente());
            if (request.getParameter("addInteressado") != null) {
                Interested interessado = new Interested(
                        0,
                        Integer.parseInt(request.getParameter("auto")),
                        ((User) session.getAttribute("user")).getIdCLiente());
                Interested.addInterested(interessado);
                response.sendRedirect("http://localhost:8080/IRotas/perfilUser.jsp");
            }

            if (request.getParameter("avaliAuto") != null) {
                Double vlAval = Double.parseDouble(request.getParameter("avali"));
                Evaluation avaliacao = new Evaluation(
                        0,
                        school.getIdAutoescola(),
                        ((User) session.getAttribute("user")).getIdCLiente(),
                        vlAval
                );
                Evaluation.addEvaluation(avaliacao);
                response.sendRedirect("http://localhost:8080/IRotas/perfilAutoescolaUsuario.jsp?auto=" + request.getParameter("auto"));
            }

            if (request.getParameter("reAvali") != null) {
                Double vlAval = Double.parseDouble(request.getParameter("avali"));
                Evaluation avaliacao = new Evaluation(
                        Integer.parseInt(request.getParameter("id")),
                        school.getIdAutoescola(),
                        ((User) session.getAttribute("user")).getIdCLiente(),
                        vlAval
                );
                Evaluation.altEvaluation(avaliacao);
                response.sendRedirect("http://localhost:8080/IRotas/perfilAutoescolaUsuario.jsp?auto=" + request.getParameter("auto"));
            }

            if (request.getParameter("delAvali") != null) {
                Evaluation.deleteEvaluation(avaliado.getIdAvaliacao());
                response.sendRedirect("http://localhost:8080/IRotas/perfilAutoescolaUsuario.jsp?auto=" + request.getParameter("auto"));
            }

        } catch (Exception ex) {
            interestedExecption = ex.getMessage();
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
        <div class="container-fluid" style="margin-bottom: 30px; margin-top: 30px">
            <div class="container-fluid caixa">
                <div class="row justify-content-center">
                    <%if (interestedExecption != null) {%>
                    <div style="color: black; font-size: 30px; border: 10px double red;">
                        <%= interestedExecption%>
                    </div>
                    <br>
                    <%}%>
                    <div class="col-2">
                        <img src="images/carro.png" class="card-img-top" style="border: 1px solid black">
                    </div>
                    <div class="col-2" style="text-align: left; margin-top: 2.8%">
                        <h4><%= school.getNome()%></h4>
                        <h4>Descrição: <%= school.getDescricao()%></h4>
                        <h4>Avaliação: <%= Evaluation.getEvaluationFinal(school.getIdAutoescola())%></h4>
                    </div>
                    <div class="col-1"></div>
                    <div class="col" style="border: 1px solid black; text-align: left; margin-right: 10px; margin-top: 20px; margin-bottom: 30px">
                        <h4 style="padding-top: 50px">Endereço: <%= school.getEndereco()%>, <%= school.getBairro()%>, <%= school.getCidade()%>. CEP: <%= school.getCep()%></h4>
                        <h4>Contatos - E-mail: <%= school.getEmail()%>; Fone:<%= school.getTelefone()%></h4>
                    </div>
                    <hr style="margin-top: 10px; border-width: 3px">
                </div>
                <% for (Service s : servico) {%>
                <div class="row justify-content-center" style="border: 1px solid black; margin-bottom: 30px; margin-left: 0.00001px; margin-right: 0.000001px">
                    <div class="col-4" style="padding-top: 35px">
                        <h4><%= s.getDescricao()%></h4>
                    </div>
                    <div class="col">
                        <h4>Tipo: <% if (s.getTipo() == 1) {
                                out.print("Prática");
                            } else {
                                out.print("Teórica");
                            }%></h4>
                        <h4>Inicia: <%= s.getHoraInicio()%> - Termina <%= s.getHoraFim()%></h4>
                        <h4>Valor R$:<%= s.getValor()%></h4>
                    </div>
                </div>
                <%}%>
                <div class="row justify-content-center">
                    <div class="col">
                        <%if (session.getAttribute("user") == null) {%>
                        <a class="btn btn-primary" href="login.jsp">Tenho Interesse</a>
                        <%} else if (interessados != null && avaliado == null) {%>
                        <button class="btn btn-primary" style="color: white;">
                            <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#interesse">
                                Tenho Interesse
                            </a>
                        </button>
                        <button class="btn btn-primary" style="color: white; margin-left: 30px">
                            <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#avaliar">
                                Avaliar
                            </a>
                        </button>
                        <%} else if (avaliado != null) {%>
                        <form method="POST">
                            <button class="btn btn-primary" style="color: white; margin-left: 30px"
                                    onclick="reAvaliar('<%=avaliado.getAvaliacao()%>', '<%=avaliado.getIdAvaliacao()%>')">
                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#reAvaliar">
                                    Alterar Avaliação
                                </a>
                            </button>
                            <input class="btn btn-primary" style="margin-left: 30px" type="submit" name="delAvali" value="Remover Avaliação">
                        </form>
                        <%} else {%>
                        <form method="POST">
                            <input class="btn btn-primary" type="submit" name="addInteressado" value="Tenho Interesse">
                        </form>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="interesse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm text-center">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Você já tem interesse nessa autoescola</h4>
                        <hr>
                        <div class="container" style="margin: auto;">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="avaliar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm text-center">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Avaliar Autoescola</h4><hr>
                        <form method="post">
                            <div class="mb-3">
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="inputGroup">Avaliação:</span>
                                    <select class="form-select" name="avali" required>
                                        <option value="0.5">0.5</option>
                                        <option value="1.0">1</option>
                                        <option value="1.5">1.5</option>
                                        <option value="2.0">2</option>
                                        <option value="2.5">2.5</option>
                                        <option value="3.0">3</option>
                                        <option value="3.5">3.5</option>
                                        <option value="4.0">4</option>
                                        <option value="4.5">4.5</option>
                                        <option value="5.0" selected>5</option>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <div class="container" style="margin: auto;">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button name="avaliAuto" type="submit" class="btn btn-primary" type="submit">Confirmar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="reAvaliar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm text-center">
                <div class="modal-content">
                    <div class="modal-body">
                        <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Avaliar Autoescola</h4><hr>
                        <form method="post">
                            <input type="hidden" id="id" name="id">
                            <div class="mb-3">
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="inputGroup">Avaliação:</span>
                                    <select class="form-select" id="avali" name="avali" required>
                                        <option value="0.5">0.5</option>
                                        <option value="1.0">1</option>
                                        <option value="1.5">1.5</option>
                                        <option value="2.0">2</option>
                                        <option value="2.5">2.5</option>
                                        <option value="3.0">3</option>
                                        <option value="3.5">3.5</option>
                                        <option value="4.0">4</option>
                                        <option value="4.5">4.5</option>
                                        <option value="5.0">5</option>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <div class="container" style="margin: auto;">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button name="reAvali" type="submit" class="btn btn-primary" type="submit">Confirmar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function reAvaliar(avali, id) {
                document.getElementById("avali").value = avali;
                document.getElementById("id").value = id;
            }
        </script>
        <%} else if (session.getAttribute(
                    "user") == null && session.getAttribute("school") == null) {
                out.print("Você deve realizar login para acessar o conteúdo desta página");
            }%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>