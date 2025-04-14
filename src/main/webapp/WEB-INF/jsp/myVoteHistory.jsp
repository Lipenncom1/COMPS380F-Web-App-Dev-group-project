<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Vote Histories</title>
    <style>
        .poll-container {
            margin-bottom: 30px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .poll-header {
            font-size: 1.3em;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .vote-history-table {
            width: 100%;
            border-collapse: collapse;
        }
        .vote-history-table th, .vote-history-table td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        .vote-history-table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
<h2>My Vote Histories</h2>

<c:forEach items="${polls}" var="poll">
    <div class="poll-container">
        <div class="poll-header">
            Poll Question: <c:out value="${poll.question}"/>
        </div>
        <p>Options:</p>
        <ul>
            <li>Option A: <c:out value="${poll.optionA}"/> (<c:out value="${poll.countA}"/> votes)</li>
            <li>Option B: <c:out value="${poll.optionB}"/> (<c:out value="${poll.countB}"/> votes)</li>
            <li>Option C: <c:out value="${poll.optionC}"/> (<c:out value="${poll.countC}"/> votes)</li>
            <li>Option D: <c:out value="${poll.optionD}"/> (<c:out value="${poll.countD}"/> votes)</li>
        </ul>

        <h4>My Vote History:</h4>
        <table class="vote-history-table">
            <thead>
            <tr>
                <th>Selected Option</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${myVotesByPoll[poll.id]}" var="vote">
                <tr>
                    <td><c:out value="${vote.voteOption}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</c:forEach>

<p><a href="<c:url value="/index"/>">Return to Index</a></p>
</body>
</html>