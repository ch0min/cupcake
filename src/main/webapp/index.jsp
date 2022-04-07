<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Velkommen ombord
    </jsp:attribute>

    <jsp:attribute name="footer">

    </jsp:attribute>

    <jsp:body>
        <h3>Øens bedste cupcakes. Vælg og bestil her:</h3>
        <form action="addToShoppingCart">
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

<%--        <c:if test="${sessionScope.user != null}">--%>
<%--            <p>You are logged in with the role of "${sessionScope.user.role}".</p>--%>
<%--        </c:if>--%>

<%--        <c:if test="${sessionScope.user == null}">--%>
<%--            <p>You are not logged in yet. You can do it here: <a--%>
<%--                    href="login.jsp">Login</a></p>--%>
<%--        </c:if>--%>

    </jsp:body>

</t:pagetemplate>