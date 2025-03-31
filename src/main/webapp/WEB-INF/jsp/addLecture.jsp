<%--
  Created by IntelliJ IDEA.
  User: PoojaZenitShah
  Date: 30/3/2025
  Time: 5:37 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Lecture</title>
</head>
<body>
<h2>Add a Lecture</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
  <form:label path="lectureTitle">Lecture Title</form:label><br/>
  <form:input type="text" path="lectureTitle"/><br/><br/>
  <b>Attachments</b><br/>
  <input type="file" name="attachments" multiple="multiple"/><br/><br/>
  <input type="submit" value="Submit"/>
</form:form>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</body>
</html>