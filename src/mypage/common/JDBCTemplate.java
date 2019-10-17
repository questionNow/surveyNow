package mypage.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
   public static Connection getConnection(){
      Connection conn = null;
      Properties prop = new Properties();
      
      String fileName = JDBCTemplate.class.getResource("../sql/driver.properties").getPath();
      
         try {
            prop.load(new FileReader(fileName));
            
            String driver = prop.getProperty("driver");
            String url = prop.getProperty("url");
            String user = prop.getProperty("user");
            String password = prop.getProperty("password");
            
            //1. Ŭ���� ��ü ���, Driver ���
            Class.forName(driver);   //��� �ȳ��� jdbc �ٽ� ����...~?
            
            //2. DBMS�� ����
            conn = DriverManager.getConnection(url,user,password);
            
            conn.setAutoCommit(false);// �⺻���� true, commit,rollback �ڵ����� �ȵǰ� ����(����ڰ� ���Ҷ� �Ϸ���)
            
         } catch (FileNotFoundException e) {
            e.printStackTrace();
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         }
         return conn;
   }
   
   public static void close(Connection conn) {
      try {
         if(conn != null && !conn.isClosed())   //������ ��ü�� ���ų� && ������ �ȴ���������
            conn.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
   
   public static void close(Statement stmt) {
      try {
         if(stmt != null && !stmt.isClosed())
            stmt.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
   
   public static void close(ResultSet rs) {
      try {
         if(rs != null && !rs.isClosed())
            rs.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }      
   }
   
   public static void commit(Connection conn) {
      try {
         if(conn != null && conn.isClosed())
            conn.commit();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
   
   public static void rollback(Connection conn) {
      try {
         if(conn != null && conn.isClosed())
            conn.rollback();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }   
   
}