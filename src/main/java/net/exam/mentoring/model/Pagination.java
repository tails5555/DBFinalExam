package net.exam.mentoring.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.Data;
@Data
public class Pagination {
	int pg=1;
	int sz=9;
	int ob;
	int sb;
	String st;
	int recordCount;
	public String getQueryString() {
		String url=null;
		try {
			String temp=(st==null) ? "" : URLEncoder.encode(st, "UTF-8");
			url=String.format("pg=%d&ob=%d&sz=%d&sb=%d&st=%s", pg, ob, sz, sb, temp);
		}catch(UnsupportedEncodingException e) {}
		return url;
	}
}
