<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-light mainNavColor">
    <div id="navbarContainer" class="container">
        <c:if test="${sessionScope.user.role != 'admin'}">
            <a class="navbar-brand" href="/ComputerShop">
                <image class="logo" src="/ComputerShop/static/resources/images/logo/logo.png" alt="Computer Shop logo" /> 
            </a>            
        </c:if>
        <c:if test="${sessionScope.user.role == 'admin'}">
            <a class="navbar-brand" href="/ComputerShop/admin/userLogs">
                <image class="logo" src="/ComputerShop/static/resources/images/logo/logo.png" alt="Computer Shop logo" /> 
            </a>            
        </c:if>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <div class="ml-auto"></div>

            <c:if test="${sessionScope.user.role != 'admin'}">
                <div class="nav-item kosarica">
                    <a href="/ComputerShop/cart" class="mainNavItem">
                        <i class="material-icons navIcon">shopping_cart</i>
                        <label id="cartItemsNumber">${sessionScope.cart.totalItems}</label>
                        <label id="cartLabel">Košarica</label>
                    </a>
                </div>
            </c:if>

            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <div class="dropdown nav-item loginNavItem">
                        <div id="loginUserOptions" class="mainNavItem" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="material-icons navIcon navIconUser">person</i>
                            <label id="loginLabel">${sessionScope.user.username}</label>
                        </div>                            

                        <div class="dropdown-menu dropdown-menu-right text-right userDropdownMenu" aria-labelledby="loginUserOptions">
                            <a class="dropdown-item userDropdownItem" href="#">
                                Profil <span class="material-icons align-bottom">perm_identity</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <c:if test="${sessionScope.user.role != 'admin'}">
                                <a class="dropdown-item userDropdownItem" href="/ComputerShop/povijest">
                                    Povijest narudžbi <span class="material-icons align-bottom">history</span>
                                </a>
                            </c:if> 
                            <div class="dropdown-divider"></div>
                            <a id="logoutDropdownItem" class="dropdown-item userDropdownItem" href="/ComputerShop/odjava">
                                Odjava <span class="material-icons align-bottom">exit_to_app</span>
                            </a>
                        </div>

                    </div>
                </c:when>
                <c:otherwise>
                    <div class="nav-item loginNavItem">
                        <a href="/ComputerShop/prijava" class="mainNavItem">
                            <i class="material-icons navIcon navIconUser">person</i>
                            <label id="loginLabel">Prijavi se!</label>
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-light header-navbar">
    <div id="navbarContainer" class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul id="categoryNav" class="navbar-nav w-100">
                <c:if test="${sessionScope.user.role != 'admin'}">
                    <li class="nav-item dropdown col-2">
                        <a class="nav-link dropdown-toggle catLabel" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Komponente
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/ComputerShop/proizvodi/">Sve komponente</a>
                            <div class="dropdown-divider"></div>
                            <c:forEach var="cat" items="${sessionScope.categories}">
                                <a class="dropdown-item" href="/ComputerShop/proizvodi/${cat.name}">${cat.name}</a>
                            </c:forEach>
                        </div>
                    </li>
                    <li class="nav-item dropdown col-2">
                        <a class="nav-link dropdown-toggle catLabel" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Playstation
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Sve kategorije</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Konzole</a>
                            <a class="dropdown-item" href="#">PS5 igre</a>
                            <a class="dropdown-item" href="#">PS4 igre</a>
                            <a class="dropdown-item" href="#">PS pribor</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown col-2">
                        <a class="nav-link dropdown-toggle catLabel" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Xbox
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Sve kategorije</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Konzole</a>
                            <a class="dropdown-item" href="#">Xbox Series X&S igre</a>
                            <a class="dropdown-item" href="#">Xbox One igre</a>
                            <a class="dropdown-item" href="#">Xbox pribor</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown col-2">
                        <a class="nav-link dropdown-toggle catLabel" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Laptopi
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Svi laptopi</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Gaming laptopi</a>
                            <a class="dropdown-item" href="#">Laptopi za multimediju</a>
                            <a class="dropdown-item" href="#">Apple laptopi</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown col-2">
                        <a class="nav-link dropdown-toggle catLabel" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Monitori
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Svi monitori</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">LED monitori</a>
                            <a class="dropdown-item" href="#">Gaming monitori</a>
                        </div>
                    </li>      
                    <li class="nav-item dropdown col-2">
                        <a class="nav-link dropdown-toggle catLabel" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Periferija
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Sva periferija</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Tipkovnice</a>
                            <a class="dropdown-item" href="#">Miševi</a>
                            <a class="dropdown-item" href="#">Slušalice</a>
                            <a class="dropdown-item" href="#">Web kamere</a>
                            <a class="dropdown-item" href="#">Zvučnici</a>
                            <a class="dropdown-item" href="#">Kablovi</a>
                        </div>
                    </li> 
                </c:if>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li class="nav-item col-2">
                        <a class="nav-link catLabel" href="/ComputerShop/admin/userLogs" role="button">
                            Prijave korisnika
                        </a>
                    </li>
                    <li class="nav-item col-2">
                        <a class="nav-link catLabel" href="/ComputerShop/admin/userOrders" role="button">
                            Narudžbe korisnika
                        </a>
                    </li>
                    <li class="nav-item col-2">
                        <a class="nav-link catLabel" href="#" role="button">
                            Kategorije
                        </a>
                    </li>
                    <li class="nav-item col-2">
                        <a class="nav-link catLabel" href="#" role="button">
                            Proizvodi
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>