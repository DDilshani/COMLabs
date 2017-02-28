/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.servlet.http.HttpServletResponse.SC_OK;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nathasha
 */

@WebServlet(
        name = "Address Book",
        urlPatterns = {"/search","/newEntry"},
        initParams = {@WebInitParam(name="filename", value="/addressBook.txt")}
)

public class AddressBookServlet extends HttpServlet {
       
    String path;
//    AddressBook addressBook;
    
    //Servlet initialization
    @Override
    public void init() throws ServletException {
        
        
            ServletConfig config = getServletConfig();
            
            //get the value of the init-parameter
            String filename = config.getInitParameter("filename");
            ServletContext sc = config.getServletContext();
            path = sc.getRealPath(filename);
    }
    
    
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
            
    
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        
//        /*TODO*/
//        //process request parameters and add details coresponding to name       
//        String name = request.getParameter("name");
//        String contacts = request.getParameter("contacts");
//        
//        addressBook.add(name, contacts);
//               
//        response.setStatus(SC_OK);
//        PrintWriter out = response.getWriter();
//        out.println("Your contact details added!<br>"); 
//        
//        String content = addressBook.search(name);
//        out.println(name + ": "+ content);
//
//        
//    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String id = "USER";
        
        AddressBook addressBook = (AddressBook) session.getAttribute(id);
        
           
        if(session.isNew()){
        
            try {
                
                addressBook = new AddressBook(path);
                session.setAttribute(id, addressBook);
                               
            } catch (Exception ex) {
                Logger.getLogger(AddressBookServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        } 
        
        String name = request.getParameter("name");
        
        String details;

        if ((details = addressBook.search(name)) != null) {
            
            response.setStatus(HttpServletResponse.SC_OK);
            PrintWriter out = response.getWriter();
            out.println(name +" : "+details);
            
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
       
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String id = "USER";
        
        AddressBook addressBook = (AddressBook)session.getAttribute(id);
    
        if(session.isNew()){
        
            try {
                addressBook = new AddressBook(path);
//                session.setAttribute(id, addressBook);
                
            } catch (Exception ex) {
                Logger.getLogger(AddressBookServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        } 
        
//        addressBook = (AddressBook)session.getAttribute(id);
        
        String name = request.getParameter("name");
        String contacts = request.getParameter("contacts");

        addressBook.add(name, contacts);

        response.setStatus(SC_OK);
        PrintWriter out = response.getWriter();
        out.println("<p>Your contact details added!</p>"); 

//        String content = addressBook.search(name);
        out.println("<p>"+ name + ": "+ contacts +"</p>");
        
        session.setAttribute(id, addressBook);
       
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
//    @Override
//    public void destroy (){
//        
//        try {
//            addressBook.writeToCSV();
//        } catch (IOException ex) {
//            Logger.getLogger(AddressBookServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

}
