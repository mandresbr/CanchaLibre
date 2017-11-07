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
                        <a class="navbar-brand" href="propietario.htm?cedula=${cedula}" onclick="location.href='${pageContext.request.contextPath}/cancha.htm'">CANCHA LIBRE RESERVAS</a>
                         
		</div>
                        
                        <script>
                        function goBack() {
                            window.history.back();
                        }
                    </script>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			
			
			<ul class="nav navbar-nav navbar-right">
                            
                                <form class="navbar-form navbar-left" method="GET" role="search">
				<div class="form-group">
					<input type="text" id="searcht" class="form-control" placeholder="Buscar">
				</div>
                                </form>
				<!--<li><a href="http://www.ciegosysordos.org/" target="_blank">DABG</a></li>-->
                                
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
		
            <div class="col-md-12 content">
            <div class="panel panel-default">
                <div class="panel-heading" style="font-size:180%">
                    Establecimientos de ${nombre} ${apellido}
                </div>
                <div class="panel-body">
                    <div class="row placeholders">
                     <c:forEach items="${datos}" var="dato">
                        <div class="col-xs-6 col-sm-3 placeholder">
                              
                               <a href="<c:url value="Infocancha.htm?id=${dato.codcancha}&cancha=${dato.nombre}&cedula=${cedula}"/>"><img src="<c:url value="/images/${dato.path}"/>" width="700" height="700"
                                              class="img-responsive" alt="Generic placeholder thumbnail"></a> 
                            
                            
                          <h4 class="nombre"><c:out value="${dato.nombre}"/></h4>
                          <span class="text-muted"><c:out value="${dato.direccion}"/></span>
                        </div>
                    </c:forEach>
                    
                </div>
                </div>
               

            </div>
            
            
<!--		<div class="col-md-12 content">
            <div class="panel panel-default">
                
                <div class="panel-heading" style="font-size:180%">
                    BIENVENIDO ${nombre} ${apellido} 
                </div>
            </div>
                <div>
                    <c:forEach items="${datos}" var="dato">
                        <div class="col-xs-6 col-sm-3 placeholder">
                              
                               <a href="<c:url value="Infocancha.htm?value=${dato.codcancha}&cancha=${dato.nombre}&nom=${nombre}&apellido=${apellido}"/>"><img src="<c:url value="/images/${dato.path}"/>" width="700" height="700"
                                              class="img-responsive" alt="Generic placeholder thumbnail"></a> 
                            
                            
                          <h4 class="nombre"><c:out value="${dato.nombre}"/></h4>
                          <span class="text-muted"><c:out value="${dato.direccion}"/></span>
                        </div>
                    </c:forEach>
                </div>
                
                 
            </div>
		</div>-->
		<footer class="pull-left footer">
			<p class="col-md-12">
				<hr class="divider">
				Copyright &COPY; 2017 <a>DABG</a>
			</p>
		</footer>
	</div>
                                
        <script>
        document.getElementById("searcht").oninput=function(){
            var matcher = new RegExp(document.getElementById("searcht").value, "gi");
            for (var i=0;i<document.getElementsByClassName("col-xs-6 col-sm-3 placeholder").length;i++) {
              if (matcher.test(document.getElementsByClassName("nombre")[i].innerHTML) || matcher.test(document.getElementsByClassName("text-muted")[i].innerHTML)) {
                document.getElementsByClassName("col-xs-6 col-sm-3 placeholder")[i].style.display="inline-block";
              } else {
                document.getElementsByClassName("col-xs-6 col-sm-3 placeholder")[i].style.display="none";
              }

            }
        }
        </script>



</body>
</html>