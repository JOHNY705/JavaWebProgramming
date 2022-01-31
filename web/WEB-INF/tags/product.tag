<%@tag description="shop product" pageEncoding="UTF-8"%>

<%@attribute name="image" required="true"%>
<%@attribute name="brand" required="true"%>
<%@attribute name="productID" required="true"%>
<%@attribute name="productName" required="true"%>

<div class="productContainer" data-id="${productID}">
    <div class="ratioHolder"></div>
    <div class="productElement">
        <img class="productImage" src="/ComputerShop/static/resources/images/products/${image}" alt="${productName}-image">

        <div class="d-flex justify-content-center align-items-center productText">
            <label class="brandLabel">${brand}</label> 
        </div>

        <div class="d-flex justify-content-center align-items-center productText">
            <label>${productName}</label>
        </div>
        
    </div>
</div>