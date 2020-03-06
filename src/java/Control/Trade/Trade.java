/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Control.Trade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @date 2020-3-5 14:56:41
 * @author Yi Qiu
 */
class Trade {
    HttpServletRequest request;
    HttpServletResponse response;

    public Trade(HttpServletRequest _request, HttpServletResponse _response) {
        this.request = request;
        this.response = response;
    }
    
    public void close(){
        this.close();
    }

}
