<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Management</title>
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

    h2 {
      color: var(--primary-purple);
      margin-top: 0;
      margin-bottom: 25px;
      font-size: 28px;
      border-bottom: 2px solid var(--lighter-purple);
      padding-bottom: 10px;
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
      margin-bottom: 20px;
    }

    .logout-btn:hover {
      background-color: var(--secondary-purple);
    }

    .nav-links {
      margin-bottom: 30px;
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
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

    .create-user {
      display: inline-block;
      margin-bottom: 20px;
      background-color: var(--primary-purple);
      color: var(--white);
      padding: 10px 15px;
      border-radius: 5px;
      text-decoration: none;
      font-weight: 600;
      transition: background-color 0.3s;
    }

    .create-user:hover {
      background-color: var(--secondary-purple);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    th {
      background-color: var(--primary-purple);
      color: var(--white);
      padding: 12px;
      text-align: left;
    }

    td {
      padding: 12px;
      border-bottom: 1px solid var(--lighter-purple);
    }

    tr:hover {
      background-color: var(--lighter-purple);
    }

    .action-links a {
      color: var(--secondary-purple);
      text-decoration: none;
      margin-right: 8px;
      transition: color 0.3s;
    }

    .action-links a:hover {
      color: var(--primary-purple);
      text-decoration: underline;
    }

    .no-users {
      color: var(--secondary-purple);
      font-style: italic;
      margin: 20px 0;
    }
  </style>
</head>
<body>
<div class="container">
  <c:url var="logoutUrl" value="/logout"/>
  <form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" class="logout-btn"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form>

  <div class="nav-links">
    <a href="<c:url value="/index" />" class="nav-link">Return to list lectures</a>
  </div>

  <h2>Users</h2>

  <a href="<c:url value="/user/create" />" class="create-user">Create a User</a>

  <c:choose>
    <c:when test="${fn:length(IndexUser) == 0}">
      <p class="no-users">There are no users in the system.</p>
    </c:when>
    <c:otherwise>
      <table>
        <thead>
        <tr>
          <th>Username</th>
          <th>Password</th>
          <th>Roles</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${IndexUser}" var="user">
          <tr>
            <td>${user.username}</td>
            <td>${fn:substringAfter(user.password, '{noop}')}</td>
            <td>
              <c:forEach items="${user.roles}" var="role" varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                ${role.role}
              </c:forEach>
            </td>
            <td class="action-links">
              <a href="<c:url value="/user/delete/${user.username}" />">Delete</a>
              <a href="<c:url value="/user/edit/${user.username}"/>">Update</a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:otherwise>
  </c:choose>
</div>
</body>
</html>