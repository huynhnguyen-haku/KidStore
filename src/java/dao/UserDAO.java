package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.UserDTO;

/**
 *
 * @author huynh
 */
public class UserDAO {
    
    private static final String LOGIN = "SELECT userID, isAdmin FROM account WHERE userName=? AND password=?";
    private static final String SIGNUP = "INSERT INTO account(userName, userPhone, password, isAdmin) VALUES(?,?,?,0)" ;
    private static final String CHECK_ACCOUNT = "SELECT userID, userName FROM account WHERE userName = ?" ;
    private static final String GET_DATA_EMAIL = "SELECT userName, userPhone FROM account WHERE userID = ?" ;
    
    public UserDTO login(String userName, String password) throws SQLException {
        UserDTO acc = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = utils.DBConnect.getConnection();
            if(conn != null){
                ps = conn.prepareStatement(LOGIN);
                ps.setString(1, userName);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if(rs.next()){
                    int id = rs.getInt("userID");
                    int isAdmin = rs.getInt("isAdmin");
                    
                    acc = new UserDTO(id, userName, null, null, isAdmin);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
        return acc;
    }
    public void signup(String userName, String phoneNumber, String password) throws SQLException {       
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = utils.DBConnect.getConnection();
            if(conn != null){
                ps = conn.prepareStatement(SIGNUP);
                ps.setString(1, userName);
                ps.setString(2, phoneNumber);
                ps.setString(3, password);
                ps.executeUpdate();             
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
    }
    
    public UserDTO checkAccount(String userName) throws SQLException {
        UserDTO acc = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = utils.DBConnect.getConnection();
            if(conn != null){
                ps = conn.prepareStatement(CHECK_ACCOUNT);
                ps.setString(1, userName);
                rs = ps.executeQuery();
                if(rs.next()){
                    int id = rs.getInt("userID");
                    String name = rs.getString("userName");
                    acc = new UserDTO(id, name, null, null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
        return acc;
    }
    
    public UserDTO accountMailData(int userId) throws SQLException {
        UserDTO acc = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = utils.DBConnect.getConnection();
            if(conn != null){
                ps = conn.prepareStatement(GET_DATA_EMAIL);
                ps.setInt(1, userId);
                rs = ps.executeQuery();
                if(rs.next()){
                    String userName = rs.getString("userName");
                    String phone = rs.getString("userPhone");
                    acc = new UserDTO(userName, phone);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
        return acc;
    }    
    
}
