import static JOConverter.JSONprocessor.*;
import Object.*;
import java.util.*;
import org.json.JSONException;

/**
 *
 * @date 2020-3-2 23:53:34
 * @author Yi Qiu
 */
public class Test {

    public static void main(String[] args) throws JSONException {
//        TestCase1();
        TestCase2();
//        TestCase3();
    }

    public static void TestCase1() throws JSONException {
        STList_PV stlist = new STList_PV();
        String json = " {\n"
                + "        \"catetoryId\": 1,\n"
                + "        \"itemId\": 3001,\n"
                + "        \"title\": \"Title Sample\",\n"
                + "        \"rowNumber\": 1\n"
                + "    }";
        stlist = jsonToObject(json, STList_PV.class);
        System.out.print(objectToJson(stlist));
    }

    public static void TestCase2() throws JSONException {
        List STLPVlist = new ArrayList<STList_PV>();
        String json = "[\n"
                + "    {\n"
                + "        \"catetoryId\": 1,\n"
                + "        \"itemId\": 3001,\n"
                + "        \"title\": \"Title Sample\",\n"
                + "        \"rowNumber\": 1\n"
                + "    },\n"
                + "    {\n"
                + "        \"catetoryId\": 2,\n"
                + "        \"itemId\": 3023,\n"
                + "        \"title\": \"Title 123\",\n"
                + "        \"rowNumber\": 1\n"
                + "    },\n"
                + "    {\n"
                + "        \"catetoryId\": 2,\n"
                + "        \"itemId\": 3022,\n"
                + "        \"title\": \"Title Sample\",\n"
                + "        \"rowNumber\": 2\n"
                + "    },\n"
                + "    {\n"
                + "        \"catetoryId\": 2,\n"
                + "        \"itemId\": 3020,\n"
                + "        \"title\": \"Title Sample 222\",\n"
                + "        \"rowNumber\": 3\n"
                + "    },\n"
                + "	    {\n"
                + "        \"catetoryId\": 3,\n"
                + "        \"itemId\": 3089,\n"
                + "        \"title\": \"Sample Title 223232\",\n"
                + "        \"rowNumber\": 1\n"
                + "    },\n"
                + "	    {\n"
                + "        \"catetoryId\": 4,\n"
                + "        \"itemId\": 3082,\n"
                + "        \"title\": \"Test Title 219210\",\n"
                + "        \"rowNumber\": 2\n"
                + "    },\n"
                + "	    {\n"
                + "        \"catetoryId\": 4,\n"
                + "        \"itemId\": 3081,\n"
                + "        \"title\": \"Test Title AAABBBCCC\",\n"
                + "        \"rowNumber\": 3\n"
                + "    }\n"
                + "]";
        STLPVlist = (ArrayList<STList_PV>) jsonToObject(json, STLPVlist);
        System.out.print(objectToJson(STLPVlist));
    }
    
    public static void TestCase3() throws JSONException{
        EmailvalCode ec = new EmailvalCode("Example@uncg.edu");
        System.out.print(objectToJson(ec));
    }
}
