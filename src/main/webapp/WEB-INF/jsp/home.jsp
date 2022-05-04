<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/css/home.css">
<link rel="stylesheet" href="/css/moviegallery.css">
<link rel="stylesheet" href="/css/navbar.css">
<link rel="stylesheet" href="/css/global.css">


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

</head>
<script>
    function redirectToExternal() {
        window.open('https://www.youtube.com/watch?v=0LHxvxdRnYc', '_blank')
    }
    function redirectToExtern() {
        window.location.href = '/showtimes'
    }
</script>
<body>
    <div>
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
                                <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                    Profile
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style=" left: -190px;top: 50px;">
                                    <a class="dropdown-item" href="/editprofile">
                                        Profile</a>
                                    <a class="dropdown-item" href="/managePayCards/${pageContext.request.userPrincipal.name}">Manage Payment Methods</a>
                                    <a class="dropdown-item" href="/editbiilinginformation">Edit Billing Information</a>

                                    <a class="dropdown-item" href="/login">Logout</a>
                                    <a class="dropdown-item" href="/admin">Admin Portal</a>
                                </div>
                            </li>
                        </ul>
                        <!-- </ul> -->
                    </div>
                </div>
            </div>
        </nav>
        <div class="carousel-wrapper">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100"
                            src="https://c4.wallpaperflare.com/wallpaper/1017/837/203/movie-time-wallpaper-preview.jpg"
                            alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>My Caption Title (1st Image)</h5>
                            <p>The whole caption will only show up if the screen is at least medium size.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://wallpaper.dog/large/5486432.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://vistapointe.net/images/movie-theater-wallpaper-4.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="demo-page-body">
            <h2 style="padding-left: 35px">Currently Running Movies</h2>
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

                        <c:forEach var="movie" items="${playingMovies}">

                            <div class="thumbnail-image">
                                <div class="overlay-video"></div>
                                <img class="image-th" src="../images/gallery/${movie.trailerPicture}" />
                                <div class="image-hover">
                                <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                      onclick="window.location.href='/movieinfo/${movie.title}'" type="submit">Movie Info
                                </button>
                                    <button type="button" class="project-btn-primary btn btn-primary" data-toggle="modal" data-target="#${movie.movie_id}Modal">
                                        Watch Trailer
                                    </button>
                                    <button onclick="window.location.href='/showTimes/${movie.title}'"
                                        class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                        Tickets
                                    </button>
                                </div>
                                <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                                <h3>${movie.title}</h3>
                                <h3>${movie.filmRating}</h3>
                            </div>

                            </c:forEach>


                        </div>
                    </div>
                </div>
            </div>
            <div>
                <h2 style="padding-left: 35px">Upcoming Movies</h2>
                <div class="container-fluid inherit">
                    <div class="row flex">
                        <div class="col-md-12 inherit">
                            <div class="video-wrapper">
                                <c:forEach var="movie" items="${upcomingMovies}">

                                    <div class="thumbnail-image">
                                          <div class="overlay-video"></div>
                                              <img class="image-th" src="../images/gallery/${movie.trailerPicture}" />
                                                  <div class="image-hover">
                                                  <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                                       onclick="window.location.href='/movieinfo/${movie.title}'" type="submit">Movie Info
                                                  </button>
                                                      <button type="button" class="project-btn-primary btn btn-primary" data-toggle="modal" data-target="#${movie.movie_id}Modal">
                                                          Watch Trailer
                                                      </button>
                                                  <button onclick="window.location.href='/showTimes/${movie.title}'"
                                                     class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                                      Tickets
                                                  </button>
                                           </div>
                                             <!-- <img class="image-hover" src="./assets/img/Play icon.svg" /> -->
                                        <h3>${movie.title}</h3>
                                        <h3>${movie.filmRating}</h3>
                                    </div>

                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

<c:forEach var="movie" items="${playingMovies}">
    <div class="modal fade" id="${movie.movie_id}Modal" tabindex="-1" role="dialog" aria-labelledby="${movie.movie_id}ModalTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times</span>
                    </button>
                    <!-- 16:9 aspect ratio -->
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="${movie.trailerVideo}"  allowscriptaccess="always" allow="autoplay"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<c:forEach var="movie" items="${upcomingMovies}">
    <div class="modal fade" id="${movie.movie_id}Modal" tabindex="-1" role="dialog" aria-labelledby="${movie.movie_id}ModalTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times</span>
                    </button>
                    <!-- 16:9 aspect ratio -->
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="${movie.trailerVideo}"  allowscriptaccess="always" allow="autoplay"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>