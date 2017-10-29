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

                    <img src="<c:url value="/images/canchalibre.png"/>" alt="CL" class="img-incs" width="70" height="50">
                    <a class="navbar-brand" href="portal.htm" onclick="location.href = '${pageContext.request.contextPath}/portal.htm'">CANCHA LIBRE RESERVAS</a>

                </div>

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
                                <div style="margin-bottom:20px"class="name"><strong>${name}</strong></div>
                                <div style="margin-bottom:20px"class="info">

                                    <span><i class=""></i> ${dir}. <br> Cali. <br>Colombia.<br></span>

                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12 col-md-8 col-lg-9">
                        <h2 class="boxTitle">${name}</h2>
                        <!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
                        <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> 

                        <!--Font Awesome (added because you use icons in your prepend/append)-->
                        <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

                        <!-- Inline CSS based on choices in "Settings" tab -->
                        <style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>

                        <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                        <div class="bootstrap-iso">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-8 col-sm-6 col-xs-12">
                                        <form class="form-horizontal" method="post">
                                            <div class="form-group ">
                                                <label class="control-label col-sm-2 requiredField" for="date">
                                                    Fecha de Reserva
                                                    <span class="asteriskField">
                                                        *
                                                    </span>
                                                </label>
                                                <div class="col-sm-10">
                                                    <div class="input-group">
                                                        <div class="input-group-addon">
                                                            <i class="fa fa-calendar">
                                                            </i>
                                                        </div>
                                                        <input class="form-control" value="${date}" onchange="myFunction();location.href='${pageContext.request.contextPath}/consulta.htm?date=${date}'" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group" id="horadiv" style="display:none">
                                                <label class="control-label col-sm-2 requiredField" for="time" >
                                                    Hora de Reserva
                                                    <span class="asteriskField">
                                                        *
                                                    </span>
                                                </label>
                                                <div class="col-sm-10">
                                                    
                                                        <select class="select form-control" id="time" name="time">
                                                            <c:forEach items="${listaHoras}" var="lista">
                                                                <option value="${lista.hora}">
                                                                    hora
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label col-sm-2 requiredField" for="email">
                                                    Correo
                                                    <span class="asteriskField">
                                                        *
                                                    </span>
                                                </label>
                                                <div class="col-sm-10">
                                                    <input class="form-control" id="email" name="email" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label col-sm-2 requiredField" for="cedula">
                                                    Cédula
                                                    <span class="asteriskField">
                                                        *
                                                    </span>
                                                </label>
                                                <div class="col-sm-10">
                                                    <input class="form-control" id="cedula" name="cedula" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label class="control-label col-sm-2 " for="comentarios">
                                                    Comentarios

                                                </label>
                                                <div class="col-sm-10">
                                                    <textarea class="form-control" id="comentarios" name="comentarios"></textarea>
                                                </div>
                                            </div>
                                          
                                            <div class="form-group">
                                                <div class="col-sm-10 col-sm-offset-2">
                                                    <button class="btn btn-primary " name="submit" type="submit">   
                                                        Consultar Horarios
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Extra JavaScript/CSS added manually in "Settings" tab -->
                        <!-- Include jQuery -->
                        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

                        <!-- Include Date Range Picker -->
                        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
                        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

                        <script>
                        $(document).ready(function () {
                            var date_input = $('input[name="date"]'); //our date input has the name "date"
                            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                            date_input.datepicker({
                                format: 'mm/dd/yyyy',
                                container: container,
                                todayHighlight: true,
                                autoclose: true,
                            })
                        })

                        function myFunction() {
                            
                            var x = document.getElementById("horadiv");
                            x.style.display = "block";
                            
                        }
                        </script>


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





