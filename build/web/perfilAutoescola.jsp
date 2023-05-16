<%-- 
    Document   : perfilusuario
    Created on : 16/03/2023, 13:53:42
    Author     : Alex
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.time.*"%>
<!DOCTYPE html>
<%
    String autoException = null;
    ArrayList<Service> servicos = new ArrayList<>();
    session.setAttribute("ORDER", "1");
    session.setAttribute("ORDER2", " ASC");
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
                    autoException = "Senhas Não Correspondentes!";
                    throw new java.lang.RuntimeException(autoException);
                }
            } else {
                autoException = "Senha Atual Incorreta!";
                throw new java.lang.RuntimeException(autoException);
            }
        }

        if (request.getParameter("delServico") != null) {
            int idServico = Integer.parseInt(request.getParameter("idenServicoDel"));
            Service.deleteService(idServico, ((DrivingSchool) session.getAttribute("school")).getIdAutoescola());
            response.sendRedirect("http://localhost:8080/IRotas/perfilAutoescola.jsp");
        }

    } catch (Exception ex) {
        autoException = ex.getMessage();
    }

    String serviceException = null;
    try {
        servicos = Service.getServicosAutoescola(((DrivingSchool) session.getAttribute("school")).getIdAutoescola().toString());
        if (request.getParameter("cadServico") != null) {
            int idServico = 0;
            int idAuto = ((DrivingSchool) session.getAttribute("school")).getIdAutoescola();
            String descricao = request.getParameter("descricao");
            LocalTime horaInicio = LocalTime.parse(request.getParameter("inicio"));
            LocalTime horaFim = LocalTime.parse(request.getParameter("fim"));
            Double vAula = Double.parseDouble(request.getParameter("vAula"));
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            Service servico = new Service(
                    idServico,
                    idAuto,
                    descricao,
                    horaInicio,
                    horaFim,
                    vAula,
                    tipo
            );
            Service.addServico(servico);
            response.sendRedirect("http://localhost:8080/IRotas/perfilAutoescola.jsp");
        }
        if (request.getParameter("altServico") != null) {
            int idServico = Integer.parseInt(request.getParameter("idServico"));
            int idAuto = ((DrivingSchool) session.getAttribute("school")).getIdAutoescola();
            String descricao = request.getParameter("descricao");
            LocalTime horaInicio = LocalTime.parse(request.getParameter("inicio"));
            LocalTime horaFim = LocalTime.parse(request.getParameter("fim"));
            Double vAula = Double.parseDouble(request.getParameter("vAula"));
            int tipo = Integer.parseInt(request.getParameter("tipo"));
            Service servico = new Service(
                    idServico,
                    idAuto,
                    descricao,
                    horaInicio,
                    horaFim,
                    vAula,
                    tipo
            );
            Service.alterServico(servico);
            response.sendRedirect("http://localhost:8080/IRotas/perfilAutoescola.jsp");
        }
    } catch (Exception ex) {
        serviceException = ex.getMessage();
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
        <%if (session.getAttribute("school") != null) {%> 
        <div class="container-fluid" style="margin-bottom: 30px">
            <div class="caixa" style="padding-bottom: 0; padding-top: 0; margin-top: 15px">
                <div class="row justify-content-center">
                    <%if (autoException != null) {%>
                    <div style="color: black; font-size: 30px; border: 10px double red;">
                        <%= autoException%>
                    </div>
                    <br>
                    <%}%>
                    <%if (serviceException != null) {%>
                    <div style="color: black; font-size: 30px; border: 10px double red;">
                        <%= serviceException%>
                    </div>
                    <br>
                    <%}%>
                    <div class="col" style="margin-top: 20px;">
                        <b style="font-size: 30px; margin-left: 15px;"><%= ((DrivingSchool) session.getAttribute("school")).getNome()%> - Avaliação: <%=((DrivingSchool) session.getAttribute("school")).getAvalaicao() / ((DrivingSchool) session.getAttribute("school")).getQtdeAvalaicao()%>/5.0</b>
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
                    <p style="font-size: 30px; padding: 0; margin-bottom: 16px"><b>Meus Serviços</b></p>
                    <% for (Service s : servicos) {%>
                    <div class="row justify-content-center" style="border: 1px solid black; margin-bottom: 30px; margin-left: 0.00001px; margin-right: 0.000001px">
                        <div class="col-4" style="padding-top: 35px">
                            <h4><%= s.getDescricao()%></h4>
                        </div>
                        <div class="col-6">
                            <h4>Tipo: <% if (s.getTipo() == 1) {
                                    out.print("Prática");
                                } else {
                                    out.print("Teórica");
                                }%></h4>
                            <h4>Inicia: <%= s.getHoraInicio()%> - Termina <%= s.getHoraFim()%></h4>
                            <h4>Valor R$:<%= s.getValor()%></h4>
                        </div>
                        <div class="col-2" style="padding-top: 35px">
                            <form autocomplete="off" method="POST">
                                <button class="btn btn-warning" style="color: white;">
                                    <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#altServico"
                                       onclick="dadosAltServico('<%=s.getIdServico() %>','<%=s.getDescricao()%>','<%=s.getHoraInicio()%>','<%=s.getHoraFim()%>',
                                                   '<%=s.getValor()%>','<%=s.getTipo()%>')">
                                        <b>Alterar</b>
                                    </a>
                                </button>
                                <input type="hidden" name="idenServicoDel" value="<%= s.getIdServico()%>" />
                                <input style="font-weight: bold;" type="submit" name="delServico" value="Remover" class="btn btn-danger"/>
                            </form>
                        </div>
                    </div>
                    <%}%>
                    <button class="btn btn-primary" style="color: white; margin-bottom: 20px">
                        <a class="nav-link navLog" data-bs-toggle="modal" data-bs-target="#cadServico">Cadastrar Serviço</a>
                    </button>
                </div>
                <hr>
                <div class="row justify-content-center">
                    <b style="font-size: 30px; padding: 0;">Pré-Visualização Do Seu Card</b>
                    <div class="col-md-2" style="margin-bottom: 30px; margin-top: 20px">
                        <div class="card" style="width: 16rem; height: 30em">
                            <img src="images/carro.png" class="card-img-top">
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

            <div class="modal fade" id="altServico" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg text-center">
                    <div class="modal-content">
                        <div class="modal-body caixa">
                            <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Alterar Serviço</h4><hr>
                            <div class="container" style="margin-bottom: 30px">
                                <div class="row justify-content-center" style="margin-top: 30px;">
                                    <div class="caixa" style="border: 0">
                                        <form method="POST">
                                            <input type="hidden" id="idServico" name="idServico">
                                            <div class="row ">
                                                <div class="row" >
                                                    <div class="col">
                                                        <h4 style="padding-bottom: 1px;" >Tipo de Aula Oferecida:</h4>
                                                        <select class="form-select" id="tipo" name="tipo" required>
                                                            <option value="0">Prática</option>
                                                            <option value="1">Teórica</option>
                                                        </select>
                                                    </div>
                                                    <div class="col">
                                                        <h4 style="padding-bottom: 1px;">Valor das Aulas:</h4>
                                                        <input class="form-control" style="margin-bottom: 10px;" type="number" step=".01" id="vAula" name="vAula" placeholder="R$" required>
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <h4 style="margin-top: 20px;">Horario:</h4>
                                                    <div class="col">
                                                        <label>Inicio:</label>
                                                        <input class="form-control" style="margin-bottom: 10px;" type="time" id="inicio" name="inicio" required>
                                                    </div>
                                                    <div class="col">
                                                        <label>Fim:</label>
                                                        <input class="form-control" style="margin-bottom: 10px;" type="time" id="fim" name="fim" required>
                                                    </div>
                                                </div>
                                                <h4>Descrição (Incluir Categoria):</h4>
                                                <textarea class="form-control" rows="6" id="descServico" name="descricao"></textarea>
                                                <br>
                                                <div class="col-xs-1" align="center" style="margin-top: 15px">
                                                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cancelar</button>
                                                    <input class="btn btn-primary" type="submit" name="altServico" value="Alterar">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="cadServico" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg text-center">
                    <div class="modal-content">
                        <div class="modal-body caixa">
                            <h4 class="modal-title" id="exampleModalLabel" style="margin: auto;">Cadastrar Serviço</h4><hr>
                            <div class="container" style="margin-bottom: 30px">
                                <div class="row justify-content-center" style="margin-top: 30px;">
                                    <div class="caixa" style="border: 0">
                                        <form method="POST">
                                            <div class="row ">
                                                <div class="row" >
                                                    <div class="col">
                                                        <h4 style="padding-bottom: 1px;" >Tipo de Aula Oferecida:</h4>
                                                        <select class="form-select" name="tipo" required>
                                                            <option value="0">Prática</option>
                                                            <option value="1">Teórica</option>
                                                        </select>
                                                    </div>
                                                    <div class="col">
                                                        <h4 style="padding-bottom: 1px;">Valor das Aulas:</h4>
                                                        <input class="form-control" style="margin-bottom: 10px;" type="number" step=".01" name="vAula" placeholder="R$" required>
                                                    </div>
                                                </div>
                                                <div class="row" >
                                                    <h4 style="margin-top: 20px;">Horario:</h4>
                                                    <div class="col">
                                                        <label>Inicio:</label>
                                                        <input class="form-control" style="margin-bottom: 10px;" type="time" name="inicio" required>
                                                    </div>
                                                    <div class="col">
                                                        <label>Fim:</label>
                                                        <input class="form-control" style="margin-bottom: 10px;" type="time" name="fim" required>
                                                    </div>
                                                </div>
                                                <h4>Descrição (Incluir Categoria):</h4>
                                                <textarea class="form-control" rows="6" name="descricao"></textarea>
                                                <br>
                                                <div class="col-xs-1" align="center" style="margin-top: 15px">
                                                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cancelar</button>
                                                    <input class="btn btn-primary" type="submit" name="cadServico" value="Cadastrar">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
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
                function dadosAltServico(id, desc, hrIni, hrFim, vl, tipo) {
                    document.getElementById('idServico').value = id;
                    document.getElementById('descServico').value = desc;
                    document.getElementById('inicio').value = hrIni;
                    document.getElementById('fim').value = hrFim;
                    document.getElementById('vAula').value = vl;
                    document.getElementById('tipo').value = tipo;
                }
            </script>
            <%} else {
                    out.print("Você deve realizar login para acessar o conteúdo desta página");
                }%>
            <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>