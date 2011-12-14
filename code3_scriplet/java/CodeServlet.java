import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.*;


public class CodeServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        processRequest(request, response);
        
        PrintWriter out = response.getWriter();
        
        try 
        {
            response.setContentType("application/rar");
            response.setHeader("Content-Disposition","attachment;filename=code3.rar");
            ServletContext ctx = getServletContext();
            InputStream is = ctx.getResourceAsStream("/code3.rar");
 
            int read=0;
            byte[] bytes = new byte[1024];
            OutputStream os = response.getOutputStream();

                while((read = is.read(bytes))!= -1)
                {
                        os.write(bytes, 0, read);
                }

            os.flush();
            os.close();        
            }
        
        finally 
        {            
                out.close();
        }
        
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
}