package Control.Account;

import Control.ServletBased;
import static Dict.API.USER_API;
import Helper.EmailHandler;
import static Helper.HttpHandler.getResponseContent;
import static Helper.HttpHandler.sendAjaxResponse;
import static Helper.HttpHandler.sendHttpRequest;
import static Helper.JSONprocessor.jsonToObject;
import static Helper.JSONprocessor.objectToJson;
import Object.ValidationKey;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @date 2020-3-1 17:51:03
 * @author Yi Qiu
 */
class Account extends ServletBased {

    public Account(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    public void signUp() throws JSONException, IOException {
        Map json = new HashMap() {
            {
                put("email", request.getParameter("email"));
                put("password", request.getParameter("password"));
            }
        };
        String sendJson = objectToJson(json).toString();
        String jsonResponse = getResponseContent(sendHttpRequest(USER_API, sendJson, "POST", null));
        ValidationKey vkey = jsonToObject(jsonResponse, ValidationKey.class);
        EmailHandler Eh = new EmailHandler("username", "password", "Gmail");
        if (Eh.sendMail(vkey.getEmail(), "Email Validation", vkey.getValidationUrl())) {
            sendAjaxResponse(this.response, "");
        } else {
            sendAjaxResponse(this.response, "");
        }
    }

    public void signIn() throws IOException {
        String ecode = Base64.getEncoder().encodeToString(
                (request.getParameter("email") + ":" + request.getParameter("password")).getBytes()
        );
        Map headerMap = new HashMap() {
            {
                put("Authorization", "Basic " + ecode);
            }
        };
        HttpResponse response = sendHttpRequest(USER_API, null, "POST", headerMap);
        Header authorization = response.getFirstHeader("Set-Cookie");
        String jsonResponse = getResponseContent(response);
    }

}
