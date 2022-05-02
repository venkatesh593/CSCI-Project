<!-- Adapted from https://codepen.io/shaikmaqsood/pen/RowwzV -->

<!-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- navbarstarting -->
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
<link href="../css/selectseats.css" rel="stylesheet">
<link href="../css/navbar.css" rel="stylesheet">
<link rel="stylesheet" href="../css/global.css">

<script>// Select all the required DOM elements
    const container = document.querySelector(".container");
    const seats = document.querySelectorAll(".row .seat:not(.occupied)");
    let count = document.getElementById("count");
    let total = document.getElementById("total");

    populateUI();
    let ticketPrice = 12;



    // Populate UI
    function populateUI() {
        // getting stored index of selected seats from local storage

        if (selectedSeats !== null && selectedSeats.length > 0) {
            // looping through list of seats
            seats.forEach((seat, index) => {
                // indexOf() returns index of given value
                // here we are checking if selectedSeats contains the seat from seats
                // if yes than add class of selected
                if (selectedSeats.indexOf(index) > -1) {
                    seat.classList.add("selected");
                }
            });
        }
        // Event Listener
        container.addEventListener("click", (e) => {
            if (
                e.target.classList.contains("seat") &&
                !e.target.classList.contains("occupied")
            ) {
                e.target.classList.toggle("selected");


            }
        });

        // update count and total happens only on event change
        // we need to trigger the updateCountAndTotal()

    }
    function redirectToNextPage() {
        window.location.href = "./ordersummary.html"
    }
</script>

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
                            <a class="dropdown-item" href="./editpaymentinformation.html">Manage Payment Methods</a>
                            <a class="dropdown-item" href="./editbiilinginformation.html">Edit Billing Information</a>
                           
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

<html>

<head>
    <title>Select Seats</title>
    <!-- <script>
        function updateTextArea() {
            $(".seatStructure *").prop("disabled", true);
            const allNameVals = [];
            const allNumberVals = [];
            const allSeatsVals = [];

            allNameVals.push($("#Username").val());
            allNumberVals.push($("#Numseats").val());
            $('#seatsBlock :checked').each(function () {
                allSeatsVals.push($(this).val());
            });

            $('#nameDisplay').val(allNameVals);
            $('#NumberDisplay').val(allNumberVals);
            $('#seatsDisplay').val(allSeatsVals);
            document.getElementById("seats").value = allSeatsVals;

        }

        function myFunction() {
            alert($("input:checked").length);
        }
    </script> -->
</head>

<body style="background: aliceblue;margin-top: 30px; overflow: hidden;">

        <div class="movie-container" style="background: black;padding: 60px">
            <h2>Please Select Seats</h2>
            <ul class="showcase">
                <li>
                    <div class="seat"></div>
                    <small>Available</small>
                </li>
                <li>
                    <div class="seat selected"></div>
                    <small>Selected</small>
                </li>
                <li>
                    <div class="seat occupied"></div>
                    <small>Occupied</small>
                </li>
            </ul>

            <div class="container">
                <div class="screen"></div>

                    <c:forEach varStatus="rows" begin="0" end="${bookingForm.getShowroom().numRows - 1}" >
                        <div class="row">
                            <c:forEach varStatus="cols" begin="0" end="${bookingForm.getShowroom().numCols - 1}">
                                <div class="seat" id="${bookingForm.getShowroom().numRows}"></div>
                            </c:forEach>
                        </div>
                    </c:forEach>
            </div>
        </div>
            <!-- <script src="script.js"></script> -->
            <script src="script.js"></script>
    </body>

    <br /><br />

    <div class="displayerBoxes">
        <center>
            <form:form method="post" modelAttribute="bookingForm">
                <!-- <label for="seats">Seats: </label><br> -->
                <input class="btn btn-primary project-btn-primary" onclick="redirectToNextPage()" type="submit" value="Continue">
            </form:form>
        </center>
    </div>
</body>

</html>
