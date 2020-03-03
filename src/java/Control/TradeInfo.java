/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Control.Trade.Trade;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yi Qiu
 */
@WebServlet(name = "TradeInfo", urlPatterns = {"/Trade"})
public class TradeInfo extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param _request servlet request
     * @param _response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest _request, HttpServletResponse _response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param _request servlet request
     * @param _response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest _request, HttpServletResponse _response)
            throws ServletException, IOException {
        String code = _request.getParameter("code");
        Trade trade = new Trade(_request, _response);
        if(code == null || code == ""){
            //Err handler
            return;
        }
        switch(code){
            case "STPV":
                trade.getHmPagePreviewList();
                break;
            case "STSR":
                String category = _request.getParameter("category");
                String page = _request.getParameter("page");
                trade.getSearchResults(category, page);
                break;
            case "STitem":
                String itemid = _request.getParameter("itemid");
                trade.getItemDetail(itemid);
                break;
        }
        
        trade.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Trading handler /n" + 
                "listing opening trade, retrieve the detail infomation of an item, and change trading status.";
    }

}
