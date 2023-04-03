<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
    </head>
        <body>
    <section class="mx-auto max-w-md divide-y-2 divide-blue-gray-200 py-24 px-4 sm:max-w-3xl sm:px-6 lg:max-w-7xl lg:py-32 lg:px-8" aria-labelledby="faq-heading">
        <h2 class="text-3xl font-bold tracking-tight text-blue-gray-900" id="faq-heading">Frequently asked questions</h2>
        <div class="mt-6 pt-10">
          <dl class="space-y-10 md:grid md:grid-cols-2 md:grid-rows-2 md:gap-x-8 md:gap-y-12 md:space-y-0">


<%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;
                    String connectionURL = "jdbc:mysql://localhost:3306/elet", USER = "root", PWD = "n0m3l0";

                    connection = DriverManager.getConnection(connectionURL, USER, PWD);
                    statement = connection.createStatement();
                    String getUserByUserNameSQLQuery = "SELECT * from tbl_faq;";
                    rs = statement.executeQuery(getUserByUserNameSQLQuery);

                    while (rs.next()) {
                        String question_faq = rs.getString("question_faq");
                        String answer_faq = rs.getString("answer_faq");						
          
%> 

            <div>
              <dt class="text-lg font-medium text-blue-gray-900"><%=question_faq%></dt>
              <dd class="mt-2 text-base text-blue-gray-500"><%=answer_faq%></dd>
            </div>		  
                                    <%
                                            }

                                            statement.close();
                                            connection.close();
                                        } catch (SQLException e) {
                                            out.println("SQLException caught: " + e.getMessage());
                                        }
                                    %>
		
		          </dl>
        </div>
      </section>
    </body>
    
  
    
   



</html>
