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
    <link href="../css/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/global.css">

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
                            <a class="nav-link active" aria-current="page" href="./home.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./moviegallery.html">Movies</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./signup.html">Sign Up</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./signin.html">Login</a>
                        </li>

                    </ul>
                    <ul class="navbar-nav" style="float: right">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Profile
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="./editprofile.html">
                                    Profile</a>
                                <a class="dropdown-item" href="./editpaymentinformation.html">Manage Payment Methods</a>
                                <a class="dropdown-item" href="./editbiilinginformation.html">Edit Billing Information</a>

                                <a class="dropdown-item" href="./signin.html">Logout</a>
                                <a class="dropdown-item" href="./adminMain.html">Admin Portal</a>
                            </div>
                        </li>
                    </ul>
                    <!-- </ul> -->
                </div>
            </div>
        </div>
    </nav>
    <!-- navbarending -->


    <div class="jumbotron text-center" style="margin-top: 150px;">
        <h1 class="display-3">Thank you for signing up</h1>
        <h3 class="display-6" style="margin-top: 1%;">A confirmation email has been sent for your account
            verification.</h3>
        <h3>Please Enter Your Verification Code</h3>
        <form:form method="POST" modelAttribute="regconf">
        <div class="form-floating mb-3">
               <form:input type="text" class="form-control" id="verCode" name="verCode"
               path="verCode" placeholder="Verification Code" />
               <label for="verCode">Verification Code</label>
        </div>
        <div class="d-grid">
             <form:button class="from-control" type="submit">Submit
             </form:button>

        </div>
        </form:form>
    </div>
</body>

</html>
