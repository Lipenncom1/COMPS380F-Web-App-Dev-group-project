<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Index</title>
</head>
<body>
<h2>Lectures & Polls</h2>
<security:authorize access="isAnonymous()">
  <a href="<c:url value="/login"/>">Login</a><br />
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
  <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
  <a href="<c:url value="/index/addLecture" />">Add a lecture</a><br/><br/>
</security:authorize>

<c:choose>
  <c:when test="${fn:length(lectureDatabase) == 0}">
    <i>There are no lectures in the system.</i>
  </c:when>
  <c:otherwise>
    <c:forEach items="${lectureDatabase}" var="entry">
      Lecture ${entry.id}:

      <security:authorize access="hasAnyRole('ADMIN','USER')">
        <a href="<c:url value="/index/view/${entry.id}" />">
      </security:authorize>

      <c:out value="${entry.lectureTitle}"/></a>

      <security:authorize access="hasRole('ADMIN')">
        [<a href="<c:url value="/index/editLecture/${entry.id}" />">Edit</a>]
      </security:authorize>

      <security:authorize access="hasRole('ADMIN')">
        [<a href="<c:url value="/index/delete/${entry.id}" />">Delete</a>]
      </security:authorize>
      <br />

    </c:forEach>
  </c:otherwise>
</c:choose>


<h3>Polls</h3>
<table>
  <c:forEach items="${pollDatabase}" var="poll">
    <tr>
      <td>${poll.question}
        <security:authorize access="hasAnyRole('ADMIN','USER')">
        <a href="<c:url value="/index/viewPoll/${poll.id}"/>">View</a>
          </security:authorize>
        <security:authorize access="hasRole('ADMIN')">
          <a href="<c:url value="/index/editPoll/${poll.id}"/>">Edit</a>
          <a href="<c:url value="/index/deletePoll/${poll.id}"/>">Delete</a>
        </security:authorize>
      </td>
    </tr>
  </c:forEach>
</table>

<security:authorize access="hasRole('ADMIN')">
  <p><a href="<c:url value="/index/addPoll"/>">Add New Poll</a></p>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
  <a href="<c:url value="/index/voteHistories" />">View All Poll History</a><br/><br/>
</security:authorize>

<security:authorize access="hasAnyRole('USER', 'ADMIN')">
  <a href="<c:url value="/index/myVoteHistories"/>">My Vote Histories</a><br/><br/>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
  <a href="<c:url value="/index/viewAllComments"/>"> View All Comments History</a><br/><br/>
</security:authorize>

<security:authorize access="hasAnyRole('USER', 'ADMIN')">
  <a href="<c:url value="/index/userOwnComments"/>"> My Comments History</a><br/><br/>
</security:authorize>

<security:authorize access="hasAnyRole('USER', 'ADMIN')">
<security:authentication property="principal.username" var="loggedInUser" />
<a href="<c:url value='/index/update/${loggedInUser}'/>">Update Profile</a><br/>

<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </security:authorize>
</form>
</body>
</html>