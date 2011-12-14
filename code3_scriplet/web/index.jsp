
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.servlet.ServletRequest " %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,
                    javax.xml.parsers.DocumentBuilder,
                    org.w3c.dom.*"
%>

<%@ page import="java.util.*" %>

<%--Parsing --%>
<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("http://texwww.inf.uth.gr:8080/~magdirog/parser.xml");

NodeList n1 = doc.getElementsByTagName("cafe");
NodeList n2 = doc.getElementsByTagName("sugar");
NodeList n3 = doc.getElementsByTagName("water");

Node caf=n1.item(0);
Node sug=n2.item(0); 
Node wat=n3.item(0);

String ccc=caf.getFirstChild().getNodeValue();
String sss=sug.getFirstChild().getNodeValue();
String www=wat.getFirstChild().getNodeValue();

double ccafe=Double.parseDouble(ccc);
double ssugar=Double.parseDouble(sss);
double wwater=Double.parseDouble(www);

%>


<!DOCTYPE html>
<html>
    <head>
        <title>Magda's e-basket</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
        <div>
        
        </br>
        <h1> e-Basket </h1>

        </br>
        </br>
       
        <%
        Cookie cookies [] = request.getCookies ();
           Cookie myCookie1 = null;
           Cookie myCookie2 = null;
           Cookie myCookie3 = null;
           if (cookies != null){
              for (int i = 0; i < cookies.length; i++){
                   if (cookies [i].getName().equals ("qcafe")){
                      myCookie1 = cookies[i];
                   }
                   else if (cookies [i].getName().equals ("qsugar")){
                       myCookie2=cookies[i];
                   }
                  else if(cookies [i].getName().equals ("qwater")){
                      myCookie3=cookies[i];
                  }
                   else
                    { break;}
               }
           }
           else
                {}
                        
         %>
         
        <%
        if (request.getParameter("qcafe")== null && 
            request.getParameter("qsugar") == null &&
            request.getParameter("qwater") == null )
        {
              
        %>
     
        <form method="post" action="index.jsp">
            <table border="1">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                      <td>Cafe </td>
                      <td> <%= ccafe %> </td>
                      <td> <% if (myCookie1 !=null){ %>
                         <input type="text" name="qcafe" id="qcafe" size="6" value=" <%= Double.parseDouble(myCookie1.getValue()) %>" />  
                            
                         <% } else { %>
                         <input type="text" name="qcafe" id="qcafe" size="6"  />  
                           
                             <% } %>
                             
                        </td>
                        <td> </td>
                    </tr>
                    <tr>
                        <td>Sugar </td>
                        <td> <%= ssugar %> </td>
                        <td> <% if (myCookie2 !=null){ %>
                         <input type="text" name="qsugar" id="qsugar" size="6" value=" <%= Double.parseDouble(myCookie2.getValue()) %>" />  
                            
                         <% } else { %>
                         <input type="text" name="qsugar" id="qsugar" size="6"  />  
                           
                             <% } %>
                        </td>
                        
                        
                        <td>  </td>
                    </tr>
                    <tr>
                        <td> Water </td>
                        <td><%= wwater %> </td>
                        <td>
                            <% if (myCookie3 !=null){ %>
                         <input type="text" name="qwater" id="qwater" size="6" value=" <%= Double.parseDouble(myCookie3.getValue()) %>" />  
                            
                         <% } else { %>
                            <input type="text" name="qwater" id="qwater" size="6"  />  
                           
                            <% } %>
                        </td>

                        <td>  </td>
                    </tr>
                    <tr>
                        <td>Total:</td>
                        <td></td>
                        <td></td>
                        <td>
                                                    
                        </td>

                    </tr>
                </tbody>
            </table>
            </br>
            </br>
            <div>
                <input type="submit" value="Checkout" name="Checkout"  />
            </div>
            

        </form>
       
          
        <% } else { %>
     
        <%! 
            
            String c,s,w ;
            double cc,ss,ww;
            double tc,ts,tw,total;
        %>
        
            
         <form method="post" action="index.jsp">
            <table border="1">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Cafe </td>
                        <td><%= ccafe %> </td>
                        <td>
                            <% c=request.getParameter("qcafe"); %>
                            
                               <% if(c!=null){
                               cc=Double.parseDouble(c);} %>
                               
                               <% 
                                String qcafe=request.getParameter("qcafe");
                                Cookie c1 = new Cookie ("qcafe",qcafe);
                                c1.setMaxAge(5*60);
                                response.addCookie(c1);
                               %>
                           
                            <input type="text" name="qcafe" id="qcafe" size="6" value="<%= cc %>"/>
                            
                        </td>
                        <td> <% tc=cc*ccafe; %> 
                            <%= tc %>
                        </td>
                    </tr>
                    <tr>
                        <td>Sugar </td>
                        <td><%= ssugar %> </td>
                        <td>
                            <% s=request.getParameter("qsugar"); %>
                            
                            <% if (s!=null){
                            ss=Double.parseDouble(s);}
                            %>
                            <%
                                String qsugar=request.getParameter("qsugar");
                                Cookie c2 = new Cookie ("qsugar",qsugar);
                                c2.setMaxAge(5*60);
                                response.addCookie(c2);
                            %>
                       
                            <input type="text" name="qsugar" id="qsugar" size="6" value="<%= ss %>"/>
                            
                        </td>
                     
                        <td> 
                            <% ts=ss*ssugar; %> 
                            <%= ts %>
                        </td>
                    </tr>
                    <tr>
                        <td> Water </td>
                        <td><%= wwater %> </td>
                        <td>
                            <% w=request.getParameter("qwater"); %>
                            
                            <% if(w!=null){
                            ww=Double.parseDouble(w);} %>
                            
                            <% 
                                String qwater=request.getParameter("qwater");
                                Cookie c3 = new Cookie ("qwater",qwater);
                                c3.setMaxAge(5*60);
                                response.addCookie(c3);
                            %>
                           
                          
                            <input type="text" name="qwater" id="qwater" size="6" value="<%= ww %>"/>
                            
                        </td>

                        <td> 
                            <% tw=ww*wwater; %> 
                            <%= tw %>
                        </td>
                    </tr>
                    <tr>
                        <td>Total:</td>
                        <td></td>
                        <td></td>
                        <td>
                            <% total=tc+ts+tw ; %>  
                            <%= total %>
                        </td>

                    </tr>
                </tbody>
            </table>
            </br>
            </br>
            <div>
                <input type="submit" value="Checkout" name="Checkout"  />
            </div>

        </form>
        </div>
    
                        <% } %>
      <div> 
            <form method="get" action="report.html">
               
             <input type="submit" value="report" name="report" />   
            </form>
     </div>
      
      <div> 
            <form method="get" action="http://texwww.inf.uth.gr:8080/~magdirog/code3.tar">
               
             <input type="submit" value="download code" name="download code" onClick="CodeServlet" />   
            </form>
     </div>
  
    </body>
</html>