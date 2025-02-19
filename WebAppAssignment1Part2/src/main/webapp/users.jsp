<%@ page import="java.util.List" %>
<%@ page import="com.usermanagement.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>User Management</h2>

    <form action="users" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="text" name="role" placeholder="Enter Role" required>
        <button type="submit">Add User</button>
    </form>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
        <% 
            List<User> userList = (List<User>) request.getAttribute("userList");
            if (userList != null) {
                for (User user : userList) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getRole() %></td>
            <td>
                <form action="users" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= user.getId() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <% 
                }
            } 
        %>
    </table>
</body>
</html>
