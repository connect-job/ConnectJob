package com.connect.job.openapi;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.connect.job.model.vo.News;

public class NaverSearch {
	
	public List<News> naverSearch(String companyName) {
		String clientId = "DcU1xXhd40H5lH3LqJ8n";
        String clientSecret = "LVL14IxGex";
        
        //DocumentBuilderFactory 생성
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        DocumentBuilder builder;
        Document doc = null;
        
        // 뉴스 담을 컬렉션
        List<News> news = new ArrayList();
        
        try {
            String text = URLEncoder.encode(companyName, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text + "&sort=sim"; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            
            String result = response.toString();
            
            InputSource is = new InputSource(new StringReader(result));
            builder = factory.newDocumentBuilder();
            doc = builder.parse(is);
            XPathFactory xpathFactory = XPathFactory.newInstance();
            XPath xpath = xpathFactory.newXPath();
            // XPathExpression expr = xpath.compile("/response/body/items/item");
            XPathExpression expr = xpath.compile("//item");
            NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            
            for (int i = 0; i < nodeList.getLength(); i++) {
            	News n = new News();
                NodeList child = nodeList.item(i).getChildNodes();
                for (int j = 0; j < child.getLength(); j++) {
                    Node node = child.item(j);
                    	if(node.getNodeName().equals("title")) {
						/*
						 * if(!node.getTextContent().contains(text)) { continue Loop1; } else {
						 */
                    			n.setNewsTitle(node.getTextContent());                    			
                    	/*	}*/
                    	}
                    	if(node.getNodeName().equals("link")) {
                    		n.setNewsLink(node.getTextContent());
                    	}
                    	if(node.getNodeName().equals("pubDate")) {
                    		n.setNewsDate(node.getTextContent());
                    	}
					/*
					 * System.out.println("현재 노드 이름 : " + node.getNodeName());
					 * System.out.println("현재 노드 타입 : " + node.getNodeType());
					 * System.out.println("현재 노드 값 : " + node.getTextContent());
					 * System.out.println("현재 노드 네임스페이스 : " + node.getPrefix());
					 * System.out.println("현재 노드의 다음 노드 : " + node.getNextSibling());
					 * System.out.println("");
					 */
                }
                news.add(n);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return news;
	}
	
}
