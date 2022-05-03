<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
        crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/navbar.css">
<link rel="stylesheet" href="../css/global.css">

<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img style="height: 50px; width:190px" src="../images/project_logo.png"
                                              alt=""></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="container">
                <!-- <ul class="navbar-nav ml-auto"> -->

                <!-- <form action="/moviegallery" method="GET" role="form" class="d-flex">
                           <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
                           <button class="btn btn-success project-btn-primary" type="submit">Search</button>
                       </form> -->
                <ul class="navbar-nav" style="float: left">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="./home.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/moviegallery">Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/registration">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>

                </ul>
                <ul class="navbar-nav" style="float: right">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="padding-top: 20px;" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            ${pageContext.request.userPrincipal.name}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style=" left: -190px;top: 50px;">
                            <a class="dropdown-item" href="/editprofile">
                                Profile</a>
                            <a class="dropdown-item" href="./editpaymentinformation.html">Manage Payment Methods</a>
                            <a class="dropdown-item" href="./editbiilinginformation.html">Edit Billing Information</a>

                            <a class="dropdown-item" href="./signout">Logout</a>
                            <a class="dropdown-item" href="./adminMain.html">Admin Portal</a>
                        </div>
                    </li>
                </ul>
                <!-- </ul> -->
            </div>
        </div>
    </div>
</nav>
<!-- navbarending -->





<head>
    <title>Forgot Password</title>
    <link rel="stylesheet" href="../css/signupsignin.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h3 class="card-title">Forgot Password</h3>
                    <c:if test="${param.error !=null}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <form:form method="POST" modelAttribute="email">
                    <div class="form-floating mb-3">
                        <form:input type="text" class="form-control" id="email" name="email"
                               placeholder="Email" path="email" />
                        <label for="email">Enter Email</label>
                    </div>
                    <div class="d-grid">
                        <form:button class="from-control btn btn-primary btn-login project-btn-primary " type="submit">
                            Submit
                        </form:button>
                    </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>