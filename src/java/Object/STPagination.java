/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import static Helper.JSONprocessor.jsonToObject;
import static Helper.JSONprocessor.objectToJson;
import java.util.List;
import org.json.JSONException;

/**
 *
 * @date 2020-4-5 2:20:37
 * @author Yi Qiu
 */
public class STPagination {

    private int totalElements;

    private int totalPages;

    private int size;

    private int currentPage;

    private List<Object> content;

    private boolean isSerialized = false;

    public int getTotalElements() {
        return totalElements;
    }

    public void setTotalElements(int _totalElements) {
        this.totalElements = _totalElements;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int _totalPages) {
        this.totalPages = _totalPages;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int _size) {
        this.size = _size;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int _currentPage) {
        this.currentPage = _currentPage;
    }

    public List<Object> getContent() {
        return content;
    }

    public void setContent(List<Object> _content) {
        this.content = _content;
    }

    public <T> void deserializeList(Class<T> _toType) {
        if (isSerialized) {
            throw new IllegalArgumentException("isSerialized can not be true");
        }

        for (Object o : content) {
            o = jsonToObject((String) o, _toType);
        }

        this.isSerialized = true;
    }

    public void serializeList() throws JSONException {
        if (isSerialized) {
            throw new IllegalArgumentException("isSerialized can not be false");
        }

        for (Object o : content) {
            o = objectToJson(o);
        }

        this.isSerialized = false;
    }
}
