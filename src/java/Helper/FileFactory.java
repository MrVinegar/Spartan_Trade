package Helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
 *
 * @date 2020-4-17 11:28:33
 * @author Yi Qiu
 */
public class FileFactory {

    public static String getMD5(byte[] _file) throws NoSuchAlgorithmException{
        MessageDigest digest =  MessageDigest.getInstance("MD5");
        digest.update(_file);
        BigInteger out = new BigInteger(1,digest.digest());
        String append = "0";
        return (out.toString().length()<16) ? append + out.toString() : out.toString();
    }
    
    public static String getMD5(File _file) throws NoSuchAlgorithmException, IOException{
        InputStream fileinput = new FileInputStream(_file);
        byte[] buffer = new byte[(int)_file.length()];
        fileinput.read(buffer);
        return getMD5(buffer);
    }
    
}
