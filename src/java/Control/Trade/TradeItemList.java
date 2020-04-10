package Control.Trade;

import Control.ServletBased;
import Dict.API;
import static Helper.HttpHandler.*;
import static Helper.JSONprocessor.*;
import Object.STList_ITEM;
import Object.STList_SR;
import Object.STPagination;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
     * @param _request HttpServletRequest
     * @param _response HttpServletResponse
     */
    public TradeItemList(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    /**
     * Get 5 newest posts in each catagory, return the data in Ajax way.
     * @throws IOException
     * @throws JSONException
     */
    public void getHmPagePreviewList() throws IOException, JSONException {
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.STPV_API, null, "GET",null));
        sendAjaxResponse(this.response,"", json);
    }

    /**
     * Get 12 items for pageNo=N, return a STPagination object.
     * @throws IOException
     * @throws ServletException
     */
    public void getSearchResults() throws IOException, ServletException {
        String category = this.request.getParameter("category");
        String page = this.request.getParameter("page");
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.STSR_API + 
                category + "?pageNo=" + page + "&pageSize=" + ITEM_PER_PAGE, null, "GET",null));
        STPagination SearchResult = jsonToObject(json, STPagination.class);
        SearchResult.deserializeList(STList_SR.class);
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", "Http://Placeholder");
    }

    /**
     * Get detail infomation of one item base on its item_id,
     * return a STList_ITEM object.
     * @throws IOException
     * @throws ServletException
     */
    public void getItemDetail() throws IOException, ServletException {
        String itemid = this.request.getParameter("itemid");
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.ST_ITEM_DETAIL_API + itemid,
                null, "GET",null));
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "ItemDetail", "Http://Placeholder");
    }

    /**
     * Get all items for user:user_id, return a ArrayList of STList_SR object.
     * @throws IOException
     * @throws ServletException
     */
    public void getUserItems() throws IOException, ServletException{
        String userid = this.request.getParameter("userid");
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + userid,
                null, "GET", (Map)this.request.getSession().getAttribute("Authorization64")));
        List STSRlist = new ArrayList<STList_SR>();
        ArrayList<STList_SR> SearchResult = (ArrayList<STList_SR>) jsonToObject(json, STSRlist);
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", "Http://Placeholder");
    }
    
    /**
     * Get a specific item base on its item_id for user:user_id,
     * return a STList_ITEM object.
     * @throws IOException
     * @throws ServletException
     */
    public void getTargetUserItem() throws IOException, ServletException{
        String userid = this.request.getParameter("userid");
        int itemID = Integer.parseInt(this.request.getParameter("itemID"));
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + userid + "/items/" + itemID,
                null, "GET", (Map)this.request.getSession().getAttribute("Authorization64")));
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "SearchResult", "Http://Placeholder");
    }
    
}
