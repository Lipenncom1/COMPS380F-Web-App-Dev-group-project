<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>View</title>
</head>
<body>
<h2>Lecture #${lectureId}: <c:out value="${lecture.lectureTitle}"/></h2>
[<a href="<c:url value="/index/delete/${lecture.id}" />">Delete</a>]<br/><br/>
<c:if test="${!empty lecture.attachments}">
  Attachments:
  <c:forEach items="${lecture.attachments}" var="attachment" varStatus="status">

    <c:if test="${!status.first}">, </c:if>
    <a href="<c:url value="/index/${lectureId}/attachment/${attachment.id}" />">
      <c:out value="${attachment.name}"/></a>

    <security:authorize access="hasRole('ADMIN')">
      [<a href="<c:url value="/index/editLecture/${lectureId}" />">Edit</a>]
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
      [<a href="<c:url value="/index/delete/${lectureId}" />">Delete</a>]
    </security:authorize>
    <br />

  </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="/index" />">Return to list lecture</a>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>