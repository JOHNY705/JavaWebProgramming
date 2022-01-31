<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Computer Shop</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/ComputerShop/static/styles/navbar.css" type="text/css">
        <link rel="stylesheet" href="/ComputerShop/static/styles/checkout.css" type="text/css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://www.paypal.com/sdk/js?currency=EUR&client-id=ARYe7qjPt5iASHIz3KdDo2_aomBo0mQHWbjLmNu-Iey1G-JxR0BBpChpWpLc3zCjG2337zJ2lxEeB7N1"></script>
        <script src="/ComputerShop/static/scripts/checkout.js"></script>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp" />
        <div id="contentContainer" class="container">
            <input type="hidden" id="totalCartPrice" value="${cart.totalPrice}" />
            <div id="buyerSection" class="sectionContent sectionOpen">
                <div class="checkoutSectionHeader">
                    <div class="sectionHeaderContent">
                        <i class="material-icons sectionHeaderIcon">keyboard_arrow_down</i>
                        <label class="sectionHeaderLabel">Podaci o kupcu</label>
                    </div>
                </div>
                <div class="sectionForm">
                    <form id="buyerDataForm" action="/ComputerShop/checkout?data=buyer" method="POST">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Ime</label>
                                <input type="text" class="form-control" name="firstName">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Prezime</label>
                                <input type="text" class="form-control" name="lastName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress">Adresa</label>
                            <input type="text" class="form-control" name="street">
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="inputZip">Poštanski broj</label>
                                <input type="number" class="form-control" name="zipCode">
                            </div>
                            <div class="form-group col-md-7">
                                <label for="inputCity">Mjesto</label>
                                <input type="text" class="form-control" name="city">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="inputCity">Država</label>
                                <input type="text" class="form-control" name="country" value="Hrvatska" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress">Broj telefona</label>
                            <input type="text" class="form-control" name="phoneNr">
                        </div>
                        <button type="submit" class="btnSubmit">Nastavi na plaćanje</button>
                    </form>
                </div>             
            </div>
            <div id="paymentSection" class="sectionContent sectionDisabled">
                <div class="checkoutSectionHeader">
                    <div class="sectionHeaderContent">
                        <i class="material-icons sectionHeaderIcon">keyboard_arrow_right</i>
                        <label class="sectionHeaderLabel">Plaćanje</label>
                    </div>
                </div>
                <div class="sectionForm">
                    <form id="paymentForm" action="/ComputerShop/checkout?data=payment" method="POST">
                        <div class="form-group">
                            <label for="inputAddress">Odaberite način plaćanja</label>
                            <div class="rbGroup">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio1" name="paymentMethod" class="custom-control-input" value="gotovina" checked>
                                    <label class="custom-control-label" for="customRadio1">Gotovina - plaćanje pouzećem</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio2" name="paymentMethod" class="custom-control-input" value="paypal">
                                    <label class="custom-control-label" for="customRadio2"><img src="https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png" border="0" alt="PayPal Logo"></label>
                                    <div id="paypal-button-container" class="d-none"></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="confirmContainer">
                <button type="submit" id="btnConfirmOrder" class="btnSubmit" form="paymentForm">Potvrdi narudžbu</button> 
            </div>
        </div>
    </body>
</html>
