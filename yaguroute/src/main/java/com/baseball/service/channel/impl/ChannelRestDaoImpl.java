package com.baseball.service.channel.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.baseball.service.channel.ChannelRestDao;
import com.baseball.service.domain.Channel;


@Repository("channelRestDaoImpl")
public class ChannelRestDaoImpl implements ChannelRestDao {
	
	//field
	@Value("${acessKey}")
	private String accessKey;
	
	@Value("${secretKey}")
	private String secreteKey;

	public ChannelRestDaoImpl() {
		System.out.println("ChannelRestDaoImpl Start...");
	}

	@Override
	public Channel addChannel(Channel channel) throws Exception {
		System.out.println("ChannelRestDaoImpl의 addChannel 실행");
		
		String jsonData = "";
		StringBuffer response = new StringBuffer();
		Channel returnData = new Channel();
		String channelHost = "https://livestation.apigw.ntruss.com";
		String requestURL = "/api/v2/channels";
		String apiURL = channelHost+requestURL;
		System.out.println(apiURL);
		String method = "POST";
		String timestamp = getTimestamp();
		
		try {
			//cdn inner JSON
			Map<String, Object> cdn = new HashMap<>();
			cdn.put("createCdn", true);
			cdn.put("cdnType", "CDN_PLUS");
			
			//record inner JSON
			Map<String, Object> record = new HashMap<>();
			record.put("format", "MP4");
			record.put("type", "AUTO_UPLOAD");
			record.put("bucketName", channel.getBucketName());
			record.put("filePath", channel.getUploadPath());
			record.put("accessControl", "PUBLIC_READ");
			
			//Request Body 설정
			System.out.println("RequestBody 설정");
			JSONObject body = new JSONObject();
			body.put("cdn", cdn);
			body.put("channelName", channel.getChannelName());
			body.put("qualitySetId", Integer.valueOf(3));
			body.put("useDvr", true);
			body.put("immediateOnAir", true);
			body.put("timemachineMin", Integer.valueOf(360));
			body.put("record", record);
			String requestBody = body.toString();
			
			//Http Request Header 설정
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod(method);
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2", getSignature(requestURL, timestamp, method, accessKey, secreteKey));
			con.setRequestProperty("Content-Type","application/json");
			con.setRequestProperty("x-ncp-region_code", "KR");
			con.setDoOutput(true);
			
			//requset body 전송
			OutputStream os = con.getOutputStream();
			os.write(requestBody.getBytes("utf-8"));
			os.flush();
			os.close();
			
			BufferedReader br = null;
			//응답코드 확인
			int responseCode = con.getResponseCode();
			
			if(responseCode == HttpURLConnection.HTTP_OK) {
				System.out.println("채널 생성 완료");
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				System.out.println(br.toString());
				
			} else {
				System.out.println("Http Error Code : "+responseCode);
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				System.out.println(br.toString());
			}
			
			while((jsonData = br.readLine()) != null) {
				response.append(jsonData);
			}
			br.close();
			con.disconnect();

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//JSON으로 변환
		JSONParser parser = new JSONParser();
		JSONObject data = (JSONObject) parser.parse(response.toString());

		//JSON Data를 channel VO에 저장
		channel.setChannelID((String)(((JSONObject)data.get("content")).get("channelId")));
		System.out.println(returnData.toString());
		return channel;
	}

	@Override
	public String getChannelServiceURL(String channelID) throws Exception {
		System.out.println("LiveStationService의 getChannelServiceURL() 시작");
		System.out.println("채널 아이디 : "+channelID);
		
		String jsonData = "";
		StringBuffer response = new StringBuffer();
		String channelHost = "https://livestation.apigw.ntruss.com";
		String requestURL = "/api/v2/channels/"+channelID+"/serviceUrls?serviceUrlType=GENERAL";
		String apiURL = channelHost+requestURL;
		System.out.println(apiURL);
		String method = "GET";
		String timestamp = getTimestamp();
		
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod(method);
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
		con.setRequestProperty("x-ncp-iam-access-key", accessKey);
		con.setRequestProperty("x-ncp-apigw-signature-v2", getSignature(requestURL, timestamp, method, accessKey, secreteKey));
		con.setRequestProperty("x-ncp-region_code", "KR");
		
		//response 확인
		int responseCode = con.getResponseCode();
		BufferedReader br = null;
		
		//response data 확인
		if(responseCode == HttpURLConnection.HTTP_OK) {
			System.out.println("채널 조회 완료");
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			System.out.println(br.toString());
			
		} else {
			System.out.println("Http Error Code : "+responseCode);
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			System.out.println(br.toString());
		}
		
		while((jsonData = br.readLine()) != null) {
			response.append(jsonData);
		}
		br.close();
		con.disconnect();
		
		//JSON으로 변환
		JSONParser parser = new JSONParser();
		JSONObject objectData = (JSONObject) parser.parse(response.toString());
		JSONArray arrayData = (JSONArray) objectData.get("content");
		JSONObject firstObj = (JSONObject) arrayData.get(0);
		
		String serviceURL = (String) firstObj.get("url");
		System.out.println("Service URL : "+serviceURL);
		
		
		return serviceURL;
	}

	@Override
	public void updateChannel(Channel channel) throws Exception {
		System.out.println("Update Channel 시작");
		String channelHost = "https://livestation.apigw.ntruss.com";
		String requestURL = "/api/v2/channels/"+channel.getChannelID();
		String apiURL = channelHost+requestURL;
		System.out.println("apiURL : "+apiURL);
		String method = "PUT";
		String timestamp = getTimestamp();
		
		//record inner JSON
		Map<String, Object> record = new HashMap<>();
		record.put("format", "MP4");
		record.put("type", "AUTO_UPLOAD");
		record.put("bucketName", channel.getBucketName());
		record.put("filePath", channel.getUploadPath());
		record.put("accessControl", "PUBLIC_READ");
		
		//Request Body 설정
		System.out.println("RequestBody 설정");
		JSONObject body = new JSONObject();
		body.put("channelName", channel.getChannelName());
		body.put("useDvr", true);
		body.put("immediateOnAir", true);
		body.put("timemachineMin", Integer.valueOf(360));
		body.put("record", record);
		String requestBody = body.toString();
		
		//Request Header 설정
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod(method);
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
		con.setRequestProperty("x-ncp-iam-access-key", accessKey);
		con.setRequestProperty("x-ncp-apigw-signature-v2", getSignature(requestURL, timestamp, method, accessKey, secreteKey));
		con.setRequestProperty("x-ncp-region_code", "KR");
		con.setDoOutput(true);
		
		//requset body 전송
		OutputStream os = con.getOutputStream();
		os.write(requestBody.getBytes("utf-8"));
		os.flush();
		os.close();
		
		int responseCode = con.getResponseCode();
		BufferedReader br = null;
		
		if(responseCode == 200) {
			System.out.println("채널 생성 완료");
			
		} else {
			System.out.println("Http Error Code : "+responseCode);
			
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			String errorResponse = "";
			String line;
			while((line = br.readLine()) != null) {
				errorResponse += line;
			}
			br.close();
			con.disconnect();
			
			System.out.println("Error Response: " + errorResponse);
			
		}
		
	}

	@Override
	public void deleteChannel(String ChannelID) throws Exception {
		System.out.println("deleteChannel 시작");
		String channelHost = "https://livestation.apigw.ntruss.com";
		String requestURL = "/api/v2/channels/"+ChannelID;
		String apiURL = channelHost+requestURL;
		String method = "DELETE";
		String timestamp = getTimestamp();
		
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod(method);
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
		con.setRequestProperty("x-ncp-iam-access-key", accessKey);
		con.setRequestProperty("x-ncp-apigw-signature-v2", getSignature(requestURL, timestamp, method, accessKey, secreteKey));
		con.setRequestProperty("x-ncp-region_code", "KR");
		
		int responseCode = con.getResponseCode();
		
		//response data 확인
		if(responseCode == HttpURLConnection.HTTP_OK) {
			System.out.println("채널 삭제 완료 완료");
			
		} else {
			System.out.println("Http Error Code : "+responseCode);
		}

	}

	@Override
	public Channel StopChannel(String channleID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String geteVideo(String bucketName, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	//timeStamp 생성method
	public String getTimestamp () {
		String timestamp = String.valueOf(System.currentTimeMillis());
		System.out.println(timestamp);	
		return timestamp;
	}
	
	//x-ncp-apigw-signature-v2 생성 method
	public String getSignature(String url, String timestamp, String method, String accesskey, String secretkey) throws Exception{
		String space = " ";
		String newLine = "\n";
			
		String message = new StringBuilder()
									.append(method)
									.append(space)
									.append(url)
									.append(newLine)
									.append(timestamp)
									.append(newLine)
									.append(accesskey)
									.toString();
		SecretKeySpec signingKey = new SecretKeySpec(secretkey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(signingKey);
			
		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		String encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		System.out.println("암호화 된 V2 key : "+encodeBase64String);
		return encodeBase64String;
	}

}
