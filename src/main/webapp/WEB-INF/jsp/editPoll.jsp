<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Poll</title>
    <style>
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 80%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<h2>Edit Poll</h2>

<form:form method="POST" modelAttribute="pollForm">
    <div class="form-group">
        <label for="question">Poll Question:</label>
        <form:input path="question" type="text" id="question" required="required"/>
    </div>
    
    <div class="form-group">
        <label for="optionA">Option A:</label>
        <form:input path="optionA" type="text" id="optionA" required="required"/>
    </div>
    
    <div class="form-group">
        <label for="optionB">Option B:</label>
        <form:input path="optionB" type="text" id="optionB" required="required"/>
    </div>
    
    <div class="form-group">
        <label for="optionC">Option C:</label>
        <form:input path="optionC" type="text" id="optionC" required="required"/>
    </div>
    
    <div class="form-group">
        <label for="optionD">Option D:</label>
        <form:input path="optionD" type="text" id="optionD" required="required"/>
    </div>
    
    <input type="submit" value="Save Changes"/>
</form:form>

<p><a href="<c:url value="/index/viewPoll/${poll.id}"/>">Cancel and Return to Poll</a></p>
<p><a href="<c:url value="/index"/>">Return to Index</a></p>

</body>
</html> 