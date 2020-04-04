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
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.*;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

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

    public static HttpResponse sendHttpRequest(String _URL, String _Json, String _method, Map _headers) throws UnsupportedEncodingException, IOException{
        //Pre-set Variables
        StringEntity httpEntity = new StringEntity((_Json == null) ? "" : _Json);
        httpEntity.setContentType("application/json");
        HttpResponse response = null;

        //Creating Request and retrieve Response
        switch (_method) {
            case "POST":
                HttpPost postRequest = buildHttpPost(_URL, httpEntity, _headers);
                postRequest.setEntity(httpEntity);
                response = Request(HttpPost.class,postRequest);
                break;
            case "PUT":
                HttpPut putRequest = buildHttpPut(_URL, httpEntity, _headers);
                putRequest.setEntity(httpEntity);
                response = Request(HttpPut.class,putRequest);
                break;
            case "GET":
                HttpGet getRequest = buildHttpGet(_URL, _headers);
                response = Request(HttpGet.class,getRequest);
                break;
        }
        return response;
    }

    public static void sendAjaxResponse(HttpServletResponse _response, String _text) throws IOException {
        _response.setContentType("text/plain");
        _response.setCharacterEncoding("UTF-8");
        _response.getWriter().write(_text);
    }

    public static void forwardRequestWithAttr(HttpServletRequest _request, HttpServletResponse _response, Object _objects, String _attrname, String _to) throws ServletException, IOException {
        _request.setAttribute(_attrname, _objects);
        RequestDispatcher requestDispatcher = _request.getRequestDispatcher(_to);
        requestDispatcher.forward(_request, _response);
    }

    private static HttpPost buildHttpPost(String _URL, StringEntity _httpEntity, Map _headerMaps) {
        HttpPost postRequest = new HttpPost(_URL);
        postRequest.setEntity(_httpEntity);
        if (_headerMaps != null) {
            Iterator itr = _headerMaps.entrySet().iterator();
            while (itr.hasNext()) {
                Entry<String, String> entry = (Entry<String, String>) itr.next();
                postRequest.setHeader(entry.getKey(), entry.getValue());
            }
        }
        return postRequest;
    }
    
    private static HttpPut buildHttpPut(String _URL, StringEntity _httpEntity, Map _headerMaps) {
        HttpPut putRequest = new HttpPut(_URL);
        putRequest.setEntity(_httpEntity);
        if (_headerMaps != null) {
            Iterator itr = _headerMaps.entrySet().iterator();
            while (itr.hasNext()) {
                Entry<String, String> entry = (Entry<String, String>) itr.next();
                putRequest.setHeader(entry.getKey(), entry.getValue());
            }
        }
        return putRequest;
    }

    private static HttpGet buildHttpGet(String _URL, Map _headerMaps) {
        HttpGet getRequest = new HttpGet(_URL);
        if (_headerMaps != null) {
            Iterator itr = _headerMaps.entrySet().iterator();
            while (itr.hasNext()) {
                Entry<String, String> entry = (Entry<String, String>) itr.next();
                getRequest.setHeader(entry.getKey(), entry.getValue());
            }
        }
        return getRequest;
    }

    private static <T> HttpResponse Request(Class<T> _class, Object _httpMethod) throws IOException {
        HttpClient hclient = HttpClientBuilder.create().build();
        switch (_class.getName()) {
            case APACHE_HTTP_POST:
                return hclient.execute((HttpPost) _httpMethod);
            case APACHE_HTTP_PUT:
                return hclient.execute((HttpPut) _httpMethod);
            case APACHE_HTTP_GET:
                return hclient.execute((HttpGet) _httpMethod);
            default:
                throw new RuntimeException("Unknown Http Action");
        }
    }

    public static String getResponseContent(HttpResponse _response) throws IOException {
        responseCheck(_response);
        //Returning Response
        return EntityUtils.toString(_response.getEntity());
    }

    private static void responseCheck(HttpResponse _response) {
        //Handling Response
        if (_response.getStatusLine().getStatusCode() != 200) {
            throw new RuntimeException("Failed Request: error code - "
                    + _response.getStatusLine().getStatusCode());
        }
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
