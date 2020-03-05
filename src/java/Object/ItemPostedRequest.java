/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

/**
 *
 * @date 2020-3-5 13:57:04
 * @author Yi Qiu
 */
public class ItemPostedRequest {

    private String title;

    private String description;

    private String phone;

    private String contactMethod;

    private int categoryId;

    private String userId;

    private String hasImage;

    private String email;

    public void setTitle(String _title) {
        this.title = _title;
    }

    public String getTitle() {
        return this.title;
    }

    public void setDescription(String _description) {
        this.description = _description;
    }

    public String getDescription() {
        return this.description;
    }

    public void setPhone(String _phone) {
        this.phone = _phone;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setContactMethod(String _contactMethod) {
        this.contactMethod = _contactMethod;
    }

    public String getContactMethod() {
        return this.contactMethod;
    }

    public void setCategoryId(int _categoryId) {
        this.categoryId = _categoryId;
    }

    public int getCategoryId() {
        return this.categoryId;
    }

    public void setUserId(String _userId) {
        this.userId = _userId;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setHasImage(String _hasImage) {
        this.hasImage = _hasImage;
    }

    public String getHasImage() {
        return this.hasImage;
    }

    public void setEmail(String _email) {
        this.email = _email;
    }

    public String getEmail() {
        return this.email;
    }
}
