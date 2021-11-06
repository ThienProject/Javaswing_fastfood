/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pk.model.food;
/**
 *
 * @author VanThien
 */
public class FoodList_Dao {
    JDBCconnect kn = new JDBCconnect();
    Connection conn = kn.getConnectDB();
    
     public List<food> getTablefood()
   {
      List< food>  fd = new ArrayList<food>();
        try {
            String sql ="select* from tblmenuFood ";
            PreparedStatement prepa = conn.prepareStatement(sql);
            ResultSet rs = prepa.executeQuery();
            while(rs.next())
            {
                food f = new food();
                f.setIdfood(rs.getString("idfood"));
                f.setFoodName(rs.getString("foodName"));
                f.setPrice(rs.getDouble("price"));
                f.setKind(rs.getString("kind"));
                fd.add(f);
            }
            return fd;
        } catch (SQLException ex) {
            Logger.getLogger(JDBCconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
   }
   
     
     
   //Thực thi INSERT, DELETE, UPDATE
   public void InsertDB(food f)
   {
       try {
           String sql = "insert into tblmenuFood values(?,?,?,?)  ";
           
            PreparedStatement prepa = conn.prepareStatement(sql);
            prepa.setString(1,f.getIdfood());
            prepa.setString(2,f.getFoodName());
            prepa.setDouble(3,f.getPrice());
            prepa.setString(4,f.getKind());
           
            int rs = prepa.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(JDBCconnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        
   }
Nhanh1
   public void Delete(String id)
           
   {
       String sql = "Delete from tblmenuFood where idFood = ?";
       
   }
=======
 main
}
