
import Dict.API;
import static Dict.API.ST_ITEM_DETAIL_API;
import Dict.EmailServer;
import Helper.EmailHandler;
import static Helper.HttpHandler.getResponseContent;
import static Helper.HttpHandler.sendHttpRequest;
import static Helper.JSONprocessor.*;
import Object.*;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import org.json.JSONException;

/**
 *
 * @date 2020-3-2 23:53:34
 * @author Yi Qiu
 */
public class Test {

    public static void main(String[] args) throws Exception {
//        postItem();
//        getHmPagePreviewList();
//        getSearchResults();
        getItemDetail();
//        signUp();
//        getUserItems();
    }

    public static void postItem() throws InstantiationException, IllegalAccessException, JSONException, IOException {
        ItemPostedRequest Ipr = new ItemPostedRequest();
        Ipr.setEmail("y_qiu2@uncg.edu");
        System.out.println(objectToJson(Ipr));
        String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + ST_ITEM_DETAIL_API, objectToJson(Ipr).toString(), "POST", null));
        ValidationKey vkey = jsonToObject(jsonResponse, ValidationKey.class);
        EmailHandler Eh = new EmailHandler(EmailServer.USERNAME, EmailServer.PASSWORD, EmailServer.TYPE_GMAIL);
        if (Eh.sendMail(vkey.getEmail(), "Post Confirmation", vkey.getValidationUrl())) {
            System.out.println("Success!");
        } else {
            System.out.println("Failed!");
        }
        return;
    }

    public static void getHmPagePreviewList() throws IOException {
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.STPV_API, null, "GET", null));
        System.out.println(json);
    }

    public static void getSearchResults() throws IOException, ServletException {
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.STSR_API + 1, null, "GET", null));
        System.out.println(json);
        List STSRlist = new ArrayList<STList_SR>();
        ArrayList<STList_SR> SearchResult = (ArrayList<STList_SR>) jsonToObject(json, STSRlist);
        return;
    }

    public static void getItemDetail() throws IOException, ServletException {
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.ST_ITEM_DETAIL_API + 20040, null, "GET", null));
        System.out.println(json);
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        return;
    }

    public static void signUp() throws JSONException, IOException {
        Map json = new HashMap<String, String>();
        json.put("email", "y_qiu2@uncg.edu");
        json.put("password", "testacc");

        String sendJson = objectToJson(json).toString();
        String jsonResponse = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.REGISTER_API, sendJson, "POST", null));
        ValidationKey vkey = jsonToObject(jsonResponse, ValidationKey.class);
        EmailHandler Eh = new EmailHandler(EmailServer.USERNAME, EmailServer.PASSWORD, EmailServer.TYPE_GMAIL);
        if (Eh.sendMail(vkey.getEmail(), "Email Validation", vkey.getValidationUrl())) {
            System.out.println("Success!");
        } else {
            System.out.println("Failed!");
        }
    }

    public static void getUserItems() throws IOException, ServletException {
        System.out.println(API.API_DOMAIN + API.USER_API + "/" + 50020);
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + 50020, null, "GET", null));
        System.out.println(json);
        List STSRlist = new ArrayList<STList_SR>();
        ArrayList<STList_SR> SearchResult = (ArrayList<STList_SR>) jsonToObject(json, STSRlist);
        return;
    }

}
