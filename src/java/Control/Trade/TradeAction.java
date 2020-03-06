/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control.Trade;

import static Dict.API.ST_ITEM_DETAIL_API;
import Helper.EmailHandler;
import static Helper.HttpHandler.*;
import static Helper.JSONprocessor.*;
import Object.ItemPostedRequest;
import Object.ValidationKey;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

/**
 *
 * @date 2020-3-5 13:53:03
 * @author Yi Qiu
 */
public class TradeAction extends Trade {

    public TradeAction(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    public void postItem() throws InstantiationException, IllegalAccessException, JSONException, IOException {
        ItemPostedRequest Ipr = loadFromHttpRequest(this.request, ItemPostedRequest.class);
        String jsonResponse = sendHttpRequest(ST_ITEM_DETAIL_API, objectToJson(Ipr), "POST");
        ValidationKey vkey = jsonToObject(jsonResponse,ValidationKey.class);
        EmailHandler Eh = new EmailHandler("username","password","smtp.gmail.com","25");
        if(Eh.sendMail(vkey.getEmail(), "Post Confirmation", vkey.getValidationUrl())){
            sendAjaxResponse(this.response,"");
        }else{
            sendAjaxResponse(this.response,"");
        }
    }

}
