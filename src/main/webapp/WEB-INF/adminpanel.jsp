<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="style">

    </jsp:attribute>

    <jsp:body>
        <h1>Alle ordrer</h1>
        <c:forEach items="${data}" var="entry">
            ${entry}
            <p id="time"></p>
            <hr>
        </c:forEach>

        <script>
            var currentdate = new Date();
            var datetime = "Bestilt: "
                + currentdate.getHours() + ":"
                + currentdate.getMinutes() + "+"
                + currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/"
                + currentdate.getFullYear();
            document.getElementById("time").innerHTML = datetime;
        </script>
    </jsp:body>
</t:pagetemplate>