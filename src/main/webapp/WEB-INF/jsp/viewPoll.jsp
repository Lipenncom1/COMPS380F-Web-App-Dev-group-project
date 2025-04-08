<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Poll</title>
    <style>
        .poll-option {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .poll-count {
            font-weight: bold;
            color: #555;
        }
        .poll-question {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
            display: none;
        }
    </style>
    <script>
        function validateForm() {
            var options = document.getElementsByName('option');
            var selected = false;
            
            for (var i = 0; i < options.length; i++) {
                if (options[i].checked) {
                    selected = true;
                    break;
                }
            }
            
            if (!selected) {
                document.getElementById('error-message').style.display = 'block';
                return false;
            }
            
            return true;
        }
    </script>
</head>
<body>
<h2>Poll</h2>

<div class="poll-question">
    <c:out value="${poll.question}"/>
</div>

<form action="<c:url value="/index/vote/${poll.id}"/>" method="post" onsubmit="return validateForm()">
    <div class="poll-option">
        <input type="radio" name="option" value="A" id="optionA" ${userVote == 'A' ? 'checked' : ''}/>
        <label for="optionA"><c:out value="${poll.optionA}"/></label>
        <span class="poll-count">(<c:out value="${poll.countA}"/> votes)</span>
    </div>
    
    <div class="poll-option">
        <input type="radio" name="option" value="B" id="optionB" ${userVote == 'B' ? 'checked' : ''}/>
        <label for="optionB"><c:out value="${poll.optionB}"/></label>
        <span class="poll-count">(<c:out value="${poll.countB}"/> votes)</span>
    </div>
    
    <div class="poll-option">
        <input type="radio" name="option" value="C" id="optionC" ${userVote == 'C' ? 'checked' : ''}/>
        <label for="optionC"><c:out value="${poll.optionC}"/></label>
        <span class="poll-count">(<c:out value="${poll.countC}"/> votes)</span>
    </div>
    
    <div class="poll-option">
        <input type="radio" name="option" value="D" id="optionD" ${userVote == 'D' ? 'checked' : ''}/>
        <label for="optionD"><c:out value="${poll.optionD}"/></label>
        <span class="poll-count">(<c:out value="${poll.countD}"/> votes)</span>
    </div>
    
    <div id="error-message" class="error-message">Please choose a choice</div>
    
    <c:if test="${not empty errorMessage}">
        <div class="error-message" style="display: block;">
            <c:out value="${errorMessage}"/>
        </div>
    </c:if>
    
    <security:authorize access="hasAnyRole('USER', 'ADMIN')">
        <input type="submit" value="${userVote != null ? 'Change Vote' : 'Submit Vote'}"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </security:authorize>
</form>

<security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/index/editPoll/${poll.id}"/>">Edit Poll</a>]
    [<a href="<c:url value="/index/deletePoll/${poll.id}"/>">Delete Poll</a>]
</security:authorize>

<p><a href="<c:url value="/index"/>">Return to Index</a></p>

</body>
</html> 