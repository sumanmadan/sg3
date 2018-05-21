

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.json.JsonObject;
import javax.json.JsonValue;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class Utable
 */
@WebServlet("/Utable")
public class Utable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static  String tns = "";
	private static String src_url = "";
	private static String src_username = "";
	private static String src_password = "";
	
	String addUpdateFlag = "";
	
	String writeFlag = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Utable() {
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
		try {
			
			
			 Connection conn = null;
			 Statement st = null;
		     ResultSet rs = null;
			 String hostname = "fc8racq5n1-vip";
		     src_username = " puppet_proj";
			 src_password = "changeme";
			 String sid = "wtestq1.fc8racq5.gfoundries.com";
			 tns = hostname + ":1521/" + sid;
			 src_url = "jdbc:oracle:thin:@" + tns;
			 Class.forName ("oracle.jdbc.OracleDriver");			
			 conn = DriverManager.getConnection(src_url, src_username, src_password);
			 System.out.println("Established DB Connx");
			 st = conn.createStatement();
			
		System.out.println("Am i @ update");
	   // String[] getList = request.getParameterValues("dataTable"); 
	   // List<String> Listx = Arrays.asList(getList);
		//[["1","2015-08-16 00:00:00.0","when1","trywimhoorayhhatmymytry","11111urgenecy17777","issuetype1","who1","09/01/2015","status1","comments1","A:saved","B:true"]]
		
		   String[] tst = request.getParameterValues("dataTable"); 
		   List<String> Listx = Arrays.asList(tst);
			//Object tst = request.getParameter("dataTable");
			System.out.println("Am i @ update" + tst);
		
			for (int i = 0; i < Listx.size(); i++) {
				
				System.out.println(i + " Am i @ update" + Listx.get(i));
			}
		    

			String[] outerArray=request.getParameterValues("dataTable");
			try{
			for (int i = 0; i < outerArray.length; i++) {

				   String[] innerArray=outerArray[i].split(",");  
		         	  // String[] innerArray=innerArray_1[x].split("\\[");  
					
		           for (int j = 0; j < innerArray.length; j++) {
		        	   
		        	   System.out.println("xxxxxxxx " + j + "   "  + innerArray[j]);
		        	  // ,["iiii","ii","ii","ii","ii","ii","ii","2015-03-08","5","A:saved","B:false"
		        	    String eachRec = innerArray[j];
		        	    if ( eachRec.indexOf("____") > 0) {
		        	    	String[] splitRec = eachRec.split("____");
		        	    	 for (int k = 0; k < splitRec.length; k++) {
		        	    		 
		        	    		 System.out.println("Bugggg  " + k + "  " + splitRec[k]);
		        	    	 }
		        	    	addUpdateFlag = splitRec[11];
		        	    	writeFlag = splitRec[12];
		        	    	
		        	    	if ( addUpdateFlag.indexOf("saved") > 0 ) {
		        				if ( writeFlag.indexOf("true") > 0) {
		        					//fwrite($file,  "$i Update this old record \n");
		        				    updateRec( eachRec, conn);
		        				 
		        					
		        				}
		        			}
		        	    	
		        	    	//If new and checked, then need to add
		        			if (addUpdateFlag.indexOf("new") > 0  ) {
		        				if ( writeFlag.indexOf("true") > 0) {
		        					 insertRec( eachRec, conn);
		        				}
		        			}
		        	    	
		        	    	
		        	    }
					   System.out.println("xxxxxxxx " + j + "   "  + addUpdateFlag + " --  " + writeFlag);
		           }
		           
		    }
			
			}catch(Exception xx) {
				xx.printStackTrace();
		
			}
			
		st.close();
		conn.close();
		
			
		}catch(Exception xx) {}
		
	
	}

	private void updateRec(String eachRec, Connection conn) throws SQLException {
		// TODO Auto-generated method stub
		
		 Statement st1 = conn.createStatement();
		 String tmpEachRec = eachRec.replaceAll("\\[", "").replaceAll("\\]","");
		 eachRec = tmpEachRec;
		 System.out.println("Update Rec  ==>" + eachRec);
		 if ( eachRec.indexOf("____") > 0) {
  	    	String[] splitRec = eachRec.split("____");
  	    	//pk comes with "6 or ["5. replace all these with space and trim it.
  	    	
  	    	String pk = "";
  	    	System.out.println("Bug PK A Rec  ==>" + splitRec[0]);
	    	if ( splitRec[0].contains("\"")) {
	    		System.out.println("Coming here  ==>" + splitRec[0].indexOf("\""));
	    		String tmpPk =  splitRec[0].replaceAll("\"","");
	    		 pk = tmpPk;
	    	}  else {
	    		 pk = splitRec[0];
	    	}
	    	
	    	
	    
	    	
  	    	
	    	System.out.println("Bug PK B Rec  ==>" + pk);
  	    	
  	        
	    	String cdate = splitRec[1].trim();
	    	String shift =splitRec[2].trim();
	    	String what = splitRec[3].trim();
	  	    String action = splitRec[4].trim();
	    	String urgency = splitRec[5].trim();
	    	String issuetype = splitRec[6].trim();
	    	String who = splitRec[7].trim();
	    	String rdate = splitRec[8].trim();
	    	String status = splitRec[9].trim();
	    	String comments = splitRec[10].trim();
	    	String required_A = splitRec[11].trim();
	    	String required_B=splitRec[12].trim();
	    	
	    	System.out.println( "6  "  + issuetype);
	    	System.out.println( "7  "  + who);
	    	System.out.println( "8  "  + rdate);
	    	System.out.println( "9  "  + status);
	    	System.out.println( "9  "  + comments);
		String updateStr = " update issuetracker SET " +
				" shift=  '"  + shift +  "'" +
				" , URGENCY =  '" + urgency +  "'" +
				" , ISSUETYPE = '" + issuetype +   "'" +
				" , who = '" + who + "'" +
				" , what = '" + what +   "'" +
				" , action = '" + action +   "'" +
				" , status = '" + status +  "'" +
				" , comments = '" + comments +  "'" +
			//	" , rdate = " + "to_date('"  + rdate +  "','mm/dd/yy')" +
			" , rdate = " + "to_date('"  + rdate +  "','yy/mm/dd')" +
			" , cdate = " + "to_date('"  + cdate +  "','yy/mm/dd')" +
				" WHERE TRACKERPK = " + pk ;
		System.out.println(updateStr );
		st1.execute(updateStr);
		st1.close();
		
		 }						
		
		 
	}
	
	
	private void insertRec(String eachRec, Connection conn) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("Aaaaa @insert " + eachRec);
		/*String insertStr = " Insert into issuetracker ( what, urgency, issuetype, who, when, status, comments, cdate, trackerpk) " +
					" values ( " + what + " , "  + urgency + "," +  issuetype + ","  + who + "," +  when + "," +  status + "," +  comments  + "," +  "to_date(cdate" + "," +  "'dd-mm-yy')," +  newpk +  ")" ;
		//"","2015/9/9","shiftn","Newwhat","Urgentwhen","issuetype","whonew","09/09/2015","statusnew","sdfsdf ssdfdsf","A:new","B:true"		*/
		 String tmpEachRec = eachRec.replaceAll("\\[", "").replaceAll("\\]","");
		 eachRec = tmpEachRec;
		String insertStr = " Insert into issuetracker ( what, urgency, issuetype, who, shift, status, comments, cdate, trackerpk , rdate, action) " +
				" values ( ?  ,? , ? , ? , ? ,  ? , ?  ,  to_date(?,  'yy/mm/dd'), ?,  to_date(?,  'yy/mm/dd'), ?)" ;
 	    System.out.println(insertStr );
 	    PreparedStatement ps1 = conn.prepareStatement(insertStr);
		 if ( eachRec.indexOf("____") > 0) {
  	    	String[] splitRec = eachRec.split("____");
  	    	
  	  	
  	    	String pk = splitRec[0];
	    	if ( pk.indexOf("\\[")> 0) {
	    		String tmpPk =  pk.replaceAll("\\[","");
	    		pk = tmpPk.trim();
	    	} 
	    	
	    	String cdate = splitRec[1].trim();
	    	String shift =splitRec[2].trim();
	    	String what = splitRec[3].trim();
	  	    String action = splitRec[4].trim();
	    	String urgency = splitRec[5].trim();
	    	String issuetype = splitRec[6].trim();
	    	String who = splitRec[7].trim();
	    	String rdate = splitRec[8].trim();
	    	String status = splitRec[9].trim();
	    	String comments = splitRec[10].trim();
	    	String required_A = splitRec[11].trim();
	    	String required_B=splitRec[12].trim();
  	    	
		  	String newpk = getMaxPK(conn);
		  	
		    ps1.setString(1,what);  
	        ps1.setString(2,urgency); 
	        ps1.setString(3,issuetype); 
	        ps1.setString(4,who); 
	        ps1.setString(5,shift);
	        ps1.setString(6,status);
	        ps1.setString(7,comments); 
	        ps1.setObject(8,cdate); 
	        ps1.setObject(9,newpk); 
	        ps1.setObject(10,rdate);
	        ps1.setObject(11,action); 
	        ps1.addBatch();
	        ps1.executeBatch();
	        ps1.clearBatch();
	       
     	    
		 }						
		
		 ps1.close();
		 
	}

	private String getMaxPK(Connection conn) throws SQLException {
		// TODO Auto-generated method stub
	
		String value="0";
		int rVal = 0;
	
		Statement st1 = conn.createStatement();
		String oneMoreSql  = "select max(trackerpk) as maxpk from issuetracker";
		
	    ResultSet maxRs = st1.executeQuery(oneMoreSql);
	    
	    if (maxRs.next()) {
	        rVal = maxRs.getInt("maxpk");
	        if (maxRs.wasNull()) {
	            // handle NULL field value
	        	rVal=0;
	        } 
	    } else {
	    	rVal = 0;
	    	System.out.println(  "  Max  " + rVal);
	    }
	   
	
		
		rVal = rVal + 1;
		System.out.println(   "  Max  " + rVal);
		value = String.valueOf(rVal);
		return value;
		
		
	}
	
	
	
}


