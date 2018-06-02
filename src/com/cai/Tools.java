package com.cai;

import java.io.UnsupportedEncodingException;

public class Tools {
	public static String toChinese(String str) throws UnsupportedEncodingException{
		str=new String(str.getBytes("ISO-8859-1"),"utf-8");
		return str;
	}
}
