<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Lecture</title>
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

    form {
      display: flex;
      flex-direction: column;
    }

    form label {
      text-align: left;
      margin-bottom: 8px;
      color: var(--dark-purple);
      font-weight: 600;
    }

    form input[type="text"] {
      padding: 12px;
      margin-bottom: 15px;
      border: 2px solid var(--lighter-purple);
      border-radius: 5px;
      font-size: 16px;
      transition: border-color 0.3s;
      width: 100%;
      box-sizing: border-box;
    }

    form input[type="text"]:focus {
      border-color: var(--secondary-purple);
      outline: none;
    }

    b {
      color: var(--dark-purple);
      display: block;
      margin: 15px 0 8px 0;
      font-weight: 600;
    }

    .file-input {
      margin: 10px 0 20px 0;
    }

    .submit-btn {
      background-color: var(--primary-purple);
      color: var(--white);
      padding: 12px 25px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      font-weight: 600;
      transition: background-color 0.3s;
      margin: 10px 0;
    }

    .submit-btn:hover {
      background-color: var(--secondary-purple);
    }

    .return-link {
      display: inline-block;
      margin-top: 20px;
      color: var(--primary-purple);
      text-decoration: none;
      font-weight: 600;
      transition: color 0.3s;
      padding: 8px 12px;
      border-radius: 5px;
    }

    .return-link:hover {
      color: var(--secondary-purple);
      background-color: var(--lighter-purple);
      text-decoration: underline;
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

  <h2>Edit Lecture #${lecture.id}</h2>

  <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
    <form:label path="lectureTitle">Lecture Title</form:label>
    <form:input type="text" path="lectureTitle" placeholder="Enter lecture title"/>

    <b>Add more attachments</b>
    <input type="file" name="attachments" multiple="multiple" class="file-input"/>

    <input type="submit" value="Save" class="submit-btn"/>
  </form:form>

  <a href="<c:url value="/index" />" class="return-link">Return to list tickets</a>
</div>
</body>
</html>