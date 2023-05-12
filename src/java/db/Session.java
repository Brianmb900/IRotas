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
    private static final String DRIVINGSCHOOL = "school";

    public static void getLoginUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Exception requestException = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = User.getUser(email, password);
        try {
            if (user == null) {
                throw requestException = new Exception("E-mail não encontrado ou senha inválida");
            } else {
                session.setAttribute(USER, user);
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
                session.setAttribute("SEARCH", "0");
                response.sendRedirect("http://localhost:8080/IRotas/index.jsp");
            }
        } catch (Exception ex) {
            requestException = ex;
        }

    }

    public static void getLoginSchool(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Exception requestException = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DrivingSchool school = DrivingSchool.getDrivingSchool(email, password);
        try {
            if (school == null) {
                throw requestException = new Exception("E-mail não encontrado ou senha inválida");
            } else {
                session.setAttribute(DRIVINGSCHOOL, school);
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
                session.setAttribute("SEARCH", "0");
                response.sendRedirect("http://localhost:8080/IRotas/index.jsp");
            }
        } catch (Exception ex) {
            requestException = ex;
        }

    }

    public static void altDataUser(HttpServletRequest request, HttpServletResponse response, String senha) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute(USER);
        Exception requestException = null;
        String email = request.getParameter("e-mail");
        User user = User.getUserAlt(email, senha);
        try {
            if (user == null) {
                requestException = new Exception("E-mail não encontrado ou senha inválida");
            } else {
                session.setAttribute(USER, user);
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
                session.setAttribute("SEARCH", "0");
                response.sendRedirect(request.getRequestURI());
            }
        } catch (Exception ex) {
            requestException = ex;
        }
    }

    public static void altDataSchool(HttpServletRequest request, HttpServletResponse response, String senha) throws Exception {
        HttpSession session = request.getSession();
        session.removeAttribute(DRIVINGSCHOOL);
        Exception requestException = null;
        String email = request.getParameter("e-mail");
        DrivingSchool school = DrivingSchool.getDrivingSchoolAlt(email, senha);
        try {
            if (school == null) {
                requestException = new Exception("E-mail não encontrado ou senha inválida");
            } else {
                session.setAttribute(DRIVINGSCHOOL, school);
                session.setAttribute("ORDER", "1");
                session.setAttribute("ORDER2", " ASC");
                session.setAttribute("SEARCH", "0");
                response.sendRedirect(request.getRequestURI());
            }
        } catch (Exception ex) {
            requestException = ex;
        }
    }

    public static void getLogoff(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        response.sendRedirect("http://localhost:8080/IRotas/index.jsp");
        session.removeAttribute(USER);
        session.removeAttribute(DRIVINGSCHOOL);
    }

    public static void getMySession(HttpServletRequest request, HttpServletResponse response, String user) {
        HttpSession session = request.getSession();
        session.getAttribute(user);
    }

}
