<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    function redirectToNextPage() {
        window.location.href = "/ordersummary"
    }
</script>
<link href="/css/orderconfirmation.css" rel="stylesheet">
<link href="/css/navbar.css" rel="stylesheet">
<link rel="stylesheet" href="/css/global.css">


<body>
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
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                Profile
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

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
    <!-- navbarending -->
    <div style="margin-top: 200px">
        <div style="color: black; ;text-align: center;">
            <h1 style="color: rgb(40, 175, 228)">Thank You Have A Nice Day!</h1>
            <h2 style="color: green">Your Booking Is Confirmed</h3>
            </h2>
        </div>
        <div class="cardWrap">
            <div class="card cardLeft">
                <h1>Startup <span>Cinema</span></h1>
                <div class="title">
                    <h2>${order.show.movie.title}</h2>
                    <span>movie</span>
                </div>
                <div class="name">
                    <h2>${order.user.firstName} ${order.user.lastName}</h2>
                    <span>name</span>
                </div>
                <div class="seat">
                    <h2><c:forEach items="${order.tickets}" var="ticket" varStatus="loop">
                        ${ticket.seat.getRowNum()}${ticket.seat.getColNum()}
                        <c:if test="${!loop.last}">, </c:if>
                    </c:forEach></h2>
                    <span>seat</span>
                </div>
                <div class="time">
                    <h2>${order.show.localDate} at ${order.show.localTime}</h2>
                    <span>time</span>
                </div>

            </div>
            <div class="card cardRight">
                <div class="eye"></div>
                <div class="number">
                    <p><c:forEach items="${order.tickets}" var="ticket" varStatus="loop">
                        ${ticket.seat.getRowNum()}${ticket.seat.getColNum()}
                        <c:if test="${!loop.last}">, </c:if>
                    </c:forEach></p>
                    <span>seat</span>
                </div>
                <div class="barcode"></div>
            </div>

        </div>
    </div>

</body>
