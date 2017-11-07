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

                    <a class="navbar-brand" href="propietario.htm?cedula=${cedula}" onclick="location.href = '${pageContext.request.contextPath}/portal.htm'">CANCHA LIBRE RESERVAS</a>

                </div>
                <script>
                    function goBack() {
                        window.history.back();
                    }
                </script>


                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			
			
			<ul class="nav navbar-nav navbar-right">
                               
                                
                                
				<li class="dropdown ">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						Opciones
						<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
                                                    <li><a href="usuario2.htm?cedula=${cedula}" onclick="location.href='${pageContext.request.contextPath}/usuario2.htm'">Mi Perfil</a></li>
                                                    <li><a href="contactenos2.htm?cedula=${cedula}" onclick="location.href='${pageContext.request.contextPath}/contactenos2.htm'">Contáctenos</a></li>
							<li><a href="login.htm" onclick="location.href='${pageContext.request.contextPath}/login.htm'">Cerrar Sesión</a></li>
						</ul>
					</li>
				</ul>
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
                                <div style="margin-bottom:20px"class="name"><strong>${name}</strong></div>
                                <div style="margin-bottom:20px"class="info">

                                    <span>
                                        <strong style="font-size:180%"> ${nombre}</strong><br>
                                        <br>
                                        <strong>Direccion:</strong> ${dir}. 
                                        <br> <strong> Ciudad:</strong> Cali Colombia.<br>
                                    </span>

                                </div>
  

                            </div>
                        </div>
                    </div>

                       <div class="col-xs-12 col-md-8 col-lg-9">
                        <div class="box">
                            <h2 class="boxTitle">${name}</h2>
                            <!-- Tabs -->
                            <ul class="nav nav-tabs userProfileTabs" role="tablist">
                                <li role="presentation" class="active"><a href="#tab-item-1" aria-controls="tab-item-1" role="tab" data-toggle="tab" aria-expanded="true">Información Establecimiento</a></li>
                                <li role="presentation" class=""><a href="#tab-item-4" aria-controls="tab-item-4" role="tab" data-toggle="tab" aria-expanded="false">Reservas</a></li>
                            </ul>

                            <div class="tab-content">
                                <!-- About -->
                                <div role="tabpanel" class="tab-pane fade active in" id="tab-item-1">
                                    <div class="userProfileContent">
                                        <div id="tab-item-1" style="position: absolute; top:90px" > 
                                             <form method="POST">
                                                <div style="vertical-align: top; position: absolute">
                                                    <label class="control-label col-sm-2 requiredField">
                                                       Nombre:
                                                    </label>
                                                    <input value="${nombre}" type="text" name="nombre" id="nombre" disabled=""/>
                                                </div>
                                                <div style="vertical-align: top; position: absolute; top:60px">
                                                    <label class="control-label col-sm-2 requiredField">
                                                       Direccion:
                                                    </label>
                                                    <input value="${dir}" type="text" id="direccion"name="direccion" disabled=""/>
                                                </div>
                                                <div style="vertical-align: top; position: absolute; top: 140px">
                                                    <label class="control-label col-sm-6 requiredField">
                                                       Quienes somos:
                                                    </label>
                                                    <textarea rows="4" cols="90" id="somos" name="somos" maxlength="400" readonly> ${somos}</textarea>
                                                </div>
                                                <div style="vertical-align: top; position: absolute; top:290px">
                                                    <label class="control-label col-sm-2 requiredField">
                                                       Precio:
                                                    </label>
                                                    <input rows="4" cols="90" id="precio" name="precio"maxlength="400" readonly value="${precio}"/> 
                                                </div>
                                                <input type="hidden" name="id" value=${id}  >
                                                <button class="btn btn-lg btn-primary btn-block" type="submit" style="width: 90px ;position: absolute; text-align: center;display: none; top: 380px; left: 130px" id="boton" type="submit">Guardar</button> 
                                        
                                            </form>
                                            <button class="btn btn-lg btn-primary btn-block" onclick="habilitar()" style="width: 90px; position: absolute; top: 380px">Editar</button>  
                                        </div>

                                    </div>
                                </div>


                                <!-- Friends -->
                                <div role="tabpanel" class="tab-pane fade" id="tab-item-4">
                                    <div class="panel panel-default">             
                                        <div class="panel-heading" style="font-size:180%">
                                            Reservas de ${cancha}  
                                        </div>
                                    <div>
                                        <table >
                                             <tr style="text-align:center">
                                                 <td width="200" height="50px"><strong>NOMBRE</strong></td>
                                                 <td width="200" height="50px"><strong>APELLIDO</strong></td>
                                                 <td width="200" height="50px"><strong>FECHA</strong></td>
                                                 <td width="200" height="50px"><strong>HORA</strong></td>
                                                 <td width="200" height="50px"><strong>PRECIO</strong></td>
                                                 <td width="200" height="50px"><strong>ACCION</strong></td>
                                             </tr>
                                             <c:forEach items="${datos}" var="dato">
                                                 <tr>
                                                     <td align="center" font style="text-transform: uppercase;">${dato.nombres}</td>
                                                     <td align="center" font style="text-transform: uppercase;">${dato.apellidos}</td>
                                                     <td align="center" >${dato.fecha}</td>
                                                     <td align="center"> ${dato.hora}</td>
                                                     <td align="center">${dato.tarifa}</td>
                                                     <td> <a href="Infocancha.htm?Act=${dato.codreserva}&id=${id}&cedula=${cedula}">ELIMINAR</a> </td>
                                                 </tr>
                                             </c:forEach>
                                         </table>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<script>
    function habilitar(){
        document.getElementById("nombre").disabled=false;
        document.getElementById("direccion").disabled=false;
        document.getElementById("somos").readOnly =false;
        document.getElementById("precio").readOnly =false;
        document.getElementById("boton").style.display="block";
        
    }
</script>

<script>
    function esconder(){
        document.getElementById("tab-item-2").style.display="none";
        document.getElementById("tab-item-1").style.display="block";
    }
</script>

<script>
    function hidden(){
        document.getElementById("tab-item-1").style.display="none"
        document.getElementById("tab-item-2").style.display="block";
    }
</script>
<footer class="pull-left footer" style="position: absolute; top:680px">
                <p class="col-md-12">
                <hr class="divider">
                Copyright &COPY; 2017 <a>DABG</a>
                </p>
            </footer>
        </div>

    </body>
</html>





