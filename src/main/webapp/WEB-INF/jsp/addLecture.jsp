<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Lecture</title>
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

    form {
      display: flex;
      flex-direction: column;
    }

    form label {
      text-align: left;
      margin-bottom: 5px;
      color: var(--dark-purple);
      font-weight: 500;
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
      margin: 15px 0 5px 0;
    }

    .file-input {
      margin: 10px 0 20px 0;
    }

    .submit-btn {
      background-color: var(--primary-purple);
      color: var(--white);
      padding: 12px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      font-weight: 600;
      transition: background-color 0.3s;
      width: 150px;
    }

    .submit-btn:hover {
      background-color: var(--secondary-purple);
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Add a Lecture</h2>
  <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
    <form:label path="lectureTitle">Lecture Title</form:label>
    <form:input type="text" path="lectureTitle" placeholder="Enter lecture title"/>

    <b>Attachments</b>
    <input type="file" name="attachments" multiple="multiple" class="file-input"/>

    <input type="submit" value="Submit" class="submit-btn"/>
  </form:form>

  <c:url var="logoutUrl" value="/logout"/>
  <form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" class="logout-btn"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form>
</div>
</body>
</html>