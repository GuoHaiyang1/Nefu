package com.service;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.entity.Invigilate;
import com.entity.UserInvigilate;

@Component
public class MyTimer {
@Autowired
private InvigilateService invigilateService;
@Scheduled(cron="*/10 * * * * *")
public void stateChange(){
	List<Invigilate> invigilates=invigilateService.invigilateList();
	for(Invigilate invigilate:invigilates)
	{
	Date date=new Date();
	if(invigilate.getEndTime().getTime()<date.getTime())
	{
		invigilateService.changeState(invigilate.getId());
		
	}
	}
}
@Scheduled(cron="0 0 0 * * *")
public void checkInform() {
	List<UserInvigilate> userInvigilates=invigilateService.listUserInvigilate();
	long b=1000;
	for(UserInvigilate userInvigilate:userInvigilates)
	{
		Date date=new Date();
		if(((date.getTime()-userInvigilate.getInvigilate().getStartTime().getTime())<b*60*60*24)&&((date.getTime()-userInvigilate.getInvigilate().getStartTime().getTime())>0))
		{
			StringBuffer message=new StringBuffer(userInvigilate.getUser().getUsername());
			message.append("老师您好，您明天有一场监考，考试开始时间为：");
			message.append(userInvigilate.getInvigilate().getStartTime());
			message.append(",地点为:");
			message.append(userInvigilate.getInvigilate().getAddress());
			message.append(",请按时监考。");
			System.out.println(message);
			
		}
		
	}
		
}
}
