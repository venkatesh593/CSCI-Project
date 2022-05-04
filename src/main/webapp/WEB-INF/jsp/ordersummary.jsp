<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link href="../css/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/global.css">

    <title>Your Order</title>
</head>

<body>
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
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Profile
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="/editprofile/${pageContext.request.userPrincipal.name}">
                                    Profile</a>
                                <a class="dropdown-item" href="/managePayCards/${pageContext.request.userPrincipal.name}">Manage Payment Methods</a>
                                <a class="dropdown-item" href="/orderHistory/${pageContext.request.userPrincipal.name}">Edit Billing Information</a>

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



    <section class="pt-5 pb-5 text-black" style="margin-top: 80px;">
        <div class="container">
            <div class="row w-100 shadow-lg p-3 mb-5 bg-white rounded">
                <div class="col-lg-12 col-md-12 col-12">
                    <h3 class="display-5 mb-2 text-center">Your Order</h3>
                    <br>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Movie</th>
                                <th scope="col">Seats</th>
                                <th scope="col">Hall</th>
                                <th scope="col">Adult ($12.98)</th>
                                <th scope="col">Child ($6.95)</th>
                                <th scope="col">Add Promotion Code</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <form:form modelAttribute="orderForm" method="POST">
                                <form:hidden path="customerUserName" value="${pageContext.request.userPrincipal.name}"></form:hidden>
                            <tr>
                                <!-- <th scope="row">1</th> -->
                                <td>${order.show.movie.title}</td>
                                <td><c:forEach items="${order.tickets}" var="ticket" varStatus="loop">
                                    ${ticket.seat.getRowNum()}${ticket.seat.getColNum()}
                                    <c:if test="${!loop.last}">, </c:if>
                                </c:forEach></td>
                                <td>Almos</td>
                                <td data-th="Quantity" style="width: 15%">
                                    <label>
                                        <form:input path="adults" type="number" class="form-control form-control-md text-center"
                                                    value="${order.getAdultTickets()}"></form:input>
                                    </label>
                                </td>
                                <td data-th="Quantity" style="width: 15%">
                                    <label>
                                        <form:input path="children" type="number" class="form-control form-control-md text-center"
                                                    value="${order.getChildTickets()}"></form:input>
                                    </label>
                                </td>
                                <td data-th="Quantity" style="width: 15%">
                                    <label>
                                        <form:input path="promoCode" type="text" class="form-control form-control-md text-center" value=""></form:input>
                                    </label>
                                </td>
                                <td class="actions" data-th="">
                                    <div class="text-right">
                                        <button class="btn btn-white border-secondary bg-white btn-lg mb-2">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <h4 style="text-align: right;">Total: $12.99</h4>
                <br>
                <br>
                <div>
                    <button type="button" onclick="location.href = './moviegallery.html';"
                        class="btn btn-success mb-4 btn-lg pl-5 pr-5 float-start project-btn-secondary">Previous
                    </button>
                    <form:button type="submit"
                        class="btn btn-primary mb-4 btn-lg pl-5 pr-5 float-end project-btn-primary">Checkout
                    </form:button>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</body>
