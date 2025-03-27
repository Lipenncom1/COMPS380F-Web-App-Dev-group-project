<%--
  Created by IntelliJ IDEA.
  User: PoojaZenitShah
  Date: 26/3/2025
  Time: 12:16 am
  To change this template use File | Settings | File Templates.
--%>
<%--
Modifications
User: MariaDharshini
Date: 26/03/2025
Time: 8:41 pm

Changes made: added add/remove buttons
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index Page</title>
    <style>
        button {
            margin-left: 10px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
    </style>
    <script>
        function addItem(listId) {
            const newItemName = prompt("Enter the name of the new Item:");
            if (newItemName) {
                const list = document.getElementById(listId);
                const node = document.createElement("li"); //creating list element

                //anchor element
                const link = document.createElement("a");
                link.href = "#"; // Set the href link [--to be set later --]
                link.textContent = newItemName;
                node.appendChild(link);

                const button = document.createElement("button");
                button.textContent = "-";
                button.onclick = function() { removeItem(button); };
                node.appendChild(button);
                list.appendChild(node);
            }
        }

        function removeItem(button) {
            const item = button.parentNode;
            item.parentNode.removeChild(item);
        }
    </script>
</head>
<body>
<a href="login">Login</a>
<a href="register">Sign Up</a>

<h2>Course COMPS380F</h2>
<ul id="lectures">  <!--need to convert to a for loop-->
    <li><a href="">Lecture 1</a><button onclick="removeItem(this)">-</button></li>
    <li><a href="">Lecture 2</a><button onclick="removeItem(this)">-</button></li>
</ul>
<button onclick="addItem('lectures')">Add Lecture</button>

<h2>Polls</h2>
<ul id="polls">  <!--need to convert to a for loop-->
    <li><a href="">MCQ Poll 1</a><button onclick="removeItem(this)">-</button></li>
    <li><a href="">MCQ Poll 2</a><button onclick="removeItem(this)">-</button></li>
</ul>
<button onclick="addItem('polls')">Add Poll</button>

</body>
</html>