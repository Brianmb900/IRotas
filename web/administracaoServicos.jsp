<%-- 
    Document   : cadastro
    Created on : 9 de mar de 2023, 19:51:52
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
    String admException = null;
    ArrayList<Service> servicos = new ArrayList<>();
    ArrayList<Service> servicoBusca = new ArrayList<>();
    int limite = 5;
    int total = 0;
    try {
        int pageid = Integer.parseInt(request.getParameter("page"));
        if (pageid == 1) {
        } else {
            pageid = (pageid - 1) * limite + 1;
        }
        servicos = Service.getServicos(pageid, limite, (session.getAttribute("ORDER").toString()), (session.getAttribute("ORDER2").toString()));
        servicoBusca = Service.searchServico(session.getAttribute("SEARCH").toString(), pageid, limite, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString());
        if (session.getAttribute("SEARCH").toString().equals("0")) {
            total = Service.getTotalServicos().size();
        } else {
            total = Service.searchServico(session.getAttribute("SEARCH").toString(), pageid, 100000, session.getAttribute("ORDER").toString(), session.getAttribute("ORDER2").toString()).size();
        }

        if (request.getParameter("delServico") != null) {
            int idServico = Integer.parseInt(request.getParameter("idenServicoDel"));
            int idAuto = Integer.parseInt(request.getParameter("idenAutoDel"));
            Service.deleteService(idServico, idAuto);
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }

        //ORDENAÇÕES
        if (request.getParameter("orderServicoId") != null) {
            if (session.getAttribute("ORDER").toString().equals("1") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderAutoId") != null) {
            if (session.getAttribute("ORDER").toString().equals("2") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "2");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderServicoDesc") != null) {
            if (session.getAttribute("ORDER").toString().equals("3") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "3");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderServicoInicio") != null) {
            if (session.getAttribute("ORDER").toString().equals("4") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "4");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "4");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderServicoFim") != null) {
            if (session.getAttribute("ORDER").toString().equals("5") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "5");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "5");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderServicoValor") != null) {
            if (session.getAttribute("ORDER").toString().equals("6") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "6");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "6");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }

        if (request.getParameter("orderServicoTipo") != null) {
            if (session.getAttribute("ORDER").toString().equals("7") && session.getAttribute("ORDER2").toString().equals(" ASC")) {
                session.setAttribute("ORDER", "7");
                session.setAttribute("ORDER2", " DESC");
            } else {
                session.setAttribute("ORDER", "7");
                session.setAttribute("ORDER2", " ASC");
            }
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=" + request.getParameter("page"));
        }
        //FIM ORDENAÇÕES
        if (request.getParameter("searchServico") != null) {
            session.setAttribute("SEARCH", request.getParameter("search"));
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=1");
        }

        if (request.getParameter("limpaBusca") != null) {
            session.setAttribute("SEARCH", "0");
            session.setAttribute("ORDER", "1");
            session.setAttribute("ORDER2", " ASC");
            response.sendRedirect("http://localhost:8080/IRotas/administracaoServicos.jsp?page=1");
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
                                <input class="form-control" type="number" name="search" placeholder="ID da Autoescola" required>
                                <input type="submit" name="searchServico" value="Buscar" class="btn btn-primary"/>
                            </div>
                        </form>
                        <table class="table table-my table-bordered" style="">
                            <thead>
                                <tr class="table-my">
                            <form autocomplete="off" method="POST">
                                <th><input class="orderADM" type="submit" name="orderServicoId" value="ID Serviço"/></th>
                                <th><input class="orderADM" type="submit" name="orderAutoId" value="ID Autoescola"/></th>
                                <th><input class="orderADM" type="submit" name="orderServicoDesc" value="Descrição"/></th>
                                <th><input class="orderADM" type="submit" name="orderServicoInicio" value="Inicio"/></th>
                                <th><input class="orderADM" type="submit" name="orderServicoFim" value="Fim"/></th>
                                <th><input class="orderADM" type="submit" name="orderServicoValor" value="Valor"/></th>
                                <th><input class="orderADM" type="submit" name="orderServicoTipo" value="Tipo"/></th>
                                <th>Ações</th>
                            </form>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (session.getAttribute("SEARCH").toString().equals("0")) {
                                        for (Service s : servicos) {%>
                                <tr class="table-my">
                                    <td><%= s.getIdServico()%></td>
                                    <td><%= s.getIdAutoescola()%></td>
                                    <td><%= s.getDescricao()%></td>
                                    <td><%= s.getHoraInicio()%></td>
                                    <td><%= s.getHoraFim()%></td>
                                    <td><%= s.getValor()%></td>
                                    <td><% if (s.getTipo() == 1) {
                                            out.print("Prática");
                                        } else {
                                            out.print("Teórica");
                                        }%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altAutoescola">
                                                    <b>Alterar</b>
                                                </a>
                                            </button>
                                            <input type="hidden" name="idenServicoDel" value="<%= s.getIdServico()%>" />
                                            <input type="hidden" name="idenAutoDel" value="<%= s.getIdAutoescola()%>"/>
                                            <input style="font-weight: bold;" type="submit" name="delServico" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                } else {
                                    for (Service s : servicoBusca) {%>
                                <tr class="table-my">
                                    <td><%= s.getIdServico()%></td>
                                    <td><%= s.getIdAutoescola()%></td>
                                    <td><%= s.getDescricao()%></td>
                                    <td><%= s.getHoraInicio()%></td>
                                    <td><%= s.getHoraFim()%></td>
                                    <td><%= s.getValor()%></td>
                                    <td><% if (s.getTipo() == 1) {
                                            out.print("Prática");
                                        } else {
                                            out.print("Teórica");
                                        }%></td>
                                    <td>
                                        <form autocomplete="off" method="POST">
                                            <button class="btn btn-warning" style="color: white;">
                                                <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altAutoescola">
                                                    <b>Alterar</b>
                                                </a>
                                            </button>
                                            <input type="hidden" name="idenServicoDel" value="<%= s.getIdServico()%>" />
                                            <input type="hidden" name="idenAutoDel" value="<%= s.getIdAutoescola()%>"/>
                                            <input style="font-weight: bold;" type="submit" name="delServico" value="Remover" class="btn btn-danger"/>
                                        </form>
                                    </td>
                                </tr>
                                <%}
                                    }%>
                            </tbody>
                        </table>
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
                        }%>" href="administracaoServicos.jsp?page=<%= Integer.parseInt(request.getParameter("page")) - 1%>"><</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%;" href="administracaoServicos.jsp?page=1">1</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoServicos.jsp?page=2">2</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 11) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoServicos.jsp?page=3">3</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 10%; <% if (total < 16) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoServicos.jsp?page=4">4</a>
                    <a style="text-decoration: none; font-size: 30px; margin-right: 17%; <% if (total < 21) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoServicos.jsp?page=5">5</a>
                    <a style="text-decoration: none; font-size: 30px; <% if (total < 6) {
                            out.print(" color: grey; cursor: not-allowed; opacity: 0.5; pointer-events: none;");
                        }%>" href="administracaoServicos.jsp?page=<%=Integer.parseInt(request.getParameter("page")) + 1%>">></a>
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