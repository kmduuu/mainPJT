package com.baseball.test.user;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserTests {
	
//	@Autowired
//	@Qualifier("meetingServiceImpl")
//	MeetingService meetingService;
	
	//@Test
	public void testGetMeeting() throws Exception{
		
//		Meeting meeting = new Meeting();
//		
//		meeting = meetingService.getMeeting(1);
//		
//		Assert.assertEquals("Meeting 1", meeting.getMeetingName());
//		Assert.assertEquals("Seoul", meeting.getMeetingAddr());
//		Assert.assertEquals("Introduction 1", meeting.getMeetingIntro());
//		Assert.assertEquals(37.123456, meeting.getMeetingLat(),0);
//		Assert.assertEquals(127.654321, meeting.getMeetingLng(),0);
//		Assert.assertEquals(0, meeting.getEntryFee());
//		//Assert.assertEquals("2023-05-17", meeting.getMeetingDate());
//		//Assert.assertEquals("12:00:00", meeting.getMeetingStartTime());
//		//Assert.assertEquals("15:00:00", meeting.getMeetingEndTime());
//		Assert.assertEquals(1, meeting.getMeetingSuccess());
//		Assert.assertEquals("123 Main Street", meeting.getMeetingDetailAddr());


	}
	
	//@Test
	public void testAddMeeting() throws Exception{
		
//		Meeting meeting = new Meeting();
		
//        meeting.setEntryFee(0);
//        meeting.setMeetingDate(new java.sql.Date(new Date().getTime()));
//        meeting.setMeetingStartTime(new Time(10, 0, 0));
//        meeting.setMeetingEndTime(new Time(12, 0, 0));
//        meeting.setMeetingAddr("Sample Address");
//        meeting.setMeetingDetailAddr("Sample Detail Address");
//        meeting.setMeetingLat(37.123456);
//        meeting.setMeetingLng(127.123456);
//        meeting.setMeetingName("Sample Meeting");
//        meeting.setMeetingIntro("Sample Introduction");
//        meeting.setMeetingLeaderNo(1);
//        meeting.setMeetingMaxMemberNo(20);
//        meeting.setMeetingRegDate(new java.sql.Date(new Date().getTime()));
//        meeting.setMeetingImg("sample.jpg");
//        meeting.setFilterGender(1);
//        meeting.setFilterMinAge(20);
//        meeting.setFilterMaxAge(40);
//        meeting.setFilterTag("sample");
//        meeting.setParentClubNo(1);
//		
//		meetingService.addMeeting(meeting);
		
	}
	
	//@Test
	public void testUpdateMeeting() throws Exception{
		
//		Meeting meeting = meetingService.getMeeting(9);
//		Assert.assertNotNull(meeting);
//		
//		Assert.assertEquals("Sample Meeting", meeting.getMeetingName());
//		Assert.assertEquals("sample.jpg", meeting.getMeetingImg());
//		Assert.assertEquals("Sample Introduction", meeting.getMeetingIntro());
//		
//        meeting.setMeetingName("Update Sample Meeting");
//        meeting.setMeetingImg("updatesample.jpg");
//        meeting.setMeetingIntro("Update Sample Introduction");
//        
//        meetingService.updateMeeting(meeting);
//        
//        meeting = meetingService.getMeeting(meeting.getMeetingNo());
//		Assert.assertNotNull(meeting);
//        
//		Assert.assertEquals("Update Sample Meeting", meeting.getMeetingName());
//		Assert.assertEquals("updatesample.jpg", meeting.getMeetingImg());
//		Assert.assertEquals("Update Sample Introduction", meeting.getMeetingIntro());

	}
	
	//@Test
	public void testUpdateMeetingSuccess() throws Exception{
//		
//		Meeting meeting = meetingService.getMeeting(9);
//		Assert.assertNotNull(meeting);
//		
//		Assert.assertEquals("Update Sample Meeting", meeting.getMeetingName());
//		Assert.assertEquals("updatesample.jpg", meeting.getMeetingImg());
//		Assert.assertEquals(0, meeting.getMeetingSuccess());
//		
//		
//        meeting.setMeetingImg("updatesample.jpg");
//        meeting.setMeetingIntro("Update Sample Introduction");
//        
//        meetingService.updateMeetingSuccess(meeting);
//        
//        meeting = meetingService.getMeeting(meeting.getMeetingNo());
//		Assert.assertNotNull(meeting);
//        
//		Assert.assertEquals(1, meeting.getMeetingSuccess());
//		Assert.assertEquals(1, meeting.getMeetingState());

	}
	
	//@Test
	public void testDeleteMeeting() throws Exception{
		
//		meetingService.deleteMeeting(5);


	}
	
	//@Test
	public void testGetMeetingListFromRarentClubNo() throws Exception{
		
//		Map<String, Object> map = meetingService.getMeetingListFromRarentClubNo(1);
//		
//		List<Object> list = (List<Object>)map.get("list");
//		
//		Assert.assertEquals(3, list.size());

	}
	
	//@Test
	public void testAddMeetingMember() throws Exception{
		
		
//		Map<String, String> map = new HashMap<>();
//		map.put("userNo", "1");
//		map.put("meetingNo", "2");
//				
//				
//		meetingService.addMeetingMember(map);

	}
	
	//@Test
	public void testUpdateMeetingMember() throws Exception{
		
		
//		Map<String, String> map = new HashMap<>();
//		map.put("memberNo", "1");
//		map.put("state", "1");
//				ㄴ
//				
//		meetingService.updateMember(map);

	}
	
	@Test
	public void testDeleteMeetingMember() throws Exception{	
				
//		meetingService.deleteMeetingMember(1);

	}

}
