package controller;

import com.restfb.types.User;
import common.RestFB;
import connection.DBConnection;
import dao.AccountDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login_facebook")
public class login_facebook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login_facebook() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = RestFB.getToken(code);
            User user = RestFB.getUserInfo(accessToken);
            request.setAttribute("id", user.getId());
            request.setAttribute("name", user.getName());


            if(AccountDao.checkIDFB(user.getId()) == true) {

            }else {
                AccountDao.InsertFBToDB(user.getId(), user.getName());

            }

//            PreparedStatement stm = null;
//            ResultSet rs = null;
//            Connection con = null;


//            try {
//                con = DBConnection.getConnection();
//                String sql = "SELECT * FROM account WHERE facebookID = ? ";
//                stm = con.prepareStatement(sql);
//                stm.setString(1, user.getId());
//                rs = stm.executeQuery();
//                if (rs.next()) {
//                    return true;
//                }
//
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }






//            if (user.getName() == null) {
//
//
//            } else  {
//                if (user.getName() != null) {
//
//                } else {
// AccountDao.InsertFBToDB(user.getId(), user.getName());
//
//                }
//            }


            HttpSession session = request.getSession();
            session.setAttribute("userFB", user);
        }


        response.sendRedirect(request.getContextPath() + "/HomPage");


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}