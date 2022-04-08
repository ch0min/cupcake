<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="style">
        .form{
            max-width:400px;
        }

         input{
            margin-bottom:5px;
        }
        .form-control{
            border-radius:0px;
        }

        .form-control:focus{
            box-shadow: none !important;
        }

        .btn-primary{
            width:100%;
            border-radius:0px;
            font-weight:bold;
        }
    </jsp:attribute>

    <jsp:body>


        <c:if test="${sessionScope.user != null}">
            <p>Du er allerede logget ind</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <div class="form mx-auto">
                <h1>Opret bruger</h1>
                <br>
                <form action="${pageContext.request.contextPath}/CreateUserServlet" method="post">
                    <input type="email" autofocus class="form-control" autocomplete="off" placeholder="Email" name="email">
                    <input type="password" class="form-control" placeholder="Kode" name="password">
                    <input type="password" class="form-control" placeholder="Gentag kode" name="password">
                    <input type="submit" class="btn btn-primary" value="Opret">
                </form>
            </div>
        </c:if>

    </jsp:body>

</t:pagetemplate>