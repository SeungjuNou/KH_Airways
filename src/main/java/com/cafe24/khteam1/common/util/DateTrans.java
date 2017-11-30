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
}