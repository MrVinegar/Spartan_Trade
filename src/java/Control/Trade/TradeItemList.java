package Control.Trade;

import Dict.API;
import static Helper.HttpHandler.*;
import static Helper.JSONprocessor.*;
import Object.STList_ITEM;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @date 2020-3-3 12:07:01
 * @author Yi Qiu
 */
public class TradeItemList extends Trade {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public TradeItemList(HttpServletRequest _request, HttpServletResponse _response) {
        super(_request, _response);
    }
    
    public void getHmPagePreviewList() throws IOException {
        String json = sendHttpRequest(API.STPV_API, null, "GET");
        sendAjaxResponse(this.response,json);
    }
    
    public void getSearchResults(String _category, String _page) throws IOException, ServletException{
        String json = sendHttpRequest(API.STSR_API + _category, null, "GET");
        List STSRlist = new ArrayList<STList_ITEM>();
        ArrayList<STList_ITEM> SearchResult = (ArrayList<STList_ITEM>)jsonToObject(json, STSRlist);
        forwardRequestWithAttr(this.request, this.response, SearchResult, "SearchResult", "Http://Placeholder");
    }
    
    public void getItemDetail(String _itemid) throws IOException, ServletException{
        String json = sendHttpRequest(API.ST_ITEM_DETAIL_API + _itemid, null, "GET");
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        forwardRequestWithAttr(this.request, this.response, ItemDetail, "ItemDetail", "Http://Placeholder");
    }
    
}
