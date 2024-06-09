package com.KSW.web.servlet.Action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search/SearchDb.api")
public class SearchNaverBookAPI extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 네이버 API 클라이언트 정보
        String clientId = "uZWNVlB_OrjmqpLYjasl"; // 애플리케이션 클라이언트 아이디
        String clientSecret = "gRrs4ttE30"; // 애플리케이션 클라이언트 시크릿

        int startNum = 0;
        String text = null;
        try {
            // 요청 파라미터에서 시작번호와 검색어 획득
            startNum = Integer.parseInt(req.getParameter("startNum"));
            String searchText = req.getParameter("keyword");
            text = URLEncoder.encode(searchText, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패", e);
        }

        // 네이버 책 검색 API URL 설정
        String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text + "&display=12&sort=sim&start=" + startNum;

        // 요청 헤더 설정
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

        // API 호출 및 응답 획득
        String responseBody = get(apiURL, requestHeaders);

        // 응답 전송 설정
        System.out.println(responseBody);
        resp.setContentType("text/html; charset=utf-8");
        resp.getWriter().write(responseBody); // 서블릿에서 즉시 출력
    }

    // HTTP GET 요청 메서드
    private static String get(String apiUrl, Map<String, String> requestHeaders) {
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            // 요청 헤더 추가
            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    // URL 연결 메서드
    private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    // 응답 본문을 문자열로 변환하는 메서드
    private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }
}
