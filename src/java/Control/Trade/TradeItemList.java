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
    
    public TradeItemList(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }

    public void getHmPagePreviewList() throws IOException, JSONException {
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.STPV_API, null, "GET",null));
        sendAjaxResponse(this.response,"", json);
    }

    public void getSearchResults() throws IOException, ServletException {
        String category = this.request.getParameter("category");
        String page = this.request.getParameter("page");
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.STSR_API + 
                category + "?pageNo=" + page + "&pageSize=" + ITEM_PER_PAGE, null, "GET",null));
        STPagination SearchResult = jsonToObject(json, STPagination.class);
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", "Http://Placeholder");
    }

    public void getItemDetail() throws IOException, ServletException {
        String itemid = this.request.getParameter("itemid");
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.ST_ITEM_DETAIL_API + itemid,
                null, "GET",null));
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "ItemDetail", "Http://Placeholder");
    }

    public void getUserItems() throws IOException, ServletException{
        String userid = this.request.getParameter("userid");
        String json = getResponseContent(sendHttpRequest(API.API_DOMAIN + API.USER_API + "/" + userid,
                null, "GET", (Map)this.request.getSession().getAttribute("Authorization64")));
        List STSRlist = new ArrayList<STList_SR>();
        ArrayList<STList_SR> SearchResult = (ArrayList<STList_SR>) jsonToObject(json, STSRlist);
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", "Http://Placeholder");
    }
    
    
}
