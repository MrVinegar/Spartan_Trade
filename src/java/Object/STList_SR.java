/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Object;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @date 2020-3-21 18:32:30
 * @author Yi Qiu
 */
public class STList_SR {
    public int itemId;
    public int imageCount;
    public Date updatedDate;
    public String title;

    public STList_SR() {
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int _itemId) {
        this.itemId = _itemId;
    }

    public int getImageCount() {
        return imageCount;
    }

    public void setImageCount(int _imageCount) {
        this.imageCount = _imageCount;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String _updatedDate) throws ParseException {
        this.updatedDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(_updatedDate);  
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String _title) {
        this.title = _title;
    }
    
    
}
