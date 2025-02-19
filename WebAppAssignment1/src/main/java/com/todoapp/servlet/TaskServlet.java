package com.todoapp.servlet;

import com.todoapp.dao.TaskDAO;
import com.todoapp.model.Task;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/tasks")
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskDAO taskDAO = new TaskDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Task> tasks = taskDAO.getAllTasks();
        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("/tasks.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("_method");
        String idParam = request.getParameter("id");

        if ("DELETE".equalsIgnoreCase(method) && idParam != null) {
            int id = Integer.parseInt(idParam);
            taskDAO.deleteTask(id);  // Call the DAO to delete the task
        } else {
            String title = request.getParameter("title");
            if (title != null && !title.trim().isEmpty()) {
                taskDAO.addTask(title);  // Add task if it's not a delete request
            }
        }
        response.sendRedirect("tasks"); // Redirect to refresh the list
    }


    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        taskDAO.deleteTask(id);
        response.sendRedirect("tasks");
    }
}
