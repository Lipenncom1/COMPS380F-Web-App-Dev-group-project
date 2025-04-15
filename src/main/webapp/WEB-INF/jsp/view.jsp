<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>View</title>
</head>
<body>
<h2>Lecture: <c:out value="${lecture.lectureTitle}"/></h2>
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
      [<a href="<c:url value="/index/${lectureId}/delete/${attachment.id}" />">Delete</a>]

    </security:authorize>
    <br />

  </c:forEach><br/><br/>
</c:if>

<h2>Comments</h2>
<c:choose>
  <c:when test="${!empty lecture.lecturecomments}">
    <ul>
      <c:forEach items="${lecture.lecturecomments}" var="comment">
        <li>
          <strong><c:out value="${comment.username}"/>:</strong>
          <c:out value="${comment.commentText}"/>

          <security:authorize access="hasRole('ADMIN')">
            <form method="post" action="<c:url value='/comments/${lectureId}/delete/${comment.commentId}'/>" style="display: inline;">
              <input type="submit" value="Delete"/>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
          </security:authorize>
        </li>
      </c:forEach>
    </ul>
  </c:when>
  <c:otherwise>
    <p>No comments yet</p>
  </c:otherwise>
</c:choose>

<security:authorize access="hasAnyRole('USER', 'ADMIN')">
  <form action="<c:url value="/comments/${lecture.id}/add"/>" method="post">
    <textarea name="commentText" required></textarea>
    <input type="submit" value="Add Comment"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form>
</security:authorize>


<a href="<c:url value="/index" />">Return to list lecture</a>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>