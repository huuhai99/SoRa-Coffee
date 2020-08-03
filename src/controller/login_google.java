package controller;

import dao.AccountDao;
import model.GooglePojo;
import utils.GoogleUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login_google")
public class login_google extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login_google() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            request.setAttribute("id", googlePojo.getId());
            request.setAttribute("name", googlePojo.getName());
            request.setAttribute("email", googlePojo.getEmail());


            if(AccountDao.checkIDGG(googlePojo.getId()) == true) {

            }else {
               AccountDao.InsertGGToDB(googlePojo.getEmail(),googlePojo.getId());

            }

            HttpSession session = request.getSession();
            session.setAttribute("userGG" , googlePojo);
            response.sendRedirect(request.getContextPath() +"/HomPage");
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}