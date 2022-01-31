<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Computer Shop</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="static/styles/authentication.css" type="text/css">
        <link rel="stylesheet" href="static/styles/navbar.css" type="text/css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body>                    
        <jsp:include page="../components/navbar.jsp" />
        
        <div id="loginContainer" class="container">
            <div class="loginHeader">
                <p class="loginHeaderLabel">Prijava</p>
            </div>            
                            
            <form class="loginForm" action="prijava" method="POST" autocomplete="off">
                <div class="form-group">
                    <label>Korisničko ime:</label>
                    <input type="text" class="form-control" name="username">
                </div>
                
                <div class="form-group">
                    <label>Lozinka:</label>
                    <input type="password" class="form-control" name="password">
                </div>
                
                <c:if test="${sessionScope.loginError != null}">
                    <label class="text-danger">${requestScope.loginError}</label>
                </c:if>
                
                <button type="submit" class="btn btn-primary btnSubmit">Prijavi se</button>
            </form>

            <label class="registrationLabel text-center">Nemate još račun? <a href="registracija">Registrirajte se ovdje!</a></label>
            
        </div>
    </body>
</html>
