<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>

<head>
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
    <link rel="stylesheet" href="/css/navbar.css">
        <link rel="stylesheet" href="/css/global.css">

</head>

<body style="background: aliceblue;">
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


    <div class="container" style="margin-top:80px">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card border-0 shadow rounded-3 my-5">
                    <div class="card-body p-4 p-sm-5">

                    <form:form method="POST" modelAttribute="userForm">

                        <h3 class="card-title">Registration</h3>

                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="firstName" name="firstName"
                                    placeholder="First Name" path="firstName" />
                                <label for="firstName">First Name*</label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="lastName" name="lastName"
                                    placeholder="Last Name" path="lastName" />
                                <label for="lastName">Last Name*</label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="email" class="form-control" id="email" name="email"
                                    placeholder="Email" path="email" />
                                <label for="email">Email Address*</label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="phoneNumber" name="phoneNumber"
                                    placeholder="Phone Number" path="phoneNumber" />
                                <label for="phoneNumber">Phone Number*</label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="userName" name="userName"
                                    placeholder="User Name" path="userName" />
                                <label for="userName">User Name*</label>
                            </div>
                            <div class="form-floating mb-3">
                                <form:input type="password" class="form-control" id="password" name="password"
                                    placeholder="Password" path="password" />
                                <label for="password">Password*</label>
                            </div>

                            <h3 class="card-title">Billing Address</h3>
                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="street" name="street"
                                    placeholder="Street" path="street" />
                                <label for="street">Street</label>
                            </div>

                                <div class="form-floating mb-3">
                                        <form:input type="text" class="form-control" id="city" name="city"
                                        placeholder="City" path="city" />
                                 <label for="city">City</label>
                                </div>

                            <div class="form-floating mb-3">
                                <form:input type="text" class="form-control" id="state" name="state"
                                    placeholder="State" path="state" />
                                <label for="state">State</label>
                            </div>

                            <div class="form-floating mb-3">
                                       <form:input type="text" class="form-control" id="zipCode" name="zipCode"
                                           placeholder="Zip Code" path="zipCode" />
                                  <label for="zipCode">Zip Code</label>
                            </div>

                            <div>
                                      <form:checkbox path="wantsPromotions" value="true" label="Subscribe to Promotions"/>
                            </div>


                            <div class="d-grid">
                                <button class="from-control" style="  background-color: #FDB44B!important;
                                border-color: black!important;
                                color: black!important;" type="submit" class="project-btn-primary">Sign
                                    Up
                                </button>
                            </div>
                            </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>

</html>
