package com.it.every.sms;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class sms {

public String smsNaver(String phone){
	   
   String hostNameUrl = "https://sens.apigw.ntruss.com";
   String requestUrl= "/sms/v2/services/";
   String requestUrlType= "/messages";
   String accessKey="rkVbAdiilyy44i6iEx9E";
   String secretKey="5Cb04oMfSUN40h0syhDiWvreiEo6v50tLj8cJq4o";
   String serviceId="ncp:sms:kr:269995979055:sms";
   String method="POST";
   String timestamp= Long.toString(System.currentTimeMillis());
   requestUrl+=serviceId + requestUrlType;
   String apiUrl = hostNameUrl+requestUrl;
   
   JSONObject bodyJson = new JSONObject();
   JSONObject toJson = new JSONObject();
   JSONArray toArr = new JSONArray();
   
   
   int a =(int) Math.floor(Math.random() * 11000);
   System.out.println("랜덤번호"+ a);
  
   
   String no = Integer.toString(a);
   toJson.put("subject","일단");
   toJson.put("content",no);
   toJson.put("to",phone);
   toArr.add(toJson);
   
   bodyJson.put("type","sms");
   bodyJson.put("countryCode","82");
   bodyJson.put("from","01045792823");
   bodyJson.put("subject","인증");
   bodyJson.put("content","받고보자"); 
   bodyJson.put("messages",toArr);
   
   String body = bodyJson.toJSONString();
   System.out.println(body);
   
   try {
      URL url = new URL(apiUrl);
      
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setUseCaches(false);
      con.setDoOutput(true);
      con.setDoInput(true);
      con.setRequestProperty("content-type", "application/json");
      con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
      con.setRequestProperty("x-ncp-iam-access-key", accessKey);
      con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
      con.setRequestMethod(method);
      con.setDoOutput(true);
      DataOutputStream wr = new DataOutputStream(con.getOutputStream());
      
      wr.write(body.getBytes());
      wr.flush();
      wr.close();
      
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.println("responseCode"+""+responseCode);
      if (responseCode==202) {
         br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {
         br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      
      String inputLine;
      StringBuffer response = new StringBuffer();
      
      while((inputLine=br.readLine())!=null){
         response.append(inputLine);
      }
      br.close();
      
      System.out.println(response.toString());
      
   } catch (Exception e) {
      System.out.println(e);
      // TODO: handle exception
   }
   		return no;
   }

   private static String makeSignature(String url, String timestamp, String method, String accessKey,
         String secretKey) {
      
      String space = " ";
      String newLine = "\n";
      
      String message = new StringBuilder()
            .append(method)
            .append(space)
            .append(url)
            .append(newLine)
            .append(timestamp)
            .append(newLine)
            .append(accessKey)
            .toString();
      
      SecretKeySpec signingKey;
      String encodeBase64String;
      
      try {
    	  signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),"HmacSHA256");
    	  Mac mac = Mac.getInstance("HmacSHA256");
    	  mac.init(signingKey);
    	  byte[] rawHmac= mac.doFinal(message.getBytes("UTF-8"));
    	  encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
	} catch (Exception e) {
		 
		// TODO: handle exception
		encodeBase64String = e.toString();
	}
      // TODO Auto-generated method stub
      return encodeBase64String;
   }
   
   
}
