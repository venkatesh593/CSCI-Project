<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="/css/home.css">
    <link rel="stylesheet" href="/css/moviegallery.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/manageMovies.css">
    <link rel="stylesheet" href="/css/signupsignin.css">
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
<body style="background: aliceblue">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img style="height: 50px; width:190px" src="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/images/project_logo.png"
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
                        <a class="nav-link active" aria-current="page" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/moviegallery">Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/signup">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/signin">Login</a>
                    </li>

                </ul>
                <ul class="navbar-nav" style="float: right">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="padding-top: 20px;" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            Testing
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style=" left: -190px;top: 50px;">
                            <a class="dropdown-item" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/editprofile">
                                Profile</a>
                            <a class="dropdown-item" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/editpaycard">Manage Payment Methods</a>
                            <a class="dropdown-item" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/editbiilinginformation">Edit Billing Information</a>
                            <a class="dropdown-item" href="#">Order History</a>
                            <a class="dropdown-item" href="./signout">Logout</a>
                            <a class="dropdown-item" href="../../../../../../../Downloads/CSCI-Project-SeDeliverable1/CSCI-Project-SeDeliverable1/html/admin">Admin Portal</a>
                        </div>
                    </li>
                </ul>
                <!-- </ul> -->
            </div>
        </div>
    </div>
</nav>
<div class="container" style="margin-top:80px">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h3 class="card-title">Add Show Date and Time</h3>
                    <form:form method="POST" modelAttribute="showForm">

                        <div class="form-floating mb-3">
                            <form:input type="date" class="form-control" id="localDate" name="localDate"
                                        placeholder="Local Date" path="localDate"/>
                            <label for="localDate">Show Date</label>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="time" step="300" class="form-control" id="localTime" name="localTime"
                                        placeholder="Local Time" path="localTime"/>
                            <label for="localTime">Show Time</label>
                        </div>

                        <div class="d-grid">
                            <button class="btn btn-primary project-btn-primary" type="submit">
                                Confirm
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
