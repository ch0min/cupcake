<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Welcome to the cupcakes
    </jsp:attribute>

    <jsp:attribute name="footer">
        Welcome to the frontpage
    </jsp:attribute>

    <jsp:body>
        <form action="ShoppingCartServlet">
            <label> vælg bund:</label>
            <select name="bottom">
                <c:forEach items="${requestScope.bottom}" var="bottoms">
                    <option value="${bottoms}"> ${bottoms} </option>
                </c:forEach>
            </select>
            <label> vælg topping:</label>
            <select name="top">
                <c:forEach items="${requestScope.top}" var="tops">
                    <option value="${tops}"> ${tops} </option>
                </c:forEach>
            </select>
            <label>antal:</label>
            <input type="number" id="amount" name="amount" value="1">

            <input type="submit" formaction="addToShoppingCart" value="tilføj til kurv">
        </form>

    </jsp:body>

</t:pagetemplate>
