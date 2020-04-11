package Control.Trade;

import Control.ServletBased;
import Dict.Config.API;
import Dict.Config.Forwarding;
import static Helper.HttpHandler.*;
import static Helper.JSONprocessor.*;
import Object.STList_ITEM;
import Object.STList_SR;
import Object.STPagination;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;

/**
 *
 * @date 2020-3-3 12:07:01
 * @author Yi Qiu
 */
public class TradeItemList extends ServletBased {

    private static final int ITEM_PER_PAGE = 12;

    /**
     * initialize the TradeItemList object.
     *
     * @param _request HttpServletRequest
     * @param _response HttpServletResponse
     */
    public TradeItemList(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    /**
     * Get 5 newest posts in each catagory, return the data in Ajax way.
     *
     * @throws IOException
     * @throws JSONException
     */
    public void getHmPagePreviewList() throws IOException, JSONException {
        String json = getCheckedResponse(this, sendHttpRequest(API.API_DOMAIN + API.STPV_API, null, "GET", null), "Ajax");
        if (json == null) {
            return;
        }
        sendAjaxResponse(this.response, "Success", json);
    }

    /**
     * Get 12 items for pageNo=N, return a STPagination object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getSearchResults() throws IOException, ServletException, JSONException {
        String category = this.request.getParameter("category");
        String page = this.request.getParameter("page");
        String json = getCheckedResponse(this, sendHttpRequest(API.API_DOMAIN + API.STSR_API
                + category + "?pageNo=" + page + "&pageSize=" + ITEM_PER_PAGE, null, "GET", null), "HttpServlet");
        if (json == null) {
            return;
        }
        STPagination SearchResult = jsonToObject(json, STPagination.class);
        SearchResult.deserializeList(STList_SR.class);
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", Forwarding.TO_SEARCH_RESULT);

    }

    /**
     * Get detail infomation of one item base on its item_id, return a
     * STList_ITEM object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getItemDetail() throws IOException, ServletException {
        String itemid = this.request.getParameter("itemid");
        String json = getCheckedResponse(this, sendHttpRequest(API.API_DOMAIN + API.ST_ITEM_DETAIL_API + itemid,
                null, "GET", null), "HttpServlet");
        if (json == null) {
            return;
        }
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "ItemDetail", Forwarding.TO_ITEM_DETAIL);
    }

    /**
     * Get all items for user:user_id, return a ArrayList of STList_SR object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getUserItems() throws IOException, ServletException, JSONException {
        int userID = (int) ((Double) (((Map) this.request.getSession().getAttribute("CurrentUserInfo")).get("userId"))).doubleValue();
        String json = getCheckedResponse(this, sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + userID,
                null, "GET", (Map) this.request.getSession().getAttribute("Authorization64")), "HttpServlet");
        if (json == null) {
            return;
        }
        STPagination SearchResult = jsonToObject(json, STPagination.class);
        SearchResult.deserializeList(STList_ITEM.class);
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", Forwarding.TO_USER_ITEMLIST);
    }

    /**
     * Get a specific item base on its item_id for user:user_id, return a
     * STList_ITEM object.
     *
     * @throws IOException
     * @throws ServletException
     */
    public void getTargetUserItem() throws IOException, ServletException {
        String userid = this.request.getParameter("userid");
        int itemID = Integer.parseInt(this.request.getParameter("itemID"));
        String json = getCheckedResponse(this, sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + userid + "/items/" + itemID,
                null, "GET", (Map) this.request.getSession().getAttribute("Authorization64")), "HttpServlet");
        if (json == null) {
            return;
        }
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "SearchResult", Forwarding.TO_USER_ITEM_DETAIL);
    }
}
