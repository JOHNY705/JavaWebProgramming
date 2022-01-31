<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="orderDetailsContainer">
    <div id="detailsItemsContainer">
        <c:forEach var="prod" items="${orderData.productsList}">
            <div>
                <img class="detailsProductImage" src="/ComputerShop/static/resources/images/products/${prod.product.primaryImage.path}" alt="${product.productName}-image">
                <label>${prod.quantity}x ${prod.product.productName}</label>
            </div>
        </c:forEach>
    </div>
    <div id="detailsAddressContainer">
        <label class="detailsAddressLabel">Adresa primatelja:</label>
        <label id="receiverLabel" class="detailsAddressLabel">${orderData.address}</label>
        <label id="streetLabel" class="detailsAddressLabel"></label>
        <label id="cityLabel" class="detailsAddressLabel"></label>
        <label id="countryLabel" class="detailsAddressLabel"></label>
    </div>
</div>