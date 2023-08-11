<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.database.Dao_View" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap Link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    <!-- font-family: 'Lato', sans-serif;  font-family: 'Dosis', sans-serif; font-family: 'Open Sans', sans-serif;       -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dosis:wght@300;400&family=Open+Sans:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">


    <!-- external css -->
    <!-- <link rel="stylesheet" href="css/style.css"> -->
    <link rel="stylesheet" href="css/admin.css">
    <!-- font awesome kit -->
    <script src="https://kit.fontawesome.com/f8210108fd.js" crossorigin="anonymous"></script>

<title>User Management</title>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>



	<%if (session.getAttribute("administrator")==null){
	
	response.sendRedirect("LoginPage");
	
	
	
	
	
}

else{
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	response.setDateHeader("Expires", -1);
	
}%>
  <section id="main-content">


        <div class="container-fluid">
            <div class="row min-vh-100 flex-column flex-md-row">
                <div class="col-md-2 col-lg-2 sidebar-bg side-content">



                    <nav class="navbar navbar-expand-md navbar-dark flex-md-column flex-row">

                        <div class="admin-logo text-center my-5 text-white ">

                            <img src="img/jerome.webp" alt="" class="img-fluid rounded-circle">

                            <p>Jerome Obogne
                            </p>
                            <p id="admin-text">Administrator</p>



                <%if (request.getSession().getAttribute("msg_change")!=null){ %>

                    <p>${msg_change}</p>
                    <br>


                    <%}request.getSession().removeAttribute("msg_change");  %>


              
                        </div>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>



                        <div class="collapse navbar-collapse" id="navigation">


                            <ul class="navbar-nav flex-column">
                                <li class="nav-item">
                                    <a href="Admin" class="nav-link"><i class="fa-solid fa-gauge icon"></i>Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a href="AdminView" class="nav-link"><i class="fa-solid fa-eye icon"></i>View</a>
                                </li>

                                <li class="nav-item">
                                    <a href="Approval" class="nav-link"><i class="fa-solid fa-check-to-slot icon"></i>Approval</a>
                                </li>


                                <li class="nav-item">
                                    <a href="Create_Account" class="nav-link"><i class="fa-solid fa-circle-plus icon"></i>Add</a>
                                </li>
                                <li class="nav-item dropdown dropend">
                                    <a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa-solid fa-user-plus icon"></i>Account</a>
                                    <ul class="dropdown-menu">
                                     
                                        <li>
                                            <a href="AdminChangePass" class="dropdown-item">Change Password</a>
                                        </li>
                                        <li>
                                            <a href="Controller_Logout" class="dropdown-item">Logout</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>


                <div class="col-md-10 col-lg-10 main-content">

                    <h1 class="main-title">Dashboard/Overview</h1>

                    <hr>
                    <div class="row  mt-5 ">
                        <div class="col-sm-4  col-md-4 col-lg-4 mb-5 ">


                            <div class="card ">
                                <div class="main-card">
                                    <div class="card-content">

                                        <%!int data; %>
                                            <%

                            Dao_View execution= new Dao_View();
                            data=execution.total_user(); %>

                                                <% if (data!=0){ %>


                                                    <h2 class="card-title">
                                                        <%=data %>
                                                    </h2>

                                                    <% }
                                        else {%>

                                                        <h2 class="card-title">
                                                            <%=data %>
                                                        </h2>
                                                        <%}%>

                                                            <p class="card-text">Total User</p>
                                    </div>


                                    <div class="card-image">
                                        <i class="fa-solid fa-users"></i>
                                    </div>




                                </div>
                            </div>

                        </div>

                        <div class="col-sm-4  col-md-4 col-lg-4 mb-5">
                            <div class="card ">
                                <div class="main-card">
                                    <div class="card-content">



                                        <%data= execution.total_active(); %>

                                            <% if (data!=0){ %>

                                                <h2 class="card-title">
                                                    <%=data %>
                                                </h2>

                                                <% }
                                        else {%>
                                                    <h2 class="card-title">
                                                        <%=data %>
                                                    </h2>

                                                    <%}%>

                                                        <p class="card-text">Active User</p>
                                    </div>


                                    <div class="card-image">
                                        <i class="fa-solid fa-user-check"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 col-md-4 col-lg-4 mb-5">
                            <div class="card">
                                <div class="main-card">
                                    <div class="card-content">

                                        <%int data1= execution.total_pending(); %>

                                            <% if (data1!=0){ %>

                                                <h2 class="card-title">
                                                    <%=data1 %>
                                                </h2>

                                                <% }
                                                else {%>

                                                    <h2 class="card-title">
                                                        <%=data1 %>
                                                    </h2>

                                                    <%}%>
                                                        <p class="card-text">Pending User</p>

                                    </div>


                                    <div class="card-image">
                                        <i class="fa-solid fa-user-xmark"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>



            </div>
        </div>


    </section>





</body>
</html>