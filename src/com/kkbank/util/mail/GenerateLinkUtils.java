package com.kkbank.util.mail;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletRequest;

import com.kkbank.domain.User;
import com.kkbank.util.encryption.DESBackup;
import com.kkbank.util.encryption.DES;
import com.kkbank.util.encryption.MD5;

public class GenerateLinkUtils {
	private static final String CHECK_CODE = "checkCode";  
    
    /** 
     * Generate Link to activate account
     * @throws Exception 
     */  
    public static String generateActivateLink(User user) throws Exception {  
    	String id = DES.encrypt(user.getID());
    	System.out.println("encryId:" + id);
        return "http://localhost:8080/KKBank/user/activation?ID=" + id;
                //+ user.getID(); //+ "&" + CHECK_CODE + "=" + generateCheckcode(user);  
    }  
      
    /** 
     * Generate link to reset password
     * @throws Exception 
     */  
    public static String generateResetPwdLink(User user) throws Exception {  
        //return "http://localhost:8080/KKBank/user/verify?ID="
    	String id = DES.encrypt(user.getID());
    	System.out.println("encryId:" + id);
    	return "http://localhost:8080/KKBank/jsp/resetPwd.jsp?ID=" + id;
                //+ user.getID();   
    }   /* + "&" + CHECK_CODE + "=" + generateCheckcode(user); */
                     /*�����url��Ҫ�ĳ�"http://localhost:8080/OnlineClass/auth/resetpassword" ��*/
      
    /** 
     * �����֤�ʻ���MD5У���� 
     * @param user  Ҫ������ʻ� 
     * @return ���û����������Ϻ�ͨ��md5���ܺ��16���Ƹ�ʽ���ַ� 
     */  
    
    public static String generateCheckcode(User user) {  
        String user_id = user.getID();  
        String user_pwd = user.getPwd();  
        return md5(user_id + ":" + user_pwd);  
    }  
     
    /** 
     * ��֤У�����Ƿ��ע��ʱ���͵���֤��һ�� 
     * @param user Ҫ������ʻ� 
     * @param checkcode ע��ʱ���͵�У���� 
     * @return ���һ�·���true�����򷵻�false 
     */  
    //public static boolean verifyCheckcode(User user,ServletRequest request) {  
   //     String checkCode = request.getParameter(CHECK_CODE);  
    //    return generateCheckcode(user).equals(checkCode);  
   // }  
  
    private static String md5(String string) {  
        MessageDigest md = null;  
        try {  
            md = MessageDigest.getInstance("md5");  
            md.update(string.getBytes());  
            byte[] md5Bytes = md.digest();  
            return bytes2Hex(md5Bytes);  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
          
        return null;  
    }  
      
    private static String bytes2Hex(byte[] byteArray)  
    {  
        StringBuffer strBuf = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++)  
        {  
            if(byteArray[i] >= 0 && byteArray[i] < 16)  
            {  
                strBuf.append("0");  
            }  
            strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));  
        }  
        return strBuf.toString();  
    }  

}
