package Control.Trade;

import Control.Account.Account;
import Control.ServletBased;
import Dict.API;
import Dict.EmailServer;
import Helper.EmailHandler;
import static Helper.HttpHandler.*;
import static Helper.JSONprocessor.*;
import Object.ItemPostedRequest;
import Object.ValidationKey;
import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

/**
 *
 * @date 2020-3-3 12:07:01
 * @author Yi Qiu
 */
public class TradeAction extends ServletBased {

    /**
     * initialize the TradeAction object.
     * @param _request
     * @param _response
     */
    public TradeAction(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    /**
     * Post an item without login, return results in Ajax way.
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws JSONException
     * @throws IOException
     */
    public void postItemDefault() throws InstantiationException, IllegalAccessException, JSONException, IOException {
        ItemPostedRequest Ipr = loadFromHttpRequest(this.request, ItemPostedRequest.class);
        String sendJson = objectToJson(Ipr).toString();
        String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.ST_ITEM_DETAIL_API, sendJson, "POST", null));
        ValidationKey vkey = jsonToObject(jsonResponse, ValidationKey.class);
        EmailHandler Eh = new EmailHandler(EmailServer.USERNAME, EmailServer.PASSWORD, EmailServer.TYPE_GMAIL);
        if (Eh.sendMail(vkey.getEmail(), "Post Confirmation", vkey.getValidationUrl())) {
            //sendAjaxResponse(this.response,"");
        } else {
            //sendAjaxResponse(this.response,"");
        }
    }

    /**
     * Post an item to login-ed account.
     * @throws JSONException
     * @throws IOException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public void postItemByUser() throws JSONException, IOException, InstantiationException, IllegalAccessException {
        if (new Account(this.request, this.response).checkIsSignIn()) {
            ItemPostedRequest Ipr = loadFromHttpRequest(this.request, ItemPostedRequest.class);
            int userID = Integer.parseInt((String) ((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"));
            String sendJson = objectToJson(Ipr).toString();
            String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + userID + "/items"
                    , sendJson, "POST", (Map) this.request.getSession().getAttribute("Authorization64")));
        }else{
            
        }

    }

    /**
     * Update an item to login-ed account.
     * @throws IOException
     * @throws JSONException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public void updateItemByUser() throws IOException, JSONException, InstantiationException, IllegalAccessException {
        if (new Account(this.request, this.response).checkIsSignIn()) {
            ItemPostedRequest Ipr = loadFromHttpRequest(this.request, ItemPostedRequest.class);
            int userID = Integer.parseInt((String) ((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"));
            int itemID = Integer.parseInt(this.request.getParameter("itemID"));
            String sendJson = objectToJson(Ipr).toString();
            String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + userID + "/items/" + itemID
                    , sendJson, "PUT", (Map) this.request.getSession().getAttribute("Authorization64")));
        }else{
            
        }

    }

}
