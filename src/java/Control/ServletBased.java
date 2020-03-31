/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @date 2020-3-21 19:27:07
 * @author Yi Qiu
 */
public class ServletBased {
    public HttpServletRequest request;
    public HttpServletResponse response;

    public ServletBased(HttpServletRequest _request, HttpServletResponse _response) {
        this.request = _request;
        this.response = _response;
    }
    
    public void close(){
        this.close();
    }
    
}
