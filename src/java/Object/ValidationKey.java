/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Object;

/**
 *
 * @date 2020-3-5 13:58:41
 * @author Yi Qiu
 */
public class ValidationKey {

    private String validationKey;

    private int entityId;

    private String email;

    private int validationId;

    private String validationType;

    public void setValidationKey(String _validationKey) {
        this.validationKey = _validationKey;
    }

    public String getValidationKey() {
        return this.validationKey;
    }

    public void setEntityId(int _entityId) {
        this.entityId = _entityId;
    }

    public int getEntityId() {
        return this.entityId;
    }

    public void setEmail(String _email) {
        this.email = _email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setValidationId(int _validationId) {
        this.validationId = _validationId;
    }

    public int getValidationId() {
        return this.validationId;
    }

    public void setValidationType(String _validationType) {
        this.validationType = _validationType;
    }

    public String getValidationType() {
        return this.validationType;
    }
}
