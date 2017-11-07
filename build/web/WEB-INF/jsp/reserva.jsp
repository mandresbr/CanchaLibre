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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

        <link rel='stylesheet' type='text/css'href='css/timepicki.css'/>
        <script type='text/javascript'src='js/jquery.js'></script>
        <script type='text/javascript'src='js/timepicki.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/locale/es.js"></script>
        <script src="https://github.com/jquery/jquery-ui/blob/master/ui/i18n/datepicker-es.js"></script>

        <script type="text/javascript">
            $(function () {

                var currDate = new Date();
                $("#fech").datepicker({
                    startDate: currDate,
                    format: 'yyyy-mm-dd',
                    autoclose: true,
                });
            });
        </script>


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

            <div class="wrapper">
             
                <form class="form-horizontal col-md-6 col-xs-offset-3" method="post">
                    <center><img src="${pageContext.request.contextPath}/images/canchalibre.png" alt="CL" style="width:274px;height:198px;margin: 10px;margin-bottom: 30px"></center>
                    <h3 style="text-align:center">Buscar establecimientos disponibles para reserva de canchas sintéticas en fecha y hora determinada</h3>
                    <div class="form-group ">
                        <label class="control-label col-sm-2 requiredField"  for="date">
                            Fecha:
                            <span class="asteriskField">
                                *
                            </span>
                        </label>
                        <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="glyphicon glyphicon-calendar">
                                    </i>
                                </div>
                                <input class="form-control" id="fech" name="date" required="" placeholder="AAAA-MM-DD" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label class="control-label col-sm-2 requiredField" for="timeF">
                            Hora:
                            <span class="asteriskField">
                                *
                            </span>
                        </label>
                        <div class="col-sm-10">
                            <select class="select form-control" id="time" required="" name="time" onfocus="horas()">
                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="fecha" value=${cedula}  ><br>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-2">
                            <button class="btn btn-lg btn-primary btn-block" name="submit" type="submit">
                                Buscar
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <footer class="pull-left footer">
                <p class="col-md-12">
                <hr class="divider">
                Copyright &COPY; 2017 <a>DABG</a>
                </p>
            </footer>
        </div>

<script>
    function horas() {
        var x = document.getElementById("fech").value;
        var hoy= new Date();
        var fecha= hoy.toISOString().slice(0,10);
        if (x==fecha){
            n=hoy.getHours();
            n=n+1;
            var hora = document.getElementById("time");
            for(var i = hora.options.length - 1 ; i >= 0 ; i--){
                hora.remove(i);
            }
            if (n>=12){
                for(var j=n;j<23;j++){
                    var option = document.createElement("option");
                    option.value = j-12+":00 pm" ;
                    option.innerHTML=j-12+":00 pm";
                    hora.appendChild(option);
                } 
            }
        }
        else{
            var hora = document.getElementById("time");
            for(var i = hora.options.length - 1 ; i >= 0 ; i--){
                hora.remove(i);
            }
            for(var j=8;j<23;j++){
                if(j<=12){
                    var option = document.createElement("option");
                    option.value = j+":00 am" ;
                    option.innerHTML=j+":00 am";
                    hora.appendChild(option);
                }
                else{
                    var option = document.createElement("option");
                    option.value = j-12+":00 pm" ;
                    option.innerHTML=j-12+":00 pm";
                    hora.appendChild(option);
                }
            }
        }

        }
</script>



    </body>
</html>





