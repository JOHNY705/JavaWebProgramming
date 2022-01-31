<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Computer Shop</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/ComputerShop/static/styles/navbar.css" type="text/css">
        <link rel="stylesheet" href="/ComputerShop/static/styles/cart.css" type="text/css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="/ComputerShop/static/scripts/cart.js"></script>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp" />
        <div id="contentContainer" class="container">
            <h1>Moja košarica</h1>
            <div class="tableContainer">
                <table class="table">
                    <thead class="productTableHead">
                        <tr>
                            <th scope="col">Proizvod</th>
                            <th scope="col">Cijena</th>
                            <th scope="col">Količina</th>
                            <th scope="col">Ukupno</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${requestScope.cartProducts}">
                            <tr>
                                <td>
                                    <img class="tdItemImage" src="/ComputerShop/static/resources/images/products/${item.product.primaryImage.path}" alt="${item.product.productName}-image">
                                    <div class="tdItemName">
                                        <input class="tdItemID" type="hidden" value="${item.product.id}" />
                                        <label>${item.product.brand.name}</label>
                                        <br />
                                        <label>${item.product.productName}</label>
                                    </div>
                                </td>
                                <td class="tdItemPrice">${item.product.price} kn</td>
                                <td class="tdItemQty">
                                    <div class="qtyAction buttonDecr">
                                        <i class="material-icons qtyIcon">remove</i>
                                    </div>
                                    <input type="number" class="productQty" name="productQty" onkeypress='return event.charCode >= 48 && event.charCode <= 57' value="${item.quantity}" min="0" disabled />
                                    <div class="qtyAction buttonIncr">
                                        <i class="material-icons qtyIcon">add</i>
                                    </div>
                                </td>
                                <td class="tdItemTotalPrice">${item.totalPrice} kn</td>
                                <td class="tdIcons">
                                    <i class="material-icons removeIcon">clear</i>
                                </td>
                            </tr>
                        </c:forEach>
                    <div class="d-none justify-content-center">
                        <div class="spinner-border spinnerStyle" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                    </tbody>
                </table>
                <div class="totalPriceContainer">
                    <label>Ukupno: </label>
                    <label class="totalPriceLabel">${cart.totalPrice} kn</label>
                </div>
                <div class="cartActionContainer">
                    <button class="btnClearCart">Isprazni košaricu</button>
                    <button class="btnBuy">Nastavite za plaćanje</button>
                </div>
            </div>
            <div class="cartEmptyContainer">
                <label class="lblEmpty">Trenutno nemate niti jedan proizdod u košarici!</label>
            </div>
        </div>
    </body>
</html>
