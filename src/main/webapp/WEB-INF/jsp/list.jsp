<%--
  Created by IntelliJ IDEA.
  User: PoojaZenitShah
  Date: 30/3/2025
  Time: 5:28 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>list</title>
</head>
<body>
<h2>Tickets</h2>
<a href="<c:url value="/lecture/addLecture" />">Add a lecture</a><br/><br/>
<c:choose>
  <c:when test="${fn:length(lectureDatabase) == 0}">
    <i>There are no tickets in the system.</i>
  </c:when>
  <c:otherwise>
    <c:forEach items="${lectureDatabase}" var="entry">
      Lecture ${entry.id}:
      <a href="<c:url value="/lecture/view/${entry.id}" />">
        <c:out value="${entry.lectureTitle}"/></a>

      <security:authorize access="hasRole('ADMIN')">
        [<a href="<c:url value="/lecture/editLecture/${entry.id}" />">Edit</a>]
      </security:authorize>
      <security:authorize access="hasRole('ADMIN')">
        [<a href="<c:url value="/lecture/delete/${entry.id}" />">Delete</a>]
      </security:authorize>
      <br />

    </c:forEach>
  </c:otherwise>
</c:choose>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>