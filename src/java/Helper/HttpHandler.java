/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import static Dict.TypeIdentifier.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.*;
import java.net.URL;
import java.net.URLConnection;
import javax.servlet.http.HttpSession;

/**
 *
 * @date 2020-3-5 15:07:23
 * @author Yi Qiu
 */
public class HttpHandler {

    public static <T> T loadFromHttpRequest(HttpServletRequest _request, Class<T> _object) throws InstantiationException, IllegalAccessException {
        T ret = _object.newInstance();
        Field[] field = _object.getDeclaredFields();
        for (Field f : field) {
            f.set(ret, castHelper(f.getClass(), _request.getParameter(f.getName())));
        }
        return ret;
    }

    public static HttpServletRequest addToHttpRequest(HttpServletRequest _request, Object _object) throws InstantiationException, IllegalAccessException {
        Class clas = _object.getClass();
        Field[] field = clas.getDeclaredFields();
        for (Field f : field) {
            _request.setAttribute(f.getName(), f.get(_object));    
        }
        return _request;
    }
    
    public static void addToHttpSession(HttpServletRequest _request, Object _object) throws InstantiationException, IllegalAccessException {
        HttpSession session = _request.getSession();
        Class clas = _object.getClass();
        Field[] field = clas.getDeclaredFields();
        for (Field f : field) {
            session.setAttribute(f.getName(), f.get(_object));    
        }
    }
    
    public static String sendJsonHttpRequest(String _URL, String _Json, String _method){

        return null;
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
    
    private static Object castHelper(Class _attrType, String _from) {
        try {
            switch (_attrType.toString()) {
                case INT:
                    return Integer.parseInt(_from);
                case BOOLEAN:
                    return Boolean.parseBoolean(_from);
                case STRING:
                    return _from;
                case LONG:
                    return Long.parseLong(_from);
                case SHORT:
                    return Short.parseShort(_from);
                case FLOAT:
                    return Float.parseFloat(_from);
                case DOUBLE:
                    return Double.parseDouble(_from);
                case CHAR:
                    return (_from.length() <= 1) ? _from.charAt(0) : null;
                case BYTE:
                    return (_from.length() <= 1) ? _from.getBytes() : null;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
}
