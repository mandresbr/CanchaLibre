<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cancha Libre</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <style>
            /*     Set height of the grid so .sidenav can be 100% (adjust as needed) 
                .row.content {height: 550px}
                
                 Set gray background color and 100% height 
                .sidenav {
                  background-color: #f1f1f1;
                  height: 100%;
                  width: 15%;
                }
                    
                 On small screens, set height to 'auto' for the grid 
                @media screen and (max-width: 1000px) {767
                  .row.content {height: auto;} 
                }*/
            h1.page-header {
                margin-top: -5px;
            }

            .navbar-form{
                margin-right: 20px;
            }
            .sidebar {
                padding-left: 0;
            }

            .main-container { 
                background: #FFF;
                padding-top: 15px;
                margin-top: -20px;
            }

            .footer {
                width: 100%;
            }   
            .placeholders {
                margin-bottom: 30px;
                text-align: center;
                margin:20px;
            }
            .placeholders h4 {
                margin-bottom: 0;
            }
            .placeholder {
                margin-bottom: 20px;
            }
            .placeholder img {
                display: inline-block;
                border-radius: 0%;
            }

            .img-incs{
                margin-top: 1px;
            }

            .nav-pills{
                margin-bottom: 10px;
            }
            .form-signin {
                max-width: 330px;
                padding: 15px;
                margin: 0 auto;
            }
            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }
            .form-signin .checkbox {
                font-weight: normal;
            }
            .form-signin .form-control {
                position: relative;
                height: auto;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                padding: 10px;
                font-size: 16px;
            }
            .form-signin .form-control:focus {
                z-index: 2;
            }
            .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }
            .form-signin input[type="password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

        </style>

    <body>

        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <button type="button" onclick="goBack()" class="btn btn-default navbar-btn pull-left" style="margin-right:10px">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </button>

                    <img src="<c:url value="/images/canchalibre.png"/>" alt="CL" class="img-incs" width="70" height="50">

                    <a class="navbar-brand" href="reserva.htm?cedula=${cedula}" onclick="location.href = '${pageContext.request.contextPath}/reserva.htm'">CANCHA LIBRE RESERVAS</a>

                </div>
                    
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			
			
			<ul class="nav navbar-nav navbar-right">
                                <a class="navbar-brand" href="reservasuser.htm?id=${cedula}" onclick="location.href='${pageContext.request.contextPath}/reservasuser.htm'">MIS RESERVAS</a>
                                
                                
				<li class="dropdown ">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						Opciones
						<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
                                                        <li><a href="usuario.htm?cedula=${cedula}" onclick="location.href='${pageContext.request.contextPath}/usuario.htm'">Mi Perfil</a></li>
							<li><a href="contactenos.htm?cedula=${cedula}" onclick="location.href='${pageContext.request.contextPath}/contactenos.htm'">Contáctenos</a></li>
							<li><a href="login.htm" onclick="location.href='${pageContext.request.contextPath}/login.htm'">Cerrar Sesión</a></li>
						</ul>
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
                <script>
                    function goBack() {
                        window.history.back();
                    }
                </script>


                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			

                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <div class="container-fluid main-container">
            <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
            <div class="container">

                <div class="row">
                    <div class="col-xs-12 col-md-4 col-lg-3">
                        <div class="userProfileInfo">
                            <div class="image text-center">
                                <img src="<c:url value="/images/${path}"/>" alt="#" class="img-responsive">
                            </div>
                            <div  class="box">
                                <div style="font-size:25px;margin-top:20px;margin-bottom:20px"class="name"><strong>${name}</strong></div>
                                <div style="margin-bottom:20px"class="info">

                                    <span style="font-size:20px;"><i class=""></i> ${dir}. <br> Cali. <br>Colombia.<br></span>

                                </div>
                                
                                <div class="name" style="font-size:25px;"><strong>Detalles de Reserva</strong></div>
                                <div style="margin-bottom:20px"class="info">

                                    <span style="font-size:20px;"><i class=""></i>Fecha: ${fecha}. <br>Hora: ${hora}.<br></span>

                                </div>
                                 
                                <form class="form-signin" method="POST"  >
                                    <input type="hidden" name="fecha" value=${date}  ><br>
                                    <input type="hidden" name="cedula" value=${cedula}  ><br>
                                    <input type="hidden" name="hora" value=${time}><br>
                                    <input type="hidden" name="idC" value=${id}><br>
                                    <input type="hidden" name="direccion" value=${direccion}><br>
                                    <button style="position:relative;top:-100px"class="btn btn-lg btn-primary btn-block" name="submit" type="submit">
                                        Reservar Cancha
                                    </button>

                                </form>


                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12 col-md-8 col-lg-9">
                        <div class="box">
                            <h2 class="boxTitle">${name}</h2>
                            <!-- Tabs -->
                            <ul class="nav nav-tabs userProfileTabs" role="tablist">
                                <li role="presentation" class="active"><a href="#tab-item-1" aria-controls="tab-item-1" role="tab" data-toggle="tab" aria-expanded="true">Inicio</a></li>
                                <li role="presentation" class=""><a href="#tab-item-3" aria-controls="tab-item-3" role="tab" data-toggle="tab" aria-expanded="false">Fotos</a></li>
                                <li role="presentation" class=""><a href="#tab-item-4" aria-controls="tab-item-4" role="tab" data-toggle="tab" aria-expanded="false">Precio</a></li>
                            </ul>

                            <div class="tab-content">
                                <!-- About -->
                                <div role="tabpanel" class="tab-pane fade active in" id="tab-item-1">
                                    <div class="userProfileContent">
                                        <div class="i">

                                            <h2 class="boxHeadline">Quiénes somos</h2>
                                            <p>Somos una organización empresarial de proyección deportiva, educativa, recreativa, prestamos el servicio de alquiler canchas de Fútbol y Voley Playa, somos los mejores referentes en entretenimiento futbolero en la ciudad de Cali. </p>
                                        </div>

                                        <div class="i">
                                            <h2 class="boxHeadline">Características</h2>
                                            <ul class="simpleListings">
                                                <li>

                                                    <p>5 Canchas de Fútbol 5 en Grama.</p>
                                                </li>
                                                <li>
                                                    <p>3 Canchas de Voley Playa en Arena Amarilla.</p>
                                                </li>
                                                <li>
                                                    <p>Gran capacidad de parqueaderos para carros y motos.</p>
                                                </li>
                                                <li>
                                                    <p>Locales comerciales.</p>
                                                </li>
                                                <li>
                                                    <p>Kioscos para venta de comidas rápidas.</p>
                                                </li>
                                                <li>
                                                    <p>Amplia plazoleta y zona de hidratación.</p>
                                                </li>


                                            </ul>
                                        </div>


                                    </div>
                                </div>



                                <!-- Photos -->
                                <div role="tabpanel" class="tab-pane fade" id="tab-item-3">

                                    <h2 class="boxHeadline">Galería Fotográfica</h2>
                                    <img src="<c:url value="/images/${path}"/>" width="700" height="700"
                                         class="img-responsive" alt="Generic placeholder thumbnail">
                                </div>

                                <!-- Friends -->
                                <div role="tabpanel" class="tab-pane fade" id="tab-item-4">
                                    Las canchas serán alquiladas por horas.
                                    El alquiler incluirá balón de fútbol y petos para ambos equipos.
                                    
                                    <div class="userProfileContent">
                                        <div class="i">

                                            <h2 class="boxHeadline">Precio: ${precio} COP</h2>
                                            
                                        </div>



                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="pull-left footer">
                <p class="col-md-12">
                <hr class="divider">
                Copyright &COPY; 2017 <a>DABG</a>
                </p>
            </footer>
        </div>
        
    </body>
</html>





