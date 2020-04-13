package Control.Account;

import Control.ServletBased;
import Dict.Config.ServerENUM;
import Helper.EmailHandler;
import static Helper.HttpHandler.getCheckedResponse;
import static Helper.HttpHandler.sendAjaxResponse;
import static Helper.HttpHandler.sendHttpRequest;
import static Helper.JSONprocessor.jsonToObject;
import static Helper.JSONprocessor.objectToJson;
import Object.ValidationKey;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

/**
 *
 * @date 2020-3-1 17:51:03
 * @author Yi Qiu
 */
public class Account extends ServletBased {

    public Account(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }
    
    /**
     * Sign up a account, returns result in Ajax way.
     *
     * @throws IOException
     * @throws JSONException
     */
    public void signUp() throws IOException, JSONException, ServletException {
        Map json = new HashMap();
        json.put("email", this.request.getParameter("email"));
        json.put("password", this.request.getParameter("password"));
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(4);
        String sendJson = objectToJson(json).toString();
        String jsonResponse = getCheckedResponse(this, sendHttpRequest(url, sendJson, "POST", null), "Ajax");
        if (jsonResponse == null) {
            return;
        }

        ValidationKey vkey = jsonToObject(jsonResponse, ValidationKey.class);
        EmailHandler Eh = new EmailHandler(ServerENUM.getContent(101), ServerENUM.getContent(102), ServerENUM.getContent(103));
        if (Eh.sendMail(vkey.getEmail(), "Email Validation", vkey.getValidationUrl())) {
            sendAjaxResponse(this.response, "Redirect", request.getContextPath() + "/AccountCreated.html");
        } else {
            sendAjaxResponse(this.response, "Error", "Oops, something went wrong.");
        }
    }

    /**
     * User login, returns result in Ajax way.
     *
     * @throws IOException
     * @throws JSONException
     */
    public void signIn() throws IOException, JSONException, ServletException {
        if (checkIsSignIn()) {
            sendAjaxResponse(this.response, "Error", "You can't have two accounts login at the same time.");
            return;
        }

        String ecode = Base64.getEncoder().encodeToString(
                (request.getParameter("email") + ":" + request.getParameter("password")).getBytes()
        );
        Map headerMap = new HashMap();
        headerMap.put("Authorization", "Basic " + ecode);
        String url = ServerENUM.getContent(0) + ServerENUM.getContent(3);
        String jsonResponse = getCheckedResponse(this, sendHttpRequest(url, null, "POST", headerMap), "Ajax");
        if (jsonResponse == null) {
            return;
        }        
        Map responseBody = jsonToObject(jsonResponse, Map.class);
        if (checkSignInResponse(responseBody)) {
            this.request.getSession().setAttribute("Authorization64", headerMap);
            this.request.getSession().setAttribute("CurrentUserInfo", responseBody);
            sendAjaxResponse(this.response, "Redirect", request.getContextPath() + "/Search?code=URSR");
        } else {
            sendAjaxResponse(this.response, "Failed", "Oops, something went wrong.");
        }
    }
    
    /**
     * logoff.
     */
    public void logOff() throws IOException {
        this.request.getSession().removeAttribute("Authorization64");
        this.request.getSession().removeAttribute("CurrentUserInfo");
        this.response.sendRedirect("index.jsp");
    }

    /**
     * Check is there an user already signIn.
     *
     * @return a boolean value represents the login status.
     */   
    public boolean checkIsSignIn() {
        if (this.request.getSession().getAttribute("Authorization64") == null) {
            return false;
        }

        if (this.request.getSession().getAttribute("CurrentUserInfo") == null) {
            return false;
        }

        return true;
    }

    /**
     * Check is the SignIn response valid.
     *
     * @return a boolean value represents signIn validation result.
     */
    private boolean checkSignInResponse(Map _responseBody) {
        if (_responseBody.get("userId") == null) {
            return false;
        }

        if (!_responseBody.get("status").equals("V")) {
            return false;
        }

        return true;
    }

}
