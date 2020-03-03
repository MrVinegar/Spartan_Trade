package Object;
import java.util.*;

/**
 *
 * @date 2020-3-3 0:59:59
 * @author Yi Qiu
 */
public class EmailvalCode {
    final static int MAX_DIGIT = 999999;
    String email;
    String code;
    long expire_date;

    public EmailvalCode(String _email) {
        Random rnd = new Random();
        Calendar date = Calendar.getInstance(TimeZone.getTimeZone("EST"));
        this.email = _email;
        this.code = String.format("%06d", rnd.nextInt(MAX_DIGIT));
        this.expire_date = date.getTimeInMillis() + 60 * 1000 * 5;//Code expire in 5 minutes
    }

    public String getEmail() {
        return email;
    }

    public String getCode() {
        return code;
    }

    public long getExpire_date() {
        return expire_date;
    }
    
}
