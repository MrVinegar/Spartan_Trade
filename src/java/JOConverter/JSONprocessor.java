package JOConverter;

import com.google.gson.*;
import org.json.*;
import java.lang.reflect.*;
import com.google.gson.reflect.TypeToken;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @date 2020-3-2 22:36:46
 * @author Yi Qiu
 */
public class JSONprocessor {

    public static <T> T jsonToObject(String _jsonString, Class<T> _object) {
        Gson gson = new Gson();
        return gson.fromJson(_jsonString, _object);
    }

    public static <T> T jsonToObject(JSONArray _jsonString, Class<T> _object) {
        String jsonString = _jsonString.toString();
        return jsonToObject(jsonString, _object);
    }
    

    public static <T> T jsonToObject(JSONObject _jsonString, Class<T> _object) {
        String jsonString = _jsonString.toString();
        return jsonToObject(jsonString, _object);
    }

    public static <T> T jsonToObject(String _jsonString, List<T> _object) {
        Type objType = new TypeToken<ArrayList<T>>() {
        }.getType();
        Gson gson = new Gson();
        return gson.fromJson(_jsonString, objType);
    }

    public static <T> JSONObject objectToJson(T _object) throws JSONException {
        Gson gson = new Gson();
        String jsonString = gson.toJson(_object);
        return new JSONObject(jsonString);
    }

    public static <T> JSONArray objectToJson(List<T> _object) throws JSONException {
        Gson gson = new Gson();
        String jsonString = gson.toJson(_object);
        return new JSONArray(jsonString);
    }
    
    public static String getJsonTextFromAPI(String _URL) throws IOException{
            StringBuilder info = new StringBuilder();
            URL api = new URL(_URL);
            URLConnection connection = api.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine = null; 
            while ((inputLine = in.readLine()) != null) {
                info.append(inputLine);
            }
            in.close();
            return in.toString();
    }
}
