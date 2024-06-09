package com.KSW.web.servlet.Action;

import oracle.sql.CHAR;

public class Solution {

    public String solution(String my_string, String overwrite_string, int s) {
        String answer = "";
        char [] arr = null ;
        char [] arrOW ;
        
        arr = my_string.toCharArray();
        arrOW = overwrite_string.toCharArray();
        for(int i=s; i<overwrite_string.length(); i++) {
        	arr[i] = arrOW[i];
        }
        for(int i=0; i<arr.length; i++) {
        	answer += arr[i];
        }
        	System.out.println(answer);
        return answer;
    }
}


