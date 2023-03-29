<%-- Document : login Created on : 9 de mar de 2023, 19:51:52 Author : user --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login</title>
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
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                    </div>
                    <!-- Fim indicadores para navegar nos slides do carousel -->

                    <!-- Início slide carousel -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/banner_top_v1.jpg" class="d-block w-100" alt="Categoria 1">
                        </div>
                        <div class="carousel-item">
                            <img src="images/banner_top_v2.jpg" class="d-block w-100" alt="Categoria 2">
                        </div>
                        <div class="carousel-item">
                            <img src="images/banner_top_v3.jpg" class="d-block w-100" alt="Categoria 3">
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
                <div class = "container my-3">
                        <div class = "row gx-lg-5">
                            <div class = "col-lg-6 mb-5">
                                <h3 class="mt-4">Encontre sua AutoEscola!</h3>
                                <p class = "text-muted fw-light lh-lg my-4">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Velit sequi iste accusamus blanditiis sit ex voluptates et qui iusto fugit, alias quod eveniet eum quidem culpa odio tenetur ea? Earum iste maiores vero tempora aperiam, quia perspiciatis eligendi nihil odit debitis eum, itaque dolorum cumque ad? Id expedita fugiat ut!</p>
                                <p class = "text-muted fw-light lh-lg my-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet error id qui labore dolorem omnis?</p>
                                <button type = "button" class = "btn btn-green mt-2">Read more</button>
                            </div>
                            <div class = "col-lg-6">
                                <img src = "images/autoescola.jpg" class = "img-fluid">
                            </div>
                        </div>
                </div>
        </section>
                <div class="box">
                    <section class="container marketing">
                        <div class="mb-3 d-flex justify-content-center">
                            <h2 class="mt-3">Sobre</h2>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="d-flex align-items-center flex-column">
                                    <img class="rounded-circle" src="images/vantagens-abrir-franquia-2.jpg"
                                        alt="Generic placeholder image" width="140" height="140" />
                                    <h2>Heading</h2>
                                    <p>
                                        Donec sed odio dui. Etiam porta sem malesuada magna
                                        mollis euismod. Nullam id dolor id nibh ultricies vehicula
                                        ut id elit. Morbi leo risus, porta ac consectetur ac,
                                        vestibulum at eros. Praesent commodo cursus magna.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="d-flex align-items-center flex-column">
                                    <img class="rounded-circle" src="images/vantagens-abrir-franquia-2.jpg"
                                        alt="Generic placeholder image" width="140" height="140" />
                                    <h2>Heading</h2>
                                    <p>
                                        Donec sed odio dui. Etiam porta sem malesuada magna
                                        mollis euismod. Nullam id dolor id nibh ultricies vehicula
                                        ut id elit. Morbi leo risus, porta ac consectetur ac,
                                        vestibulum at eros. Praesent commodo cursus magna.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="d-flex align-items-center flex-column">
                                    <img class="rounded-circle" src="images/vantagens-abrir-franquia-2.jpg"
                                        alt="Generic placeholder image" width="140" height="140" />
                                    <h2>Heading</h2>
                                    <p>
                                        Donec sed odio dui. Etiam porta sem malesuada magna
                                        mollis euismod. Nullam id dolor id nibh ultricies vehicula
                                        ut id elit. Morbi leo risus, porta ac consectetur ac,
                                        vestibulum at eros. Praesent commodo cursus magna.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-4 mt-3">
                                <div class="d-flex align-items-center flex-column">
                                    <img class="rounded-circle" src="images/vantagens-abrir-franquia-2.jpg"
                                        alt="Generic placeholder image" width="140" height="140" />
                                    <h2>Heading</h2>
                                    <p>
                                        Donec sed odio dui. Etiam porta sem malesuada magna
                                        mollis euismod. Nullam id dolor id nibh ultricies vehicula
                                        ut id elit. Morbi leo risus, porta ac consectetur ac,
                                        vestibulum at eros. Praesent commodo cursus magna.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-4 mt-3">
                                <div class="d-flex align-items-center flex-column">
                                    <img class="rounded-circle" src="images/vantagens-abrir-franquia-2.jpg"
                                        alt="Generic placeholder image" width="140" height="140" />
                                    <h2>Heading</h2>
                                    <p>
                                        Donec sed odio dui. Etiam porta sem malesuada magna
                                        mollis euismod. Nullam id dolor id nibh ultricies vehicula
                                        ut id elit. Morbi leo risus, porta ac consectetur ac,
                                        vestibulum at eros. Praesent commodo cursus magna.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-4 mt-3">
                                <div class="d-flex align-items-center flex-column">
                                    <img class="rounded-circle" src="images/vantagens-abrir-franquia-2.jpg"
                                        alt="Generic placeholder image" width="140" height="140" />
                                    <h2>Heading</h2>
                                    <p>
                                        Donec sed odio dui. Etiam porta sem malesuada magna
                                        mollis euismod. Nullam id dolor id nibh ultricies vehicula
                                        ut id elit. Morbi leo risus, porta ac consectetur ac,
                                        vestibulum at eros. Praesent commodo cursus magna.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <%@include file="WEB-INF/jspf/footer.jspf" %>
        </body>
        </html>