<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="style">

    </jsp:attribute>



    <jsp:body>
        ${data}
        <c:if test="${sessionScope.user.role == admin}">
            <a class="nav-link"><span class="sr-only">You'readmin</span></a>
        </c:if>
    </jsp:body>
</t:pagetemplate>