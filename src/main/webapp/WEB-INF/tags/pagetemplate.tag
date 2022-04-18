<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="style" fragment="true" %>

<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><jsp:invoke fragment="header"/>Olsker Cupcakes</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <style>
        <jsp:invoke fragment="style"/>
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg" style="background-color: #ffdeb4; font-weight: bold">
        <div class="container">
            <a class="navbar-brand" href="CupcakeServlet">
                <img src="${pageContext.request.contextPath}/images/CupcakeBanner.png" width="1300px" height="400"/>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                <div class="navbar-nav">

                </div>
            </div>
        </div>
    </nav>
</header>

<header>
    <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #d09d6d; font-weight: bold">
        <div class="container">
        <a class="navbar" href="CupcakeServlet"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                    <c:if test="${sessionScope.user == null }">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/login.jsp"><i class="bi bi-box-arrow-in-right" style="font-size: 18px"></i> LOG IND</a>
                    </c:if>
                    <c:if test="${sessionScope.user != null }">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right" style="font-size: 18px"></i> LOG UD</a>
                    </c:if>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.user.role == 'admin' }">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/">KUNDER</a>
                        </c:if>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.user.role == 'admin' }">
                            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/AdminPanel">ADMIN</a>
                        </c:if>
                    </li>
                </ul>
            </div>

            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #d09d6d; font-weight: bold">
            <div class="container">
                <div class="collapse navbar-collapse" id="navbarNav1">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <c:if test="${sessionScope.user != null }">
                                <a class="nav-item nav-link"><span class="sr-only">${sessionScope.user.username}</span></a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/CupcakeServlet"><i class="bi bi-house-door"></i> HJEM</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/"><i class="bi bi-box2"></i>
                                ORDRE</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/cart"><i class="bi bi-cart" style="font-size: 18px"></i>(${sessionScope.size + 0})</a>
                        </li>
                    </ul>
                </div>
            </div>
            </nav>
        </div>
    </nav>
</header>

<div id="body" class="container mt-4" style="min-height: 800px;">
    <h1><jsp:invoke fragment="header"/></h1>
    <jsp:doBody/>
</div>

<!-- Footer -->
<div class="container mt-3">
    <hr/>
    <div class="row mt-4">
        <div class="col">
            Ellebyvej 30<br/>
            3700 Rønne
        </div>
        <div class="col">
            <jsp:invoke fragment="footer"/><br/>
            <p>&copy; 2022 Bornholm</p>
        </div>
        <div class="col">
            Cupcakes der vil noget!<br/>
            "Bedste Cupcakes Danmark Pris 2022"
        </div>
    </div>

</div>

</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>