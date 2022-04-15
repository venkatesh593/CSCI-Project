<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                            <a class="dropdown-item" href="/editprofile">
                                Profile</a>
                            <a class="dropdown-item" href="/editpaymentinformation.html">Manage Payment Methods</a>
                            <a class="dropdown-item" href="/editbiilinginformation.html">Edit Billing Information</a>

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
    <title>Edit Profile</title>
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
    <style>

        .row {
            margin-top: 5%;
        }
    </style>
    <link rel="stylesheet" href="../css/signupsignin.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/global.css">

</head>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                        <form:form method="POST" modelAttribute="payForm">
                            <h3 class="display-4 text-center">Edit Payment Card</h3>
                            <br>
                            <div class="mb-3">
                                <label for="cardType">Card Type</label><br>
                                <form:input type="text" class="form-control" id="cardType" name="cardType" value="${currentCard.cardType}"
                                    path="cardType" />
                            </div>
                            <div class="mb-3">
                                <label for="cardNumber">Card Number</label><br>
                                <form:input type="text" class="form-control" id="cardNumber" name="cardNumber" value=""
                                    path="cardNumber" />
                            </div>
                            <div class="mb-3">
                                <label for="expDate">Expiration Date</label><br>
                                <form:input type="text" class="form-control" id="expDate" name="expDate" value="${currentCard.expDate}"
                                    path="expDate" />
                            </div>
                            <div class="mb-3">
                                <label for="cvv">CVV</label><br>
                                <form:input type="text" class="form-control" id="cvv" name="cvv"  value="${currentCard.cvv}"
                                    path="cvv" />
                            </div>


                            <br>
                            <div class="d-grid">
                                <form:button class="btn btn-success btn-login project-btn-primary " type="submit">Save
                                </form:button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
