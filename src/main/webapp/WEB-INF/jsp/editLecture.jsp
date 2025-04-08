
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Lecture</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<h2>Edit Lecture #${lecture.id}</h2>
<form:form method="POST" enctype="multipart/form-data"
           modelAttribute="lectureForm">
  <form:label path="lectureTitle">Lecture Title</form:label><br/>
  <form:input type="text" path="lectureTitle" /><br/><br/>
  <b>Add more attachments</b><br />
  <input type="file" name="attachments" multiple="multiple"/><br/><br/>
  <input type="submit" value="Save"/><br/><br/>
</form:form>
<a href="<c:url value="/index" />">Return to list tickets</a>
</body>
</html>