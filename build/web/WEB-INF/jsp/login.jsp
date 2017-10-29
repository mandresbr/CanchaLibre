<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="shortcut icon" type="image/x-icon" href="/images/canchalibre.png">
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
			
                        <img src="<c:url value="/images/canchalibre.png"/>" alt="CL" class="img-incs" width="70" height="50">
                        <a class="navbar-brand" href="portal.htm" onclick="location.href='${pageContext.request.contextPath}/portal.htm'">CANCHA LIBRE RESERVAS</a>
                        
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			
			
			<ul class="nav navbar-nav navbar-right">
                            
                            <form class="navbar-form navbar-right" role="search">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="user" placeholder="Correo Electrónico">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="pass" placeholder="Contraseña">
                                </div>
                                <button type="submit" class="btn btn-default">Acceder</button>
                                <a href="registro.htm" onclick="location.href='${pageContext.request.contextPath}/registro.htm'" class="btn btn-default">Registrarse</a>  
                            </form>
                            

                        </ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
</nav>
	<div class="container-fluid main-container">
		
            <div class="container">
                
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="<c:url value="/images/sintetica_1.jpg"/>" alt="Los Angeles" style="width:100%;">
                        </div>

                        <div class="item">
                            <img src="<c:url value="/images/sinteticas2.jpg"/>" alt="Chicago" style="width:100%;">
                        </div>

                        <div class="item">
                            <img src="<c:url value="/images/sinteticas3.jpg"/>" alt="New york" style="width:100%;">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
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