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
                        
                        <a class="navbar-brand" href="reserva.htm?cedula=${cedula}" onclick="location.href = '${pageContext.request.contextPath}/reserva.htm'">CANCHA LIBRE RESERVAS</a>
                        
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
                                                    <li><a href="usuario.htm?cedula=${cedula}" onclick="location.href='${pageContext.request.contextPath}/usuario.htm'">Mi Perfil</a></li>
                                                    <li><a href="contactenos.htm" onclick="location.href='${pageContext.request.contextPath}/contactenos.htm'">Contáctenos</a></li>
							<li><a href="login.htm" onclick="location.href='${pageContext.request.contextPath}/login.htm'">Cerrar Sesión</a></li>
						</ul>
					</li>
				</ul>
		</div><!-- /.container-fluid -->
	</nav>
	<div class="container-fluid main-container">
		
		<div class="col-md-12 content">
            <div class="panel panel-default">
                
                <div class="panel-heading" style="font-size:180%; text-align: center">
                    Reservas de ${cancha}  
            </div>
            <div>
                <table >
                    <tr style="text-align:center">
                        <td align="center" width="200" height="50px"><strong>NOMBRE</strong></td>
                        <td align="center" width="200" height="50px"><strong>APELLIDO</strong></td>
                        <td align="center" width="200" height="50px"><strong>FECHA</strong></td>
                        <td align="center" width="200" height="50px"><strong>HORA</strong></td>
                        <td align="center" width="200" height="50px"><strong>PRECIO</strong></td>
                        <td align="center" width="200" height="50px"><strong>ACCIÓN</strong></td>
                    </tr>
                    <c:forEach items="${datos}" var="dato">
                        <tr>
                            <td align="center"font style="text-transform: uppercase;">${dato.nombres}</td>
                            <td align="center"font style="text-transform: uppercase;">${dato.apellidos}</td>
                            <td align="center">${dato.fecha}</td>
                            <td align="center">${dato.hora}</td>
                            
                            <td align="center">${dato.tarifa}</td>
                            <td align="center"> <a href="Infocancha.htm?Act=${dato.codreserva}">ELIMINAR</a> </td>
                        </tr>
                    </c:forEach>
                </table>
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





