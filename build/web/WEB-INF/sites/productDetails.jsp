<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Computer Shop | ${requestScope.product.brand.name} ${requestScope.product.productName}</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/ComputerShop/static/styles/navbar.css" type="text/css">
        <link rel="stylesheet" href="/ComputerShop/static/styles/productDetails.css" type="text/css">
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="/ComputerShop/static/scripts/productDetails.js"></script>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp" />
        <div id="contentContainer" class="container productDetailsContainer">
            <div class="row imageContainer">
                <img class="productImage col-6" src="/ComputerShop/static/resources/images/products/${product.primaryImage.path}" alt="${product.productName}-image"> 
                <div class="col-6">
                    <label id="productBrandLabel" class="productLabel">${requestScope.product.brand.name}</label>
                    <label class="productLabel">${requestScope.product.productName}</label>
                    <label class="productLabel">${requestScope.product.price} kn</label>
                    <form action="/ComputerShop/product/${requestScope.product.id}" id="addToCartForm" method="POST">
                        <input type="hidden" name="productID" value="${requestScope.product.id}" />
                        <input type="hidden" name="productPrice" value="${requestScope.product.price}" />
                        <div id="buttonDecr" class="qtyAction qtyActionDisabled">
                            <i class="material-icons qtyIcon">remove</i>
                        </div>
                        <input type="number" id="productQty" name="productQty" onkeypress='return event.charCode >= 48 && event.charCode <= 57' value="1" min="1" />
                        <div id="buttonIncr" class="qtyAction">
                            <i class="material-icons qtyIcon">add</i>
                        </div>
                        <input type="submit" id="btnSubmit" value="Dodaj u košaricu" />
                    </form>
                    <div class="addMessage hidden">
                        <i class="material-icons closeIcon">clear</i>
                        <div class="addMessageText">
                            <label>Proizvod je uspješno dodan u košaricu!</label>
                            <br />
                            <a href="/ComputerShop/cart" class="cartLink">Pregledaj košaricu</a>
                        </div>
                        
                    </div>
                    <div>
                        <label id="productDescriptionLabel">Opis proizvoda:</label>
                        <p>${requestScope.product.productDescription}</p>
                        <p id="respInfo"></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
