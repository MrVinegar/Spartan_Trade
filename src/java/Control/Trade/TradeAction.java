package Control.Trade;

import Control.ServletBased;
import Dict.API;
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
 * @date 2020-3-3 12:07:01
 * @author Yi Qiu
 */
public class TradeAction extends ServletBased {

    public TradeAction(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    public static void postItemDefault() throws InstantiationException, IllegalAccessException, JSONException, IOException {
        ItemPostedRequest Ipr = new ItemPostedRequest();
        String sendJson = objectToJson(Ipr).toString();
        String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.ST_ITEM_DETAIL_API, sendJson, "POST", null));
        ValidationKey vkey = jsonToObject(jsonResponse, ValidationKey.class);
        EmailHandler Eh = new EmailHandler("username", "password", "Gmail");
        if (Eh.sendMail(vkey.getEmail(), "Post Confirmation", vkey.getValidationUrl())) {
            //sendAjaxResponse(this.response,"");
        } else {
            //sendAjaxResponse(this.response,"");
        }
    }

    public static void postItemByUser(ItemPostedRequest _Ipr, int _userID) throws JSONException, IOException {
        String sendJson = objectToJson(_Ipr).toString();
        String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + _userID + "/items", sendJson, "POST", null));
    }

    public static void updateItemByUser(ItemPostedRequest _Ipr, int _userID) throws IOException, JSONException {
        String sendJson = objectToJson(_Ipr).toString();
        String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + _userID + "/items" + "", sendJson, "PUT", null));
    }

}
