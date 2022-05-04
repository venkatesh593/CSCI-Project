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
                            <a class="nav-link dropdown-toggle" style="padding-top: 20px;" href="#" id="navbarDropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Profile
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style=" left: -190px;top: 50px;">
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
    <!-- navbarending -->


    <div class="container" style="margin-top:80px">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card border-0 shadow rounded-3 my-5">
                    <div class="card-body p-4 p-sm-5">

                    <form:form method="POST" modelAttribute="payForm">

                        <h3 class="card-title">Payment Information</h3>

                            <div class="form-floating mb-3">
                                     <form:input type="text" class="form-control" id="cardType" name="cardType"
                                             placeholder="Card Type" path="cardType" />
                                               <label for="cardType">Card Type</label>
                                                 </div>
                                                    <div class="form-floating mb-3">
                                                      <form:input type="text" class="form-control" id="cardNumber" name="cardNumber"
                                                           placeholder="Card Number" path="cardNumber" />
                                                           <label for="cardNumber">Card Number</label>
                                                          </div>
                                                          <div class="form-floating mb-3">
                                                              <form:input type="text" class="form-control" id="expDate" name="expDate"
                                                                placeholder="Expiration Date" path="expDate" />
                                                                 <label for="expDate">Expiration Date</label>
                                                          </div>
                                                          <div class="form-floating mb-3">
                                                             <form:input type="text" class="form-control" id="cvv" name="cvv"
                                                               placeholder="cvv" path="cvv" />
                                                               <label for="cvv">CVV</label>
                                                               </div>


                            <div class="d-grid">
                                <button class="from-control" style="  background-color: #FDB44B!important;
                                border-color: black!important;
                                color: black!important;" type="submit" class="project-btn-primary">Submit
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
