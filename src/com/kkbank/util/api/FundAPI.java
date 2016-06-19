package com.kkbank.util.api;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.kkbank.business.service.IFundService;
import com.kkbank.business.service.impl.FundService;
import com.kkbank.domain.Fund;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
 
/**
*净值数据调用示例代码 － 聚合数据
*在线接口文档：http://www.juhe.cn/docs/25
**/
 
public class FundAPI {
	Fund fund = new Fund();
	IFundService fundService = new FundService();
	
    public static final String DEF_CHATSET = "UTF-8";
    public static final int DEF_CONN_TIMEOUT = 30000;
    public static final int DEF_READ_TIMEOUT = 30000;
    public static String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
 
    //配置您申请的KEY
    public static final String APPKEY ="aecdd529a001465b9256f2b9425cb451";
    
    //1.全部开放基金
    /*public void getRequest1(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/all";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
            	System.out.println(object.get("result"));
            	
            	JSONArray res = object.getJSONArray("result");
                
            	for(int i = 0; i< res.size(); i++){
        			fund.setfCode(res.getJSONObject(i).get("code").toString());
        			System.out.println(res.getJSONObject(i).get("code").toString());
        			fund.setfName(res.getJSONObject(i).get("name").toString());
        			System.out.println(res.getJSONObject(i).get("name").toString());
        			fund.setfType("Open");
        			fund.setfAnnualized_rate(Double.parseDouble(res.getJSONObject(i).get("annualincome").toString()));
        			System.out.println(Double.parseDouble(res.getJSONObject(i).get("annualincome").toString()));
        			fundService.save(fund);
        		}
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
 
    //2.股票型基金
    public static void getRequest2(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/stock";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //3.普通债券型基金
    public static void getRequest3(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/bond";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //4.货币型基金
    public static void getRequest4(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/monet";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //5.封闭型基金
    public static void getRequest5(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/close";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //6.创新封基
    public static void getRequest6(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/innov";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //7.LOF
    public static void getRequest7(){
        String result =null;
        String url ="http://apis.haoservice.com/lifeservice/netdata/lof";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //8.ETF
    public static void getRequest8(){
        String result =null;
        String url =" http://apis.haoservice.com/lifeservice/netdata/etf";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    //9.QDII
    public static void getRequest9(){
        String result =null;
        String url =" http://apis.haoservice.com/lifeservice/netdata/qdii";//请求接口地址
        Map params = new HashMap();//请求参数
            params.put("key",APPKEY);//APPKEY值
 
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
 
 
    public static void main(String[] args) throws Exception {
    	//getRequest1();
    }
 
    /**
     *
     * @param strUrl 请求地址
     * @param params 请求参数
     * @param method 请求方法
     * @return  网络请求字符串
     * @throws Exception
     */
    public static String net(String strUrl, Map params,String method) throws Exception {
        HttpURLConnection conn = null;
        BufferedReader reader = null;
        String rs = null;
        try {
            StringBuffer sb = new StringBuffer();
            if(method==null || method.equals("GET")){
                strUrl = strUrl+"?"+urlencode(params);
            }
            URL url = new URL(strUrl);
            conn = (HttpURLConnection) url.openConnection();
            if(method==null || method.equals("GET")){
                conn.setRequestMethod("GET");
            }else{
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
            }
            conn.setRequestProperty("User-agent", userAgent);
            conn.setUseCaches(false);
            conn.setConnectTimeout(DEF_CONN_TIMEOUT);
            conn.setReadTimeout(DEF_READ_TIMEOUT);
            conn.setInstanceFollowRedirects(false);
            conn.connect();
            if (params!= null && method.equals("POST")) {
                try {
                    DataOutputStream out = new DataOutputStream(conn.getOutputStream());
                        out.writeBytes(urlencode(params));
                } catch (Exception e) {
                    // TODO: handle exception
                    e.printStackTrace();
                }
            }
            InputStream is = conn.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sb.append(strRead);
            }
            rs = sb.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                reader.close();
            }
            if (conn != null) {
                conn.disconnect();
            }
        }
        return rs;
    }
 
    //将map型转为请求参数型
    public static String urlencode(Map<String,Object>data) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry i : data.entrySet()) {
            try {
                sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }

	public Fund getFund() {
		return fund;
	}

	public void setFund(Fund fund) {
		this.fund = fund;
	}

	public IFundService getFundService() {
		return fundService;
	}

	public void setFundService(IFundService fundService) {
		this.fundService = fundService;
	}
    
    
    
    
}