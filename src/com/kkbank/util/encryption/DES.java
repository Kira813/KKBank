package com.kkbank.util.encryption;

import java.security.SecureRandom;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.SecretKeyFactory;
import javax.crypto.SecretKey;
import javax.crypto.Cipher;

public class DES {  
    /** ���ܡ�����key. */  
    private static final String PASSWORD_CRYPT_KEY = "kEHrDooxWHCWtfeSxvDvgqZq";  
    
    /** ����<a href="http://lib.csdn.net/base/31" class='replace_word' title="�㷨�����ݽṹ֪ʶ��" target='_blank' style='color:#df3434; font-weight:bold;'>�㷨</a>,���� DES,DESede,Blowfish. */  
    private final static String ALGORITHM = "DES";  
    
    //testing
    public static void main(String[] args) throws Exception {  
        //String md5Password = "202cb962ac59075b964b07152d234b70";  
        String md5Password = "112233";
    	String str = DES.encrypt(md5Password);  
        System.out.println("str: " + str);  
        str = DES.decrypt(str);  
        System.out.println("str: " + str);  
    }  
      
    /** 
     * �����ݽ���DES����. 
     * @param data ������DES���ܵ����� 
     * @return ���ؾ���DES���ܺ������ 
     * @throws Exception 
     */  
    public final static String decrypt(String data) throws Exception {  
        return new String(decrypt(hex2byte(data.getBytes()),  
                PASSWORD_CRYPT_KEY.getBytes()));  
    } 
    
    /** 
     * ����DES���ܹ������ݽ��н���. 
     * @param data DES�������� 
     * @return ���ؽ��ܺ������ 
     * @throws Exception 
     */  
    public final static String encrypt(String data) throws Exception  {  
        return byte2hex(encrypt(data.getBytes(), PASSWORD_CRYPT_KEY  
                .getBytes()));  
    }  
      
    /** 
     * ��ָ����key�����ݽ���DES����. 
     * @param data �����ܵ����� 
     * @param key DES���ܵ�key 
     * @return ����DES���ܺ������ 
     * @throws Exception 
     */  
    private static byte[] encrypt(byte[] data, byte[] key) throws Exception {  
        // DES�㷨Ҫ����һ�������ε������Դ  
        SecureRandom sr = new SecureRandom();  
        // ��ԭʼ�ܳ����ݴ���DESKeySpec����  
        DESKeySpec dks = new DESKeySpec(key);  
        // ����һ���ܳ׹�����Ȼ��������DESKeySpecת����  
        // һ��SecretKey����  
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);  
        SecretKey securekey = keyFactory.generateSecret(dks);  
        // Cipher����ʵ����ɼ��ܲ���  
        Cipher cipher = Cipher.getInstance(ALGORITHM);  
        // ���ܳ׳�ʼ��Cipher����  
        cipher.init(Cipher.ENCRYPT_MODE, securekey, sr);  
        // ���ڣ���ȡ���ݲ�����  
        // ��ʽִ�м��ܲ���  
        return cipher.doFinal(data);  
    }  
    
    /** 
     * ��ָ����key�����ݽ���DES����. 
     * @param data �����ܵ����� 
     * @param key DES���ܵ�key 
     * @return ����DES���ܺ������ 
     * @throws Exception 
     */  
    private static byte[] decrypt(byte[] data, byte[] key) throws Exception {  
        // DES�㷨Ҫ����һ�������ε������Դ  
        SecureRandom sr = new SecureRandom();  
        // ��ԭʼ�ܳ����ݴ���һ��DESKeySpec����  
        DESKeySpec dks = new DESKeySpec(key);  
        // ����һ���ܳ׹�����Ȼ��������DESKeySpec����ת����  
        // һ��SecretKey����  
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);  
        SecretKey securekey = keyFactory.generateSecret(dks);  
        // Cipher����ʵ����ɽ��ܲ���  
        Cipher cipher = Cipher.getInstance(ALGORITHM);  
        // ���ܳ׳�ʼ��Cipher����  
        cipher.init(Cipher.DECRYPT_MODE, securekey, sr);  
        // ���ڣ���ȡ���ݲ�����  
        // ��ʽִ�н��ܲ���  
        return cipher.doFinal(data);  
    }  
    
    public static byte[] hex2byte(byte[] b) {  
        if ((b.length % 2) != 0)  
            throw new IllegalArgumentException("The length is not even");  //���Ȳ���ż�������쳣
        byte[] b2 = new byte[b.length / 2];  
        for (int n = 0; n < b.length; n += 2) {  
            String item = new String(b, n, 2);  
            b2[n / 2] = (byte) Integer.parseInt(item, 16);  
        }  
        return b2;  
    }  
    
    public static String byte2hex(byte[] b) {  
        String hs = "";  
        String stmp = "";  
        for (int n = 0; n < b.length; n++) {  
            stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));  
            if (stmp.length() == 1)  
                hs = hs + "0" + stmp;  
            else  
                hs = hs + stmp;  
        }  
        return hs.toUpperCase();  
    }  
}  
