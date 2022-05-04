<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Adapted from https://bbbootstrap.com/snippets/bootstrap-payment-form-floating-labels-and-order-details-59901544 -->

<head>

    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/navbar.css">
        <link rel="stylesheet" href="../css/global.css">

    <style>
        body {
            background: #eee linear-gradient(to bottom, #F8F4FF 0%, #E9E5F0 100%)
        }

        .container {
            /* height: 100vh */
        }

        .card {
            border: none
        }

        .form-control {
            border-bottom: 2px solid #eee !important;
            border: none;
            font-weight: 600
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #8bbafe;
            outline: 0;
            box-shadow: none;
            border-radius: 0;
            border-bottom: 2px solid blue !important
        }

        .input {
            position: relative;
            margin-bottom: 20px;
            width: 100%
        }

        .input span {
            position: absolute;
            top: 7px;
            left: 11px;
            transition: 0.5s
        }

        .input i {
            position: absolute;
            top: 13px;
            right: 8px;
            transition: 0.5s;
            color: #3F51B5
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0
        }

        .input input:focus~span {
            transform: translateX(-0px) translateY(-15px);
            font-size: 12px
        }

        .input input:valid~span {
            transform: translateX(-0px) translateY(-15px);
            font-size: 12px
        }
    </style>
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




    <div class="container mt-5 px-5" style="margin-top: 115px!important;">
        <div class="mb-4">
            <h2>Checkout</h2>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="card p-3">
                    <table class="table ">
                        <thead>
                        <tr style="text-align: center;">
                            <th scope="col"></th>
                            <th scope="col">Exp/Date</th>
                            <th scope="col">Card Type</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="paycard" items="${order.user.payCards}">
                            <tr style="text-align: center;">
                                <td><button onclick="window.location.href='/orderconfirmation/${order.order_id}/${paycard.payCard_id}'"
                                            class="btn project-btn-primary">Use This Card
                                </button></td>
                                <td scope="row">${paycard.expDate}</td>

                                <td>
                                    <p>${paycard.cardType}</p>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <form:form modelAttribute="payCardForm" method="POST">
                        <div class="mt-4 mb-4">
                            <h6 class="text-uppercase">Add New Payment Info</h6>
                            <div class="input mt-3">
                                <form:input type="text" class="form-control"
                                            path="cardType" required="required"></form:input>
                                <span>*Card Type</span></div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input mt-3 mr-2">
                                        <form:input type="text" class="form-control"
                                                    required="required" path="cardNumber"></form:input>
                                        <i class="fa fa-credit-card"></i> <span>*Card Number</span></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex flex-row">
                                        <div class="input mt-3 mr-2">
                                            <form:input type="text" class="form-control"
                                                        required="required" path="expDate"></form:input>
                                            <span>*Expiration</span>
                                        </div>
                                        <div class="input mt-3 mr-2">
                                            <form:input type="text" class="form-control"
                                                        required="required" path="cvv"></form:input>
                                            <span>*CVV</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4 mb-4 d-flex justify-content-between">
                            <button class="btn btn-success px-3 project-btn-secondary" onclick="location.href = '/ordersummary';"
                                type="button">Previous
                            </button>
                            <form:button class="btn btn-success px-3 project-btn-primary"
                                type="submit">Submit Order
                            </form:button>
                        </div>
                    </form:form>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-blue p-3 text-black mb-3">
                    <p>Your order</p>
                        <h4>Movie: ${order.show.movie.title}</h4>
                        <h5>Ticket type: </h5>
                        <h6>Adults: ${order.adults}</h6>
                        <h6>Children: ${order.children}</h6>
                        <h5>Seats:
                            <c:forEach items="${order.tickets}" var="ticket" varStatus="loop">
                                ${ticket.seat.getRowNum()}${ticket.seat.getColNum()}
                                <c:if test="${!loop.last}">, </c:if>
                            </c:forEach></td></h5>
                        <h5>${order.show.localDate} at ${order.show.localTime}</h5>
                </div>
            </div>
        </div>
    </div>
</body>
