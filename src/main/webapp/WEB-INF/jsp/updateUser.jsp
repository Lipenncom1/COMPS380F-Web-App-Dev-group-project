<%--
Created By: Maria D
Description: Update Profile Page - allows users to update their information (Except username)
Date: 4/4/2025
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title>Update Profile</title>
</head>
<body>
<form>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<h1>Update Your Profile</h1>
<c:if test="${not empty success}">
    <div>${success}</div>
</c:if>

<form:form action="${pageContext.request.contextPath}/index/update" method="POST" modelAttribute="updateForm">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div>
        <label>Username</label>
        <div>${currentUser.username}</div>
    </div>

    <div>
        <label for="password">New Password (leave blank to keep current)</label>
        <form:password path="password" id="password" />
        <form:errors path="password"/>
    </div>

    <div>
        <label for="fullName">Full Name</label>
        <form:input path="fullName" id="fullName"/>
        <form:errors path="fullName"/>
    </div>

    <div>
        <label for="email">Email</label>
        <form:input type="email" path="email" id="email"/>
        <form:errors path="email"/>
    </div>

    <div>
        <label for="phone">Phone</label>
        <form:input path="phone" id="phone"/>
        <form:errors path="phone"/>
    </div>

    <button type="submit">Update Profile</button>

</form:form>

<p>
    <a href="${pageContext.request.contextPath}/index">Cancel</a>
</p>
</body>
</html>