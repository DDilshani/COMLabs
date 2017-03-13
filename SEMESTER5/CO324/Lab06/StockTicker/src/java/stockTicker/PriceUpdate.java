package stockTicker;

import java.io.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(urlPatterns = {"/stream"})
public class PriceUpdate extends HttpServlet {

    final Stock stock = new Stock();

    @Override
    public void init(ServletConfig config) {
        stock.start();
    }

    /**
     * Processes requests for HTTP <code>GET</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/event-stream");
        response.flushBuffer();
        Logger.getGlobal().log(Level.INFO, "Beginning update stream.");

        try (PrintWriter out = response.getWriter()) {
            while (!Thread.interrupted())
                synchronized (stock) {
                    stock.wait();
                    
                    out.print("data: "); // This format is seen when using curl
                    out.print(stock.price);
                    Date date= new java.util.Date();
                    Timestamp ts = new Timestamp(date.getTime());
                    out.print("  : ");
                    out.println(ts);
                    out.println();
                    out.flush();
                }
        } catch (InterruptedException e) {
            Logger.getGlobal().log(Level.INFO, "Terminating updates.");
            response.setStatus(HttpServletResponse.SC_GONE);
        }
    }

    @Override
    public void destroy() {
        stock.interrupt();
    }
}
