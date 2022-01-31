<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="custom" uri="/WEB-INF/tlds/product.tld" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            Computer Shop | Proizvodi
            <c:if test="${requestScope.reqCategory != null}">
                - ${requestScope.reqCategory}
            </c:if>
        </title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/ComputerShop/static/styles/navbar.css" type="text/css">
        <link rel="stylesheet" href="/ComputerShop/static/styles/product.css" type="text/css">
        <link rel="stylesheet" href="/ComputerShop/static/styles/productOverview.css" type="text/css">
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="/ComputerShop/static/scripts/productOverview.js"></script>
    </head>
    <body>
        <jsp:include page="../components/navbar.jsp" />
        <div id="contentContainer" class="container">
            <h2>
                <c:if test="${requestScope.reqCategory != null}">
                    ${requestScope.reqCategory}
                </c:if>
                <c:if test="${requestScope.reqCategory == null}">
                    Svi proizvodi
                </c:if>
            </h2>
            <div class="productsContainer">
                <c:forEach var="product" items="${requestScope.productsList}">
                    <div class="productContent">
                        <custom:product image="${product.primaryImage.path}" productID="${product.id}" brand="${product.brand.name}" productName="${product.productName}" />
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
