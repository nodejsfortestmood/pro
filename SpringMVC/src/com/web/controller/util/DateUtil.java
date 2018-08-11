package com.web.controller.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String dateFormate(Date d){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(d);
	}

}
