package dao;

import com.restfb.types.User;
import connection.DBConnection;
import model.Accounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDao {
    public boolean checkAccount(String email, String password) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM account WHERE email = '" + email + "' AND password ='" + password + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
    public static boolean checkIDFB(String ID) {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM account WHERE  facebookID = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
    public static boolean checkIDGG(String ID) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM account WHERE  googleID = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public Accounts checkLogin(String email, String password) {
        Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM account WHERE email = '" + email + "' AND password ='" + password + "'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Accounts accountsBean = new Accounts();
                accountsBean.setId(rs.getInt("id"));
                accountsBean.setUserName(rs.getString("username"));
                accountsBean.setPassword(rs.getString("password"));
                accountsBean.setType(rs.getString("type"));
                accountsBean.setNumberPhone(rs.getString("numberphone"));
                accountsBean.setEmail(rs.getString("email"));
                accountsBean.setAddress(rs.getString("address"));
                return accountsBean;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static User checkLoginFB(String facebookID) throws SQLException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM account WHERE facebookID = ? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, facebookID);
            rs = stm.executeQuery();
            if (rs.next()) {
                String faceID = rs.getString(8);
                String faceLink = rs.getString(9);

                User userInfo = new User();
                userInfo.setId(faceID.trim());
                userInfo.setLink(faceLink);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
        return null;
    }

    public static boolean InsertFBToDB(String ID, String name) {
        PreparedStatement stm = null;
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO account (facebookID,username) VALUES (?,?)";
            stm = con.prepareStatement(sql);
            stm.setString(1, ID);
            stm.setString(2, name);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
        return false;
    }
    public static boolean InsertGGToDB( String email ,String googleID) {
        PreparedStatement stm = null;
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO account (email, googleID) VALUES (?,?)";
            stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, googleID);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
        return false;
    }

}
