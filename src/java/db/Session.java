/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Session {

    private static final String USER = "user";

    public static void getLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Exception requestException = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            User user = User.getUser(email, password);
            if (user == null) {
                requestException = new Exception("E-mail não encontrado ou senha inválida");
            } else {
                session.setAttribute(USER, user);
                response.sendRedirect("http://localhost:8080/IRotas/index.jsp");
            }
        } catch (Exception ex) {
            requestException = ex;
        }

    }

    public static void getLogoff(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        response.sendRedirect("http://localhost:8080/IRotas/index.jsp");
        session.removeAttribute(USER);
    }
    
    public static void altData(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute(USER);
        Exception requestException = null;
        String email = request.getParameter("e-mail");
        String password = request.getParameter("pass");
        try {
            User user = User.getUser(email, password);
            if (user == null) {
                requestException = new Exception("E-mail não encontrado ou senha inválida");
            } else {
                session.setAttribute(USER, user);
                response.sendRedirect(request.getRequestURI());
            }
        } catch (Exception ex) {
            requestException = ex;
        }
    }

    public static void getMySession(HttpServletRequest request, HttpServletResponse response, String user) {
        HttpSession session = request.getSession();
        session.getAttribute(user);
    }

}
