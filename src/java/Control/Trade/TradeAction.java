/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control.Trade;

import static Helper.HttpHandler.loadFromHttpRequest;
import Object.ItemPostedRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @date 2020-3-5 13:53:03
 * @author Yi Qiu
 */
public class TradeAction extends Trade {

    public TradeAction(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    public void postItem() throws InstantiationException, IllegalAccessException {
        ItemPostedRequest Ipr = loadFromHttpRequest(this.request, ItemPostedRequest.class);
        
    }

}
