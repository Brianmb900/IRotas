<%-- 
    Document : login 
    Created on : 9 de mar de 2023, 19:51:52 
    Author : Erik 
--%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="pt-br">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Inicial</title>
            <%@include file="WEB-INF/jspf/css.jspf" %>
            <%@include file="WEB-INF/jspf/scripts.jspf" %>
        </head>
        <body>
            <%@include file="WEB-INF/jspf/header.jspf" %>
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <!-- Início indicadores para navegar nos slides do carousel -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    </div>
                    <!-- Fim indicadores para navegar nos slides do carousel -->

                    <!-- Início slide carousel -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img style="height: 450px; width: 2000px; object-fit: contain" src="images/banner-1.png" alt="Categoria 1">
                        </div>
                        <div class="carousel-item">
                            <img style="height: 450px; width: 2000px; object-fit: contain" src="images/banner-2.png"  alt="Categoria 2">
                        </div>
                    </div>
                    <!-- Fim slide carousel -->

                    <!-- Início anterior e próximo slide carousel -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                    <!-- Fim anterior e próximo slide carousel -->
                </div>
        <section id = "sec-4" class = "py-2.5">
            <div class="procurar">
                <div class = "container my-3">
                        <div class = "row gx-lg-5">
                            <div class = "col-lg-6 mb-5">
                                <h3 class="mt-4">Encontre sua Auto Escola!</h3>
                                <p class = "text-muted fw-light lh-lg my-4">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Velit sequi iste accusamus blanditiis sit ex voluptates et qui iusto fugit, alias quod eveniet eum quidem culpa odio tenetur ea? Earum iste maiores vero tempora aperiam, quia perspiciatis eligendi nihil odit debitis eum, itaque dolorum cumque ad? Id expedita fugiat ut!</p>
                                <p class = "text-muted fw-light lh-lg my-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet error id qui labore dolorem omnis?</p>
                                <button type = "button" class = "btn btn-primary mt-2">Encontre Já!</button>
                            </div>
                            <div class = "col-lg-6">
                                <img src = "images/autoescola.jpg" class = "img-fluid">
                            </div>
                        </div>
                </div></div>
        </section>
            <div class="boxAbout">
                        <section class="container marketing">
                            <div class="mb-3 d-flex justify-content-center">
                                <h2 class="mt-3">Sobre</h2>
                            </div>
                            <hr size = 7>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="d-flex align-items-center flex-column">
                                        <img style="border: 3.5px solid blue;" class="rounded-circle" src="https://cdn1.iconfinder.com/data/icons/business-and-office-3-4/128/130-512.png"
                                            alt="Generic placeholder image" width="140" height="140" />
                                        <h2>Divulgação</h2>
                                        <p>
                                            Aqui fornecemos as Auto Escolas divulgar seus
                                            servições, valores, ambiente e avalições em geral.
                                            Para aumentar a area de buscar por Auto Escolas
                                            com ensino qualificado. 
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="d-flex align-items-center flex-column">
                                        <img style="border: 3.5px solid blue;" class="rounded-circle" src="images/2.png"
                                            alt="Generic placeholder image" width="140" height="140" />
                                        <h2>Usabilidade fácil!</h2>
                                        <p>
                                            Criamos um site simples e objetivo, para quidem
                                            qualquer usuário tenha facilidade em navegar e 
                                            encontrar a Auto Escola que combine com seus
                                            interesses.
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="d-flex align-items-center flex-column">
                                        <img style="border: 3.5px solid blue;" class="rounded-circle" src="images/3.png"
                                            alt="Generic placeholder image" width="140" height="140" />
                                        <h2>Avalições</h2>
                                        <p>
                                            Nosso sistema de avalições das Auto Escolas
                                            é feito por alunos que já frequentaram ela,
                                            tornando o primeiro contato da Auto Escolas 
                                            com novos cliente melhor!
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-4 mt-3">
                                    <div class="d-flex align-items-center flex-column">
                                        <img style="border: 3.5px solid blue;" class="rounded-circle" src="images/4.jpg"
                                            alt="Generic placeholder image" width="140" height="140" />
                                        <h2>Comunicação</h2>
                                        <p>
                                            Através de nosso site tornou-se possivel
                                            ter uma melhor comunicação e disponibilidade
                                            com as Auto Escolas e seus serviços.

                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-4 mt-3">
                                    <div class="d-flex align-items-center flex-column">
                                        <img style="border: 3.5px solid blue;" class="rounded-circle" src="images/5.png"
                                            alt="Generic placeholder image" width="140" height="140" />
                                        <h2>CNH</h2>
                                        <p>
                                            Não perca tempo, perfies de Auto Escolas
                                            possuem os tipos de CNH e suas respectivas
                                            aulas que ofericidas!
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-4 mt-3">
                                    <div class="d-flex align-items-center flex-column">
                                        <img style="border: 3.5px solid blue;" class="rounded-circle" src="images/6.png"
                                            alt="Generic placeholder image" width="140" height="140" />
                                        <h2>IRotas</h2>
                                        <p>
                                            O primeiro site de divulgação para Auto Escolas
                                            do Brasil, confira agora sem sair de casa uma 
                                            Auto Escola que combine com você!!
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </section>
            </div>        
            <%@include file="WEB-INF/jspf/footer.jspf" %>
        </body>
        </html>