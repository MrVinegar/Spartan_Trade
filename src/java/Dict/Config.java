/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dict;

/**
 *
 * @date 2020-4-11 3:05:43
 * @author Yi Qiu
 */
public class Config {

    public class API {

        public final static String API_DOMAIN = "http://ec2-3-93-23-132.compute-1.amazonaws.com:8080/";
        public final static String STPV_API = "items/top5";
        public final static String STSR_API = "items/category/";
        public final static String ST_ITEM_DETAIL_API = "items/";
        public final static String USER_API = "users";
        public final static String REGISTER_API = "register";
        public final static String LOGIN_API = "login";
    }

    public class EmailServer {

        public final static String USERNAME = "SpartanTrade2020";
        public final static String PASSWORD = "SpartanTrade2020A";
        public final static String TYPE_GMAIL = "Gmail";
    }
    
    public class Forwarding{
        public final static String TO_ERROR = "placeholder";
        public final static String TO_SEARCH_RESULT = "CategoryPage.jsp";
        public final static String TO_ITEM_DETAIL = "FullDescription.jsp";
        public final static String TO_USER_ITEMLIST = "order-history.jsp";
        public final static String TO_USER_ITEM_DETAIL = "placeholder";
    }

}
