

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Gtable
 */
@WebServlet("Gtable")
public class Gtable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private static  String tns = "";
	private static String src_url = "";
	private static String src_username = "";
	private static String src_password = "";
    
   
    public Gtable() {
    	
    	
        super();
       
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
	      
		    Connection conn = null;
		    Statement st = null;
			ResultSet rs = null;
			String hostname = "fc8racq4n1-vip";
	    	src_username = " puppet_proj";
			src_password = "changeme";
			String sid = "wtestq1.gfoundries.com";
			tns = hostname + ":1521/" + sid;
			src_url = "jdbc:oracle:thin:@" + tns;
			Class.forName ("oracle.jdbc.OracleDriver");			
			conn = DriverManager.getConnection(src_url, src_username, src_password);
			System.out.println("Established DB Connx");
			st = conn.createStatement();
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date tDate = new Date() ;
			Date reqDate = null;
	        String strDate="";
	       
			List<String> lst = new ArrayList<String>();
			lst.add("U/I");
			lst.add("NU/I");
			lst.add("U/NI");
			
			List<String> lst1 = new ArrayList<String>();
			lst1.add("Closed");
			lst1.add("Open");
			lst1.add("InProgress");
			
			
			
			String sql  = "select * from PUPPET_PROJ.issuetracker";
			rs = st.executeQuery(sql);

			response.setContentType("text/html");
			ServletOutputStream os = response.getOutputStream();
			String output =  "<table id = 'example'>";

			 output += "<thead>";
			 output += "<tr>";
			 output += "<th style='background-color:#98bf21;width:50px'>#</th>";
			 output += "<th style='background-color:gold;width:110px'>Date</th>";
			 output += "<th style='background-color:#23819C;width:110px'>Shift</th>";
			 output += "<th style='background-color:#59955C;width:300px'>Problem Statement</th>";
			 output += "<th style='background-color:orange;width:300px'>Action Needed</th>";
			 output += "<th style='background-color:#A5FF8A;width:100px'>Urgency</th>";
			 output += "<th style='background-color:#C269FE;width:100px'>IssueType</th>";
			 output += "<th style='background-color:red;width:200px'>Who</th>";
			 output += "<th style='background-color:orange;width:100px'>Need Date</th>";
			 output += "<th style='background-color:magenta;width:130px'>Status</th>";
			 output += "<th style='background-color:pink;width:300px'>Comments</th>";
			 output += "<th style='background-color:#98bf21;width:80px'>Update</th>";
			 output += "</tr></thead>";
			 output += "<tbody>";
			 
			 os.println(output);
			 output="";
			 int counter = 0;
			 while( rs.next() ){
				   os.println("<tr>");
					
					   String what = rs.getString(1) ;
					   String urgency = rs.getString(2);
					   String issueType = rs.getString(3);
					   String who = rs.getString(4);
					   String shift = rs.getString(5);
			           String status = rs.getString(6);
			           String comments = rs.getString(7);
			           java.util.Date cdate = (java.util.Date) rs.getObject(8);
			           String trackerpk = rs.getString(9);
			           String rdate = rs.getString(10);
			           
			           String action = rs.getString(11);
			           String urgencyList = "<select name=urgentlist id = urgentlist> <option value='" ;
			           urgencyList += urgency + "' selected>" + urgency + "</option>";
			          
			           
			           for (int i = 0; i < lst.size(); i++) {
			               String option = lst.get(i).toString();
			               if ( option.trim().equalsIgnoreCase(urgency)) {
			            	 // no need to add, since it is already added up.
			               } else {
			            	   urgencyList += "<option value=" + option + ">" + option + "</option>" ;
			               }
			           }
			           
			           urgencyList += "</select>";
			           
			          
			           String input_rdate = "<input type=text class='dp'  value =" + rdate + ">" ;
			           os.println( "<td title= 'system generated' >" + trackerpk + "</td>");
			           os.println( "<td title = 'system date Issue encountered' >" + formatter.format(cdate) +  "</td>");
			           os.println( "<td title = 'Shift Issue encountered'>" + shift +  "</td>");
			           os.println( "<td title = ProblemStatement>"  + what +  "</td>");
			          /* os.println( "<td title = ActionNeeded>" + action + "</td>");
			           os.println( "<td title = ActionNeeded>"); 
			           os.println( "<a class='danger' data-placement='above' title='#Poptoopenclose' href='#'><img src='images/notepad1.jpg'></a>");
			           os.println("<div id='popover_content_wrapper' style='display:none'>");
			           os.println("<div>" + action  + "</div></div>");
			           
			        		   
			        		   
			           os.println( "</td>");
			           os.println( "<td class= 'iffyTip wd100' title = ActionNeeded>" + action + "</td>"); */
			           os.println( "<td>"  + action + "</td>");
			           os.println( "<td title = urgency>" + urgencyList + "</td>");
			           os.println( "<td title = issuetype>" + issueType + "</td>");
			           os.println( "<td title = who>" + who + "</td>");
			           
			           
			           if ( rdate != null  && rdate.trim().length() > 5) {
			        	   tDate = new Date();
			        	   strDate = formatter.format(tDate);
			               reqDate = formatter.parse(rdate);
			   		       tDate = formatter.parse(strDate);
			   		       if ( reqDate.after(tDate) ) {
			              	   os.println( "<td style='background:#4BFE78' title = 'required date'>" + input_rdate +  "</td>");
			           
			               } else {
			            	   os.println( "<td style='background:#FF7575' title = 'required date'>" + input_rdate +  "</td>");
			               }
			           } else {
			        	   
			        	   os.println( "<td background-color:'green' title = 'required date'>" + input_rdate +  "</td>");
			           }
			           
			           String statusList = "<select name=statuslist id=statuslist> <option value='" ;
			           statusList += status + "' selected>" + status + "</option>";
			          
			           
			           for (int j = 0; j < lst1.size(); j++) {
			               String opt = lst1.get(j).toString();
			               if ( opt.trim().equalsIgnoreCase(status)) {
			            	 // no need to add, since it is already added up.
			               } else {
			            	   statusList += "<option value=" + opt + ">" + opt + "</option>" ;
			               }
			           }
			           statusList += "</select>";
			           
			           
			           
			           //os.println( "<td title = 'status'>" + status + "</td>");
			           os.println( "<td title = 'status'>" + statusList + "</td>");
			           os.println( "<td title = 'comments'>" + comments + "</td>");
			          // os.println( "<td ><input type=text class='dp'  value =>" + input_cdate + "</td>");
			         
			           
			           os.println( "<td><input type='checkbox'name=checkbox id=checkbox value='saved'></td>");
			           os.println( "</tr>");
						
				}
			
					
			       
			 os.println( "</tbody>");
			 os.println( "</table>");
			 if ( st != null) {
					
					st.close();
			 }
		  	if ( rs != null) {
				rs.close();
				}
		
			if ( conn != null) {
				conn.close();
				}
		
			System.gc();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println("Exiting DB Connx..Servlet");
		 
	}
	
		
	
	

}
