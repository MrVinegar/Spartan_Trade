package Control.Trade;

import Dict.API;
import static JOConverter.JSONprocessor.*;
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
public class Trade {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public Trade(HttpServletRequest _request, HttpServletResponse _response) {
        this.request = _request;
        this.response = _response;
    }
    
    public void getHmPagePreviewList() throws IOException {
        String json = getJsonTextFromAPI(API.STPV_API);
        this.sendAjaxResponse(json);
    }
    
    public void getSearchResults(String _category, String _page) throws IOException, ServletException{
        String json = getJsonTextFromAPI(API.STPV_API + _category);
        List STSRlist = new ArrayList<STList_ITEM>();
        ArrayList<STList_ITEM> SearchResult = (ArrayList<STList_ITEM>)jsonToObject(json, STSRlist);
        this.forwardRequestWithAttr(SearchResult, "SearchResult", "Http://Placeholder");
    }
    
    public void getItemDetail(String _itemid) throws IOException, ServletException{
        String json = getJsonTextFromAPI(API.STPV_API + _itemid);
        STList_ITEM ItemDetail = jsonToObject(json, STList_ITEM.class);
        this.forwardRequestWithAttr(ItemDetail, "ItemDetail", "Http://Placeholder");
    }
    
    public void close(){
        this.close();
    }
    
    private void sendAjaxResponse(String _text) throws IOException{
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8"); 
        response.getWriter().write(_text);
    }
    
    private void forwardRequestWithAttr(Object _objects, String _attrname, String _to) throws ServletException, IOException{
        request.setAttribute(_attrname, _objects);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(_to);
        requestDispatcher.forward(request,response);
    }
}
