package com.connect.job.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.MemberDao;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser; 

@Service
public class KakaoAPI {	
	
	private HttpURLConnection conn;
	
	@Autowired
	private MemberDao dao;
	
	public String getAccessToken(String code) {
		
		String access_token="";
		String refresh_token="";
		String reqURL="https://kauth.kakao.com/oauth/token"; //로그인 토큰 받기
		String appKey="eea7cf213d496958f3d4df223aaacde8";
		String redirect_uri="http://localhost:9090/job/kakaoLogin";
		
		try {
			URL url=new URL(reqURL);
			conn=(HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); //post 요청
			conn.setDoOutput(true);
			
			//필수 파라미터
			BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb=new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id="+appKey);
			sb.append("&redirect_uri="+redirect_uri);
			sb.append("&code=" + code);			
			bw.write(sb.toString());
			bw.flush();
			
			//결과 코드 200이면 성공
			int responseCode=conn.getResponseCode();
			System.out.println("responseCode: "+responseCode);
			
			//요청 통해 얻은 JSON타입 Response메세지 읽어오기
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line="";
			String result="";
			
			while((line=br.readLine())!=null) {
				result+=line;
			}
			
			System.out.println("responseBody: " + result);
			
			//JSON파싱 객체 생성
			JsonParser parser=new JsonParser();
			JsonElement element=parser.parse(result);
			
			access_token=element.getAsJsonObject().get("access_token").getAsString();
			refresh_token=element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token: "+access_token);
			System.out.println("refresh_token: "+refresh_token);
			
			br.close();
			bw.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return access_token;
	}
	
	public HashMap<String, Object> getUserInfo(String access_token){
		
		
		HashMap<String, Object> userInfo=new HashMap<>();
		String reqURL="https://kapi.kakao.com/v2/user/me"; //사용자 요청
		String line="";
		String result="";
		
		try {
			
			URL url=new URL(reqURL);			
			conn=(HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");			
			
			//요청에 필요한 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			//결과 코드
			int responseCode=conn.getResponseCode();
			System.out.println("responseCode: "+responseCode);			
			
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));			
			
			while((line=br.readLine())!=null) {
				result+=line;
			}
			
			System.out.println("responseBody: "+result);			
			
			//받아온 정보 파싱			
			JsonParser parser=new JsonParser();
			JsonElement element=parser.parse(result);
			
			JsonObject properties=element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account=element.getAsJsonObject().get("kakao_account").getAsJsonObject();			
			
			String name=properties.getAsJsonObject().get("nickname").getAsString();			
			String id=element.getAsJsonObject().get("id").getAsString();
			
			userInfo.put("id", id); //isSNS에 넣을 kakao 고유 id
			userInfo.put("nickname", name);	//pName
			
			dao.kakaoLogin(userInfo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return userInfo;
	}
	
	public void kakaoLogout(String access_token) {
		
		String reqURL="https://kapi.kakao.com/v1/user/logout";
		try {
			
			URL url=new URL(reqURL);
			conn=(HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			
			int responseCode=conn.getResponseCode();
			System.out.println("responseCode: "+responseCode);
			
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String result="";
			String line="";
			
			while((line=br.readLine())!=null) {
				result+=line;
			}
			
			System.out.println(result);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
