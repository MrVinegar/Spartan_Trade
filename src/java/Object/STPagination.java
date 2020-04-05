/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

import java.util.List;

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
    
    private List<Object> content ;

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
    
    
}
