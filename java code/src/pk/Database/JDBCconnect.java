/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk.Database;

/**
 *
 * @author VanThien
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JDBCconnect {
    Connection con = null;
    public Connection getConnectDB(){
        try {
            String dbUrl = "jdbc:jtds:sqlserver://localhost:1433/FastFood";
            con = DriverManager.getConnection(dbUrl,"sa","sa");
            //System.out.println("thành công");
        } catch (Exception e) {
            System.out.println("không kết nối được");
        }
        return con;
    }
      //Thực thi câu lệnh SELECT
  
}
