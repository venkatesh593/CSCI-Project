<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!--
Template Name: Moviewp
Author: Vincenzo Piromalli (fr0zen)
Website: https://vincenzopiromalli.ml/
Contact: vincenzo.piromalli@gmail.com
Purchase: https://sellix.io/product/5f25bdc9bb871
Support: https://sellix.io/fr0zen/contact
-->
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
    <link rel="stylesheet" href="./CSS/moviegallery.css">
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
<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img
                style="height: 50px; width:190px"
                src="../images/project_logo.png"
                alt=""></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="container" style="padding-top: 10px">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page"
                           href="./home.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page"
                           href="./moviegallery">Movies</a>
                    </li>
                    <form action="/moviegallery" method="GET" role="form" class="d-flex">
                        <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-success project-btn-primary" type="submit">Search</button>
                    </form>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="./registration">Sign Up</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./login">Login</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${pageContext.request.userPrincipal.name}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="./editprofile/${pageContext.request.userPrincipal.name}">
                                    Profile</a>
                                <a class="dropdown-item" href="#">Manage Payment Methods</a>
                                <a class="dropdown-item" href="#">Edit Billing Information</a>
                                <a class="dropdown-item" href="#">Order History</a>
                                <a class="dropdown-item"
                                   href="./signout">Logout</a>
                            </div>
                        </li>
                    </ul>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="demo-page-body">
    <div class="container-fluid inherit">
        <!-- <div class="section-header">
            <h3>Take a look at InAppBI</h3>
            <div class="border-div">
            </div>
            <p>Test-drive a dashboard and experience InAppBI in action.</p>
        </div> -->
        <div class="row flex">
            <div class="col-md-12 inherit">
                <div class="video-wrapper">
                    <div  class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="../images/gallery/khiladi.PNG" />
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary" onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()" class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book Tickets
                            </button>
                        </div>
                        <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                        <h3>Captain Marvel</h3>
                    </div>
                    <div  class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="../images/gallery/Iron-Man-3-Movie-Poster-Collage.jpg" />
                        <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary" onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()" class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book Tickets
                            </button>
                        </div>
                        <h3>Black Panther</h3>
                    </div>
                    <div  class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="../images/gallery/bloodshot.jpg" />
                        <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary" onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()" class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book Tickets
                            </button>
                        </div>
                        <h3>Lion King</h3>
                    </div>
                    <div  class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg" />
                        <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary" onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()" class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book Tickets
                            </button>
                        </div>
                        <h3>Pushpa</h3>
                    </div>
                    <div  class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg" />
                        <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary" onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()" class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book Tickets
                            </button>
                        </div>
                        <h3>Avengers</h3>
                    </div>
                    <div  class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg" />
                        <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary" onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()" class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book Tickets
                            </button>
                        </div>
                        <h3>Spider Man: No way home</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>