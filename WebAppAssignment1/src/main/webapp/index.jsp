<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>To-Do List</title>
</head>
<body>
    <h1>To-Do List</h1>

    <!-- Form to Add New Task -->
    <form action="tasks" method="post">
        <input type="text" name="title" placeholder="Enter new task" required>
        <button type="submit">Add Task</button>
    </form>

    <!-- Task List -->
    <ul>
        <c:forEach var="task" items="${tasks}">
            <li>
                ${task.title}
               <form action="tasks" method="post" style="display:inline;">
    <input type="hidden" name="title" value="${task.title}">
    <input type="hidden" name="_method" value="DELETE">
    <button type="submit">Delete</button>
</form>
               
            </li>
        </c:forEach>
    </ul>
</body>
</html>
