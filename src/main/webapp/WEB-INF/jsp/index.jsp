
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Lectures & Polls</title>
  <style>
    :root {
      --primary-purple: #6a0dad;
      --secondary-purple: #9b59b6;
      --light-purple: #bb8fce;
      --lighter-purple: #e8daef;
      --white: #ffffff;
      --dark-purple: #4a235a;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, var(--lighter-purple), var(--white));
      margin: 0;
      padding: 20px;
      color: var(--dark-purple);
    }

    .container {
      max-width: 1000px;
      margin: 0 auto;
      background-color: var(--white);
      border-radius: 10px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      padding: 30px;
      border: 1px solid var(--light-purple);
    }

    h2, h3 {
      color: var(--primary-purple);
      border-bottom: 2px solid var(--lighter-purple);
      padding-bottom: 10px;
    }

    h2 {
      font-size: 28px;
      margin-top: 0;
    }

    h3 {
      font-size: 22px;
      margin-top: 30px;
    }

    .nav-links {
      margin: 20px 0;
      display: flex;
      flex-wrap: wrap;
      gap: 15px;
    }

    .nav-link {
      color: var(--primary-purple);
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s;
      padding: 8px 12px;
      border-radius: 5px;
    }

    .nav-link:hover {
      color: var(--secondary-purple);
      background-color: var(--lighter-purple);
      text-decoration: underline;
    }

    .lecture-list {
      margin: 20px 0;
      line-height: 1.6;
    }

    .lecture-item {
      margin-bottom: 10px;
      padding: 10px;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .lecture-item:hover {
      background-color: var(--lighter-purple);
    }

    .action-link {
      color: var(--secondary-purple);
      text-decoration: none;
      margin-left: 10px;
      font-size: 0.9em;
    }

    .action-link:hover {
      text-decoration: underline;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    table tr {
      border-bottom: 1px solid var(--lighter-purple);
    }

    table tr:last-child {
      border-bottom: none;
    }

    table td {
      padding: 12px 0;
    }

    .no-lectures {
      color: var(--secondary-purple);
      font-style: italic;
      margin: 20px 0;
    }

    .logout-form {
      margin-top: 30px;
    }

    .logout-btn {
      background-color: var(--primary-purple);
      color: var(--white);
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 14px;
      font-weight: 600;
      transition: background-color 0.3s;
    }

    .logout-btn:hover {
      background-color: var(--secondary-purple);
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Lectures & Polls</h2>

  <security:authorize access="isAnonymous()">
    <div class="nav-links">
      <a href="<c:url value="/login"/>" class="nav-link">Login</a>
    </div>
  </security:authorize>

  <security:authorize access="hasRole('ADMIN')">
    <div class="nav-links">
      <a href="<c:url value="/user" />" class="nav-link">Manage User Accounts</a>
      <a href="<c:url value="/index/addLecture" />" class="nav-link">Add a lecture</a>
    </div>
  </security:authorize>

  <div class="lecture-list">
    <c:choose>
      <c:when test="${fn:length(lectureDatabase) == 0}">
        <p class="no-lectures">There are no lectures in the system.</p>
      </c:when>
      <c:otherwise>
        <c:forEach items="${lectureDatabase}" var="entry">
          <div class="lecture-item">
            <strong>Lecture:</strong>
            <security:authorize access="hasAnyRole('ADMIN','USER')">
            <a href="<c:url value="/index/view/${entry.id}" />" class="nav-link">
              </security:authorize>
              <c:out value="${entry.lectureTitle}"/>
            </a>

            <security:authorize access="hasRole('ADMIN')">
              <a href="<c:url value="/index/editLecture/${entry.id}" />" class="action-link">Edit</a>
              <a href="<c:url value="/index/delete/${entry.id}" />" class="action-link">Delete</a>
            </security:authorize>
          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </div>

  <h3>Polls</h3>
  <table>
    <c:forEach items="${pollDatabase}" var="poll">
      <tr>
        <td>
            ${poll.question}
          <security:authorize access="hasAnyRole('ADMIN','USER')">
            <a href="<c:url value="/index/viewPoll/${poll.id}"/>" class="action-link">View</a>
          </security:authorize>
          <security:authorize access="hasRole('ADMIN')">
            <a href="<c:url value="/index/editPoll/${poll.id}"/>" class="action-link">Edit</a>
            <a href="<c:url value="/index/deletePoll/${poll.id}"/>" class="action-link">Delete</a>
          </security:authorize>
        </td>
      </tr>
    </c:forEach>
  </table>

  <div class="nav-links">
    <security:authorize access="hasRole('ADMIN')">
      <a href="<c:url value="/index/addPoll"/>" class="nav-link">Add New Poll</a>
      <a href="<c:url value="/index/voteHistories" />" class="nav-link">View All Poll History</a>
    </security:authorize>

    <security:authorize access="hasAnyRole('USER', 'ADMIN')">
      <a href="<c:url value="/index/myVoteHistories"/>" class="nav-link">My Vote Histories</a>
      <a href="<c:url value="/index/userOwnComments"/>" class="nav-link">My Comments History</a>
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
      <a href="<c:url value="/index/viewAllComments"/>" class="nav-link">View All Comments History</a>
    </security:authorize>
  </div>

  <security:authorize access="hasAnyRole('USER', 'ADMIN')">
    <security:authentication property="principal.username" var="loggedInUser" />
    <div class="nav-links">
      <a href="<c:url value='/index/update/${loggedInUser}'/>" class="nav-link">Update Profile</a>
    </div>

    <div class="logout-form">
      <c:url var="logoutUrl" value="/logout"/>
      <form action="${logoutUrl}" method="post">
        <input type="submit" value="Log out" class="logout-btn"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </form>
    </div>
  </security:authorize>
</div>
</body>
</html>