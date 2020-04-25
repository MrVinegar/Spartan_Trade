package Control.Trade;

import Control.Account.Account;
import Control.ServletBased;
import Dict.ServerENUM;
import Helper.EmailHandler;
import static Helper.FileFactory.servletFileUpload;
import static Helper.HttpHandler.*;
import static Helper.JSONprocessor.*;
import Object.ItemPostedRequest;
import Object.STList_ITEM;
import Object.ValidationKey;
import java.io.IOException;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
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
     *
     * @param _request
     * @param _response
     */
    public TradeAction(ServletConfig _config, HttpServletRequest _request, HttpServletResponse _response) {
        super(_config, _request, _response);
    }

    /**
     * Post an item without login, return results in Ajax way.
     *
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws JSONException
     * @throws IOException
     */
    public void postItemDefault() throws InstantiationException, IllegalAccessException, JSONException, IOException, ServletException {
        ItemPostedRequest Ipr = loadFromHttpRequest(this.request, ItemPostedRequest.class);
        String sendJson = objectToJson(Ipr).toString();
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(1);
        String jsonResponse = getCheckedResponse(this, sendHttpRequest(url, sendJson, "POST", null), "Ajax");
        if (jsonResponse == null) {
            return;
        }
        ValidationKey vkey = jsonToObject(jsonResponse, ValidationKey.class);
        EmailHandler Eh = new EmailHandler(ServerENUM.getContent(101), ServerENUM.getContent(102), ServerENUM.getContent(103));
        if (Eh.sendMail(vkey.getEmail(), "Post Confirmation", vkey.getValidationUrl())) {

            sendAjaxResponse(this.response, "Success", "");
        } else {
            sendAjaxResponse(this.response, "Error", "Send Validation Email Failed.");
        }
    }

    /**
     * Post an item to login-ed account.
     *
     * @throws JSONException
     * @throws IOException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public void postItemByUser() throws JSONException, IOException, InstantiationException, IllegalAccessException, ServletException {
        if (new Account(this.config, this.request, this.response).checkIsSignIn()) {
            ItemPostedRequest Ipr = loadFromHttpRequest(this.request, ItemPostedRequest.class);
            int userID = (int) ((Double) (((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"))).doubleValue();
            String sendJson = objectToJson(Ipr).toString();
            String url = ServerENUM.getContent(0) + ServerENUM.getContent(2) + userID + ServerENUM.getContent(1);
            String jsonResponse = getCheckedResponse(this, sendHttpRequest(url, sendJson, "POST", (Map) this.request.getSession().getAttribute("Authorization64")), "Ajax");
            if (jsonResponse == null) {
                return;
            }

            uploadImageU(jsonResponse);
        } else {
            sendAjaxResponse(this.response, "Error", "Try login first.");
        }

    }

    /**
     * Update an item to login-ed account.
     *
     * @throws IOException
     * @throws JSONException
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    public void updateItemByUser() throws IOException, JSONException, InstantiationException, IllegalAccessException, ServletException {
        if (new Account(this.config, this.request, this.response).checkIsSignIn()) {
            STList_ITEM STI = loadFromHttpRequest(this.request, STList_ITEM.class);
            int userID = (int) ((Double) (((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"))).doubleValue();
            int itemID = Integer.parseInt(this.request.getParameter("itemId"));
            String sendJson = objectToJson(STI).toString();
            String url = ServerENUM.getContent(0) + ServerENUM.getContent(2) + userID + ServerENUM.getContent(1) + itemID;
            String jsonResponse = getCheckedResponse(this, sendHttpRequest(url, sendJson, "PUT", (Map) this.request.getSession().getAttribute("Authorization64")), "Ajax");
            if (jsonResponse == null) {
                return;
            }
            sendAjaxResponse(this.response, "Success", "");
        } else {
            sendAjaxResponse(this.response, "Error", "Try login first.");
        }

    }
    
    public void deleteItemByUser() throws IOException, ServletException, JSONException{
        if (new Account(this.config, this.request, this.response).checkIsSignIn()) {
            int userID = (int) ((Double) (((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"))).doubleValue();
            int itemID = Integer.parseInt(this.request.getParameter("itemId"));
            String url = ServerENUM.getContent(0) + ServerENUM.getContent(2) + userID + ServerENUM.getContent(1) + itemID;
            String jsonResponse = getCheckedResponse(this, sendHttpRequest(url, null, "DELETE", (Map) this.request.getSession().getAttribute("Authorization64")), "Ajax");
            if (jsonResponse == null) {
                return;
            }
            sendAjaxResponse(this.response, "Success", "Item #" + itemID + " deleted");
        } else {
            sendAjaxResponse(this.response, "Error", "Try login first.");
        }  
    }

    public void uploadImageU(String _itemId) throws ServletException, IOException, JSONException{
        String AllowedFilesList = "jpg,png,bmp";
        if(servletFileUpload(this.request, AllowedFilesList)){
//            String to = objectToJson(this.request.getSession().getAttribute("successList")).toString();
//            String json = objectToJson(this.request.getSession().getAttribute("failList")).toString();
            sendAjaxResponse(this.response, "Success", "");
        }else{
//            String json = objectToJson(this.request.getSession().getAttribute("failList")).toString();
            sendAjaxResponse(this.response, "Error", "");
        }
        
    }

    private static String getCode() {
        Random rand = new Random();
        return String.format("%06d", rand.nextInt(999999));
    }

}
