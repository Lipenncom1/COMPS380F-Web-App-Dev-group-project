<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Error - Course Materials</title>
  <style>
    :root {
      --primary-purple: #6a0dad;
      --secondary-purple: #9b59b6;
      --light-purple: #bb8fce;
      --lighter-purple: #e8daef;
      --white: #ffffff;
      --dark-purple: #4a235a;
      --error-red: #e74c3c;
      --error-bg: #fadbd8;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, var(--lighter-purple), var(--white));
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      color: var(--dark-purple);
    }

    .container {
      background-color: var(--white);
      border-radius: 10px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      padding: 30px;
      width: 500px;
      border: 1px solid var(--light-purple);
      text-align: center;
    }

    h2 {
      color: var(--primary-purple);
      margin-top: 0;
      margin-bottom: 25px;
      font-size: 28px;
      border-bottom: 2px solid var(--lighter-purple);
      padding-bottom: 10px;
    }

    .error-message {
      background-color: var(--error-bg);
      color: var(--error-red);
      padding: 15px;
      border-radius: 5px;
      margin-bottom: 20px;
      border-left: 4px solid var(--error-red);
    }

    .error-details {
      text-align: left;
      background-color: var(--lighter-purple);
      padding: 15px;
      border-radius: 5px;
      margin-bottom: 20px;
    }

    .error-details ul {
      margin: 0;
      padding-left: 20px;
    }

    .error-details li {
      margin-bottom: 8px;
    }

    .return-link {
      display: inline-block;
      margin: 15px 0;
      color: var(--primary-purple);
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s;
      padding: 8px 12px;
      border-radius: 5px;
    }

    .return-link:hover {
      color: var(--secondary-purple);
      background-color: var(--lighter-purple);
      text-decoration: underline;
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
      margin-top: 20px;
    }

    .logout-btn:hover {
      background-color: var(--secondary-purple);
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Error Page</h2>

  <c:choose>
    <c:when test="${empty message}">
      <div class="error-message">
        <p>Something went wrong.</p>
      </div>
      <div class="error-details">
        <ul>
          <li><strong>Status Code:</strong> ${status}</li>
          <li><strong>Exception:</strong> ${exception}</li>
        </ul>
      </div>
    </c:when>
    <c:otherwise>
      <div class="error-message">
        <p>${message}</p>
      </div>
    </c:otherwise>
  </c:choose>

  <a href="<c:url value="/index" />" class="return-link">Return to list lectures</a>

  <c:url var="logoutUrl" value="/logout"/>
  <form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" class="logout-btn"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form>
</div>
</body>
</html>