<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Vote Histories</title>
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

        .poll-container {
            margin-bottom: 40px;
            padding: 20px;
            border: 1px solid var(--light-purple);
            border-radius: 8px;
            background-color: var(--white);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
        }

        .poll-header {
            font-size: 1.3em;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--primary-purple);
            padding-bottom: 8px;
            border-bottom: 1px dashed var(--lighter-purple);
        }

        ul {
            padding-left: 20px;
            margin: 15px 0;
        }

        li {
            margin-bottom: 8px;
            line-height: 1.5;
        }

        h4 {
            color: var(--secondary-purple);
            margin: 20px 0 15px 0;
            font-size: 1.1em;
        }

        .vote-history-table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }

        .vote-history-table th {
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 12px;
            text-align: left;
        }

        .vote-history-table td {
            padding: 12px;
            border-bottom: 1px solid var(--lighter-purple);
        }

        .vote-history-table tr:nth-child(even) {
            background-color: var(--lighter-purple);
        }

        .vote-history-table tr:hover {
            background-color: #e0c8f0;
        }

        .return-link {
            display: inline-block;
            margin-top: 30px;
            color: var(--white);
            background-color: var(--primary-purple);
            text-decoration: none;
            font-weight: 600;
            padding: 12px 20px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .return-link:hover {
            background-color: var(--secondary-purple);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .option-count {
            color: var(--secondary-purple);
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>All Vote Histories</h2>

    <c:forEach items="${polls}" var="poll">
        <div class="poll-container">
            <div class="poll-header">
                Poll Question: <c:out value="${poll.question}"/>
            </div>

            <p>Options:</p>
            <ul>
                <li>Option A: <c:out value="${poll.optionA}"/>
                    <span class="option-count">(<c:out value="${poll.countA}"/> votes)</span></li>
                <li>Option B: <c:out value="${poll.optionB}"/>
                    <span class="option-count">(<c:out value="${poll.countB}"/> votes)</span></li>
                <li>Option C: <c:out value="${poll.optionC}"/>
                    <span class="option-count">(<c:out value="${poll.countC}"/> votes)</span></li>
                <li>Option D: <c:out value="${poll.optionD}"/>
                    <span class="option-count">(<c:out value="${poll.countD}"/> votes)</span></li>
            </ul>

            <h4>Vote History:</h4>
            <table class="vote-history-table">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Selected Option</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${votesByPoll[poll.id]}" var="vote">
                    <tr>
                        <td><c:out value="${vote.username}"/></td>
                        <td><c:out value="${vote.voteOption}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:forEach>

    <a href="<c:url value="/index"/>" class="return-link">Return to Index</a>
</div>
</body>
</html>