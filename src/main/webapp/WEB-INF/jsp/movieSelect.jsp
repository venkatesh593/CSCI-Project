<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .navbar {
        background-color: deepskyblue;
    }
    .navbar-nav {
        margin-left: auto;
    }
    .navbar-dark .navbar-nav .nav-link {
        color: white!important;
        font-weight: 600;
    }
    .navbar-nav .d-flex {
        margin-left: auto;
        width: 60%;
    }
</style>


<!-- navbarending -->


<head>
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/moviegallery.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/global.css">
    <link rel="stylesheet" href="../css/manageMovies.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    <script>
        function redirectToExternal() {
            window.open('https://www.youtube.com/watch?v=0LHxvxdRnYc', '_blank')
        }
        function redirectToExtern() {
            window.location.href = '../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/selectseats.html'
        }

        function redirectToMovie(movieLink){
            window.location.href = movieLink
        }
    </script>

</head>
<body>
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
                        <a class="nav-link active" aria-current="page" href="/home">Home</a>
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
                            Testing
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style=" left: -190px;top: 50px;">
                            <a class="dropdown-item" href="/editprofile/${pageContext.request.userPrincipal.name}">
                                Profile</a>
                            <a class="dropdown-item" href="/managePayCards/${pageContext.request.userPrincipal.name}">Manage Payment Methods</a>
                            <a class="dropdown-item" href="/orderHistory/${pageContext.request.userPrincipal.name}">Order History</a>
                            <a class="dropdown-item" href="/logout">Logout</a>
                            <a class="dropdown-item" href="/admin">Admin Portal</a>
                        </div>
                    </li>
                </ul>
                <!-- </ul> -->
            </div>
        </div>
    </div>
</nav>
<div class="demo-page-body">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-4 inherit" style="padding-bottom: 50px; padding-top: 50px;">
                <h1>Manage Movies </h1>
            </div>
        </div>

        <c:if test="${param.error !=null}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <div class="row justify-content-center manage-table table-responsive">
            <div class="col-10 d-flex justify-content-center table-wrapper">
                <table class="table table-striped table-hover table-bordered text-center table-responsive">
                    <thead>
                    <tr>
                        <th scope="col">Movie Title</th>
                        <th scope="col">Add Showtime</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="movie" items="${movies}">
                        <tr>
                            <th class="align-middle" scope="row">${movie.title}</th>
                            <td class="align-middle">
                                <a href="./addShow/${movie.title}">
                                    <img src="../images/pencil.svg">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
