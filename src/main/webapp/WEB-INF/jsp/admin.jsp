<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/moviegallery.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/global.css">
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
            window.location.href = './selectseats.html'
        }
    </script>

</head>
<body style="background: aliceblue">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img style="height: 50px; width:190px" src="/images/project_logo.png"
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
                        <a class="nav-link active" aria-current="page" href="./admin">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="./moviegallery">Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./registration">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./login">Login</a>
                    </li>

                </ul>
                <ul class="navbar-nav" style="float: right">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            ${pageContext.request.userPrincipal.name}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="./editprofile">
                                Profile</a>
                            <a class="dropdown-item" href="./editpaymentinformation.html">Manage Payment Methods</a>
                            <a class="dropdown-item" href="./editbiilinginformation.html">Edit Billing Information</a>
                            <a class="dropdown-item" href="#">Order History</a>
                            <a class="dropdown-item" href="./logout">Logout</a>
                            <a class="dropdown-item" href="./admin">Admin Portal</a>
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
        <div class="row justify-content-center"
        <div class="col-4 inherit" style="padding-bottom: 50px; padding-top:50px">
            <h1>Admin Portal</h1>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-4 d-flex justify-content-center">
            <div class="card text-center shadow rounded-3" style="width: 18rem;">
                <img src="/images/ManageMovies.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <a href="./manageMovies.html" class="btn btn-primary project-btn-primary"  >Manage Movies</a>
                    <p class="card-text" >Here you are able to manage the information regarding a specific movie.</p>
                </div>
            </div>
        </div>
        <div class="col-4 d-flex justify-content-center">
            <div class="card text-center shadow rounded-3" style="width: 18rem;">
                <img src="/images/ManageShowtimes.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <a href="./manageShowings.html" class="btn btn-primary project-btn-primary"  >Manage Showtimes</a>
                    <p class="card-text" >Here you are able to manage the showtimes and which theater that a movie is playing in.</p>
                </div>
            </div>
        </div>
        <div class="col-4 d-flex justify-content-center">
            <div class="card text-center shadow rounded-3" style="width: 18rem;">
                <img src="/images/ManagePromotions.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <a href="./managePromotions.html" class="btn btn-primary project-btn-primary">Manage Promotions</a>
                    <p class="card-text" >Here you can add and update promotions to apply to the ticket checkout process. </p>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>