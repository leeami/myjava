package subjects;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 

/**
 * Servlet implementation class UpdateSubjectServlet
 */
@WebServlet({ "/UpdateSubjectServlet", "/UpdateSubject.do" })
public class UpdateSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		String subjectcode= request.getParameter("subjectcode");
		String subjectname= request.getParameter("subjectname");
		String credithour= request.getParameter("credithour");
		String sub_desc= request.getParameter("sub_desc");
		
		String securitytoken= request.getParameter("securitytoken");
		
		try
		   {
			String key=session.getAttribute("staffid") +"";
			BusinessLogic b= new BusinessLogic(); 
			//lecturer_subject_view
			
			 
			
			String sql="UPDATE `teststudent`.`subject` "+
			"SET"+
			//"`subjectcode` = '"+subjectcode+"' ," +
			"`subjectname` = '"+subjectname+"' ," +
			"`credithour` = '"+credithour+"' ," +
			"`sub_desc` = '"+sub_desc+"'  " +
			"WHERE `subjectcode` = '"+ subjectcode +"'";
			//SELECT * FROM teststudent.subject;
			
	 	  System.out.println(""+sql); 
	 	  //int i = st.executeUpdate(sql);
	 		
	 	  
			//String	  sql="SELECT * FROM lecturer_subject_view   where staffid LIKE '"+ key +"'";
			if(b.SQLInjectionFilter(sql))
			{
			//pass	
			}
			else
			{
			//sql injection is coming.	
			}

			int i = b.executeUpdate_AddUpdateDeleteCourse (sql) ;
			   
		 	  
			 	 System.out.println("3>>");
			 	 
			 	  
			 	  
			 	  
			   	    if (i > 0) {
			   	    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
						Date date = new Date();
			    	 session.setAttribute("MsgUpdateSubject", "Successfully updating record for "+ subjectcode + " "+ subjectname + " at " + dateFormat.format(date));
			      
			        response.sendRedirect("protected/UpdateCourse.jsp?subjectcode="+subjectcode+"");


			    } else {
			    	 session.setAttribute("error", "Something wrong.");

			    	 response.sendRedirect("/error/error.jsp");
			    }
			   }
			   catch(Exception ee)
			   {
				   response.sendRedirect("/error/error.jsp?status="+ ee.getMessage());
				  

				   
			   }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
