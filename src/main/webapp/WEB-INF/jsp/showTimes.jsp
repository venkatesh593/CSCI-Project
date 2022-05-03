<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!-- navbarstarting -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/css/moviegallery.css">
<link rel="stylesheet" href="/css/navbar.css">
<link rel="stylesheet" href="/css/global.css">



<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"><img style="height: 50px; width:190px" src="../images/project_logo.png"
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
                        <a class="nav-link dropdown-toggle" style="padding-top: 20px;" href="#" id="navbarDropdownMenuLink"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Profile
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style=" left: -190px;top: 50px;">
                            <a class="dropdown-item" href="/editprofile">
                                Profile</a>
                            <a class="dropdown-item" href="/editpaycard">Manage Payment Methods</a>
                            <a class="dropdown-item" href="/editbiilinginformation">Edit Billing Information</a>

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





<head>
    <title>Show Times</title>
    <link rel="stylesheet" href="/css/signupsignin.css">
</head>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                            <h3 class="display-4 text-center">Show times</h3><br>
                            <p class="h3 text-center">Movie: ${timesForm.title}</p>

                            <br>
                            <table class="table ">
                                <thead>
                                    <tr style="text-align: center;">
                                        <th scope="col"></th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Time</th>

                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="show" items="${timesForm.shows}">
                                    <tr style="text-align: center;">
                                        <td><button onclick="window.location.href='/selectseats/${show.show_id}'"
                                             class="btn project-btn-primary">Book Tickets
                                        </button></td>
                                        <td scope="row">${show.localDate}</td>

                                        <td>
                                            <p>${show.localTime}</p>
                                        </td>

                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <button onClick="location.href='/selectseats' " class="btn project-btn-primary"
                                type="submit" style="margin-left: 43%; margin-top: 10px;">Select Seats</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
