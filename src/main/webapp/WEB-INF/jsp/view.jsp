<%--
  Created by IntelliJ IDEA.
  User: PoojaZenitShah
  Date: 30/3/2025
  Time: 5:41 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>View</title>
</head>
<body>
<h2>Lecture #${lectureId}: <c:out value="${lecture.lectureTitle}"/></h2>
[<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]<br/><br/>
<c:if test="${!empty lecture.attachments}">
  Attachments:
  <c:forEach items="${lecture.attachments}" var="attachment" varStatus="status">
    <c:if test="${!status.first}">, </c:if>
    <a href="<c:url value="/lecture/${lectureId}/attachment/${attachment.id}" />">
      <c:out value="${attachment.name}"/></a>
    [<a href="<c:url value="/lecture/${lectureId}/delete/${attachment.id}" />">Delete</a>]
  </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="/lecture" />">Return to list lecture</a>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>