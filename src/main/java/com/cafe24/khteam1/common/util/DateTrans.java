package com.cafe24.khteam1.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("dateTrans")
public class DateTrans {
   public Map<Integer, String> DateChange(Date date1, Date date2) {
      DateFormat fm = new SimpleDateFormat("yyyyMMdd");
      Calendar cal = Calendar.getInstance();
      
      Map<String, Date> map = new HashMap<String, Date>();
      map.put("date1", date1);
      map.put("date2", date2);
      Map<Integer, String> result = new HashMap<Integer, String>();
      
      Iterator<String> it = map.keySet().iterator();
      while(it.hasNext()) {
         int i = 1;
         String key = it.next();
         cal.setTime(map.get(key));
         String datefo = fm.format(cal.getTime());
         result.put(i, datefo);
      }
      
      return result; 
   }
   
   //날짜 차이 구하기
   public int DateCount(Date date1, Date date2) {
	   DateFormat fm = new SimpleDateFormat("yyyyMMdd");
	   Calendar cal1 = Calendar.getInstance();
	   Calendar cal2 = Calendar.getInstance();
 		
	   cal1.setTime(date1);
	   cal2.setTime(date2);

	   long time = cal2.getTimeInMillis() - cal1.getTimeInMillis();
	   int result = (int) (time / (24 * 60 * 60 * 1000));
 		
	   return result; 
   }
 	
   //날짜 더하기
   public String DateAdd(Date date1, int count) {
	   DateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
	   Calendar cal = Calendar.getInstance();
 		
	   cal.setTime(date1);
	   cal.add(Calendar.DATE, count);
	   String date = fm.format(cal.getTime());
 		
	   return date; 
   }
}