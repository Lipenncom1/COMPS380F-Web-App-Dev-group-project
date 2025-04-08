<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>View</title>
</head>
<body>
<h2>Lecture #${lectureId}: <c:out value="${lecture.lectureTitle}"/></h2>

<security:authorize access="hasRole('ADMIN')">
  [<a href="<c:url value="/index/editLecture/${lecture.id}" />">Edit Lecture</a>]
  [<a href="<c:url value="/index/delete/${lecture.id}" />">Delete Lecture</a>]
</security:authorize>

<h3>Attachments</h3>
<c:if test="${!empty lecture.attachments}">
  <c:forEach items="${lecture.attachments}" var="attachment" varStatus="status">
    <c:if test="${!status.first}">, </c:if>
    <a href="<c:url value="/index/${lectureId}/attachment/${attachment.id}" />">
      <c:out value="${attachment.name}"/></a>
    [<a href="<c:url value="/index/${lectureId}/delete/${attachment.id}" />">Delete</a>]
  </c:forEach>
</c:if>
<c:if test="${empty lecture.attachments}">
  <p>No attachments found.</p>
</c:if>

<p><a href="<c:url value="/index" />">Return to list lecture</a></p>

<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>