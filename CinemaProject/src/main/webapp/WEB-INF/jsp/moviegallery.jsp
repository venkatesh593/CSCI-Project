<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<head>
    <link rel="stylesheet" href="/css/moviegallery.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/global.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

    <script>
        function redirectToExternal() {
            window.open('https://www.youtube.com/watch?v=0LHxvxdRnYc', '_blank')
        }
        function redirectToExtern() {
            window.location.href = './showtimes.html'
        }
    </script>

</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img style="height: 50px; width:190px" src="/images/project_logo.png"
                                              alt=""></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
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
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${pageContext.request.userPrincipal.name}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="./editprofile.html">
                                Profile</a>
                            <a class="dropdown-item" href="./editpaymentinformation.html">Manage Payment Methods</a>
                            <a class="dropdown-item" href="./editbiilinginformation.html">Edit Billing Information</a>

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
    <div class="container-fluid inherit">
        <form class="searchbar" action="/moviegallery" method="GET" role="form" class="d-flex">
            <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-success project-btn-primary" type="submit">Search</button>
        </form>
        <div class="row flex">
            <div class="col-md-12 inherit">
                <div class="video-wrapper">
                    <div class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="/images/gallery/khiladi.PNG" />
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                    onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()"
                                    class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                Tickets
                            </button>
                        </div>
                        <h3>Captain Marvel</h3>
                    </div>
                    <div class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="/images/gallery/Iron-Man-3-Movie-Poster-Collage.jpg" />
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                    onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()"
                                    class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                Tickets
                            </button>
                        </div>
                        <h3>Black Panther</h3>
                    </div>
                    <div class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th" src="/images/gallery/bloodshot.jpg" />
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                    onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()"
                                    class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                Tickets
                            </button>
                        </div>
                        <h3>Lion King</h3>
                    </div>
                    <div class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th"
                             src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg" />
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                    onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()"
                                    class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                Tickets
                            </button>
                        </div>
                        <h3>Pushpa</h3>
                    </div>
                    <div class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th"
                             src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg" />
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                    onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()"
                                    class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                Tickets
                            </button>
                        </div>
                        <h3>Avengers</h3>
                    </div>
                    <div class="thumbnail-image">
                        <div class="overlay-video"></div>
                        <img class="image-th"
                             src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg" />
                        <div class="image-hover">
                            <button class="btn btn-primary btn-login fw-bold project-btn-primary"
                                    onclick="redirectToExternal()" type="submit">Watch Trailer
                            </button>
                            <button onclick="redirectToExtern()"
                                    class="btn btn-primary btn-login fw-bold project-btn-primary" type="submit">Book
                                Tickets
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