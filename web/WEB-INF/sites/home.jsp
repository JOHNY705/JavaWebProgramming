<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="custom" uri="/WEB-INF/tlds/product.tld" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width; initial-scale=1">
        <title>Computer Shop</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="static/styles/slick.css" type="text/css">
        <link rel="stylesheet" href="static/styles/slick-theme.css" type="text/css">
        <link rel="stylesheet" href="static/styles/navbar.css" type="text/css">
        <link rel="stylesheet" href="static/styles/home.css" type="text/css">
        <link rel="stylesheet" href="static/styles/product.css" type="text/css">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script src="static/scripts/slick.min.js"></script>
        <script src="static/scripts/home.js"></script>

    </head>
    <body>                    
        <jsp:include page="../components/navbar.jsp" />
        <div id="contentContainer" class="container">

            <div id="homeCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#homeCarousel" data-slide-to="1"></li>
                    <li data-target="#homeCarousel" data-slide-to="2"></li>
                    <li data-target="#homeCarousel" data-slide-to="3"></li>
                    <li data-target="#homeCarousel" data-slide-to="4"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="https://www.ginx.tv/uploads/Nikola_Savi%C4%87/playstation_5_pre_order_date.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://cdn.mos.cms.futurecdn.net/sRLTs4vF5Rb3oEBheJKRxE-1200-80.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://cdn.autonomous.ai/static/upload/images/new_post/inspiration-and-tips-for-your-ultimate-desk-gaming-pc-setup-645.jpg" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://knowtechie.com/wp-content/uploads/2020/01/pc-accessories-deal.jpg" alt="Fourth slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://assets-prd.ignimgs.com/2022/01/19/alienwarem15r5-1642617806710.jpg" alt="Fifth slide">
                    </div>
                </div>
                <a class="carousel-control-prev carouselNav" href="#homeCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next carouselNav" href="#homeCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            
            <div>
                <div class="sectionHeader">
                    <p class="sectionHeaderLabel">Novi proizvodi</p>
                </div>

                <div class="highlight-products-slider">
                    <c:forEach var="product" items="${requestScope.productList}">
                        <custom:product image="${product.primaryImage.path}" productID="${product.id}" brand="${product.brand.name}" productName="${product.productName}" />
                    </c:forEach>
                </div>
                
            </div>

        </div>
    </body>
    
</html>
