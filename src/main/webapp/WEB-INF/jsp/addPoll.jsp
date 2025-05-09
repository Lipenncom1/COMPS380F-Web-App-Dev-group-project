<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Poll</title>
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
            max-width: 800px;
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

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: var(--dark-purple);
            font-weight: 600;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 2px solid var(--lighter-purple);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
            box-sizing: border-box;
            max-width: 600px;
        }

        input[type="text"]:focus {
            border-color: var(--secondary-purple);
            outline: none;
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
            margin-top: 10px;
        }

        .submit-btn:hover {
            background-color: var(--secondary-purple);
        }

        .nav-links {
            margin-top: 30px;
            display: flex;
            gap: 15px;
        }

        .nav-link {
            color: var(--primary-purple);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
            padding: 8px 12px;
            border-radius: 5px;
        }

        .nav-link:hover {
            color: var(--secondary-purple);
            background-color: var(--lighter-purple);
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Add Poll to Lecture: <c:out value="${lecture.lectureTitle}"/></h2>

    <form:form method="POST" modelAttribute="pollForm">
        <div class="form-group">
            <label for="question">Poll Question:</label>
            <form:input path="question" type="text" id="question" required="required" placeholder="Enter your poll question"/>
        </div>

        <div class="form-group">
            <label for="optionA">Option A:</label>
            <form:input path="optionA" type="text" id="optionA" required="required" placeholder="Enter option A"/>
        </div>

        <div class="form-group">
            <label for="optionB">Option B:</label>
            <form:input path="optionB" type="text" id="optionB" required="required" placeholder="Enter option B"/>
        </div>

        <div class="form-group">
            <label for="optionC">Option C:</label>
            <form:input path="optionC" type="text" id="optionC" required="required" placeholder="Enter option C"/>
        </div>

        <div class="form-group">
            <label for="optionD">Option D:</label>
            <form:input path="optionD" type="text" id="optionD" required="required" placeholder="Enter option D"/>
        </div>

        <input type="submit" value="Add Poll" class="submit-btn"/>
    </form:form>

    <div class="nav-links">
        <a href="<c:url value="/index/view/${lecture.id}"/>" class="nav-link">Return to Lecture</a>
        <a href="<c:url value="/index"/>" class="nav-link">Return to Index</a>
    </div>
</div>
</body>
</html>