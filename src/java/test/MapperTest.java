package com.graduationDesign.test;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.graduationDesign.dao.AttendanceRecordMapper;
import com.graduationDesign.dao.BasicInformationMapper;
import com.graduationDesign.dao.ChangePasswordMapper;
import com.graduationDesign.dao.EmployeeAttendanceMapper;
import com.graduationDesign.dao.OperationLogMapper;
import com.graduationDesign.dao.PartEmployeeInformationMapper;
import com.graduationDesign.dao.PersonnelInformationMapper;
import com.graduationDesign.dao.RewardsRecordsMapper;
import com.graduationDesign.dao.StaffPersonnelInformationMapper;
import com.graduationDesign.dao.UserMapper;
import com.graduationDesign.dao.WagesManagementMapper;
import com.graduationDesign.dao.WorkExperienceMapper;
import com.graduationDesign.entity.AttendanceRecord;
import com.graduationDesign.entity.BasicInformation;
import com.graduationDesign.entity.EmployeeInformation;
import com.graduationDesign.entity.OperationLog;
import com.graduationDesign.entity.PartEmployeeInformation;
import com.graduationDesign.entity.RewardsRecords;
import com.graduationDesign.entity.Users;
import com.graduationDesign.entity.WagesManagement;
import com.graduationDesign.entity.WorkExperience;
import com.graduationDesign.utils.GetUserIpUtils;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MapperTest {
	@Autowired
	ChangePasswordMapper change;
	@Autowired
	EmployeeAttendanceMapper emp;
	@Autowired
	WagesManagementMapper wages;
	@Autowired
	AttendanceRecordMapper attendance;
	@Autowired
	PersonnelInformationMapper personnelInformation;
	@Autowired
	RewardsRecordsMapper rewardsRecords;
	@Autowired
	WorkExperienceMapper WorkExperienceMapper;
	@Autowired
	PartEmployeeInformationMapper employeeInformationMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	BasicInformationMapper basicInformationMapper;
	@Autowired
	SqlSession session;
	//@Test
	public void testMapper() {
		
		PartEmployeeInformationMapper mapper = session.getMapper(PartEmployeeInformationMapper.class);
		
//			String uuid = UUID.randomUUID().toString().substring(0,5);
//			String number = uuid.substring(0,3);
//			mapper.insertSelective(new EmployeeInformation(null, number, uuid, null, null,uuid+"@at.com", 
//									                      LocalDate.now(), null, null, null, null, 
//									                      null, null, null, null, 
//									                      null, null, null, null, 
//									                      null, null));
//		System.out.println("批量插入完成");
		//PartEmployeeInformation partEmployeeInformation = new PartEmployeeInformation();
//		partEmployeeInformation.setId(109);
		//partEmployeeInformation.setEmpName("刘备");
		//Integer empIdByEmpName = mapper.getEmpIdByEmpName("大乔");
		//List<PartEmployeeInformation> employeeInformationBySelectQuery = mapper.getPartEmployeeInformationBySelectQuery(partEmployeeInformation);
//		List<Map<String, Integer>> empNameAndId = mapper.getEmpNameAndId();
		mapper.getCultureTypeName();
		//System.out.println(empNameAndId);
	}
	
   // @Test
	public void testMapper2() {
		UserMapper mapper = session.getMapper(UserMapper.class);
		Users users = new Users();
		users.setUserCreateTime(new Date());
		users.setUserIsStart("是");
		users.setUserName("马超");
		users.setUserPwd("machao");
		users.setUserRoleId(3);
		///users.setUserName("大");
		//users.setUserRole("员工");
		//List<Users> userOperationModule = mapper.getUserOperationModuleId(users);
		//Users user = mapper.getUserByUserInformation(users);
		//List<Users> moduleName =usersBySelectiveQuery mapper.getUserOperationModuleName(users);
		//List<Users> user = mapper.getUsersBySelectiveQuery(users);
		//List<Map<String, Integer>> roleNameByBasicInfo = mapper.getRoleNameByBasicInfo();
		int addUsers = mapper.addUsers(users);
		System.out.println(addUsers);
	}
	
	//@Test
	public void testMapper3() {
		BasicInformationMapper mapper = session.getMapper(BasicInformationMapper.class);
//		List<BasicInformation> marksByBasicInformations = mapper.getMarks();
//		List<BasicInformation> basicInformationsByMark = mapper.getBasicInformationsByMark("角色类型");
		BasicInformation basicInformation = new BasicInformation();
		basicInformation.setId(47);
		basicInformation.setMark("帽子戏法");
		basicInformation.setTypeName("你好");
//		mapper.getBasicInformationBySelectiveQuery(null);
//		mapper.addBasicInformation(basicInformation);
		mapper.editBasicInformation(basicInformation);
	}
	
	//@Test
	public void testMapper4() {
		WorkExperienceMapper mapper = session.getMapper(WorkExperienceMapper.class);
		List<WorkExperience> empWorkExperience = mapper.getEmpWorkExperience(121);
		System.out.println(empWorkExperience);
	}
	
	//@Test
	public void testMapper5() {
		RewardsRecordsMapper mapper = session.getMapper(RewardsRecordsMapper.class);
//		mapper.getRewardsRecords(120);
		RewardsRecords records = new RewardsRecords();
		//records.setRewardsTime(LocalDate.now());
		records.setApprover("admin");
		records.setEmpId(120);
		records.setRewardsTypeId(22);
		mapper.addRewardsRecord(records);
	}
	
	//@Test
	public void testMapper6() {
		PersonnelInformationMapper mapper = session.getMapper(PersonnelInformationMapper.class);
		List<Map<String, Integer>> countSex = mapper.getCountSex();
		System.out.println(countSex);
	}
	
	//@Test
	public void testMapper7() {
		AttendanceRecordMapper mapper = session.getMapper(AttendanceRecordMapper.class);
		AttendanceRecord attendanceRecord = new AttendanceRecord();
//		attendanceRecord.setId(2);
//		attendanceRecord.setEmpId("大");
//		attendanceRecord.setSameDayTime("2020/03/04");
//		attendanceRecord.setSameDayTime2("2020/03/10");
//		List<AttendanceRecordMapper> attendanceRecordInfo = mapper.getAttendanceRecordInfoBySelectQuery(attendanceRecord);
//		attendanceRecord.setId(1);
//		attendanceRecord.setState("无");
//		int editStateById = mapper.editStateById(attendanceRecord);
//		System.out.println(editStateById);
		ArrayList<Integer> arrayList = new ArrayList<Integer>();
		arrayList.add(5);
		arrayList.add(8);
		mapper.batchDeleteAttendanceRecord(arrayList);
		//mapper.moveAttendanceRecord(14);
	}
	
	//@Test
	public void testMapper8() {
		WagesManagementMapper mapper = session.getMapper(WagesManagementMapper.class);
		WagesManagement wages = new WagesManagement();
		//wages.setId(12);
		//wages.setEmpName("李");
//		wages.setYears(2020);
//		wages.setMonths(2);
//		List<WagesManagement> wagesManagement = mapper.getWagesManagementBySelectiveQuery(wages);
		List<Map<String, BigDecimal>> countWages = mapper.getCountWages();
		System.out.println(countWages);
	}
	
	//@Test
	public void testMapper9() {
		EmployeeAttendanceMapper mapper = session.getMapper(EmployeeAttendanceMapper.class);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String d = sdf.format(date);
		AttendanceRecord ar = new AttendanceRecord();
		ar.setClockTime(new Date());
		ar.setClockType("下班");
		ar.setEmpId(120);
		ar.setSameDayTime(d);
		mapper.addEmpAttendance(ar);
		//Integer selectEmpIdByEmpName = mapper.selectEmpIdByEmpName("大乔");
		//List<AttendanceRecord> pa = mapper.getPersonnelAttendancesBySelectiveQuery(ar);
		System.out.println();
	}
	
	//@Test
	public void testMapper10() {
		ChangePasswordMapper mapper = session.getMapper(ChangePasswordMapper.class);
		//String userPwd = mapper.getUserPwdByuserName("admin");
		Users users = new Users();
		users.setUserPwd("12345");
		users.setUserName("admin");
		int edit = mapper.editUserPwdByuserName(users);
		System.out.println(edit);
	}
	
	//@Test
	public void testMapper11() {
		StaffPersonnelInformationMapper mapper = session.getMapper(StaffPersonnelInformationMapper.class);
		//EmployeeInformation emp = mapper.getStaffInfoByEmpUserName("大乔");
		Integer emp = mapper.getEmpIdByEmpUserName("大乔");
		System.out.println(emp);
	}
	
	@Test
	public void testMapper12() {
		OperationLogMapper mapper = session.getMapper(OperationLogMapper.class);
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
//		OperationLog log = new OperationLog();
//		log.setOperator("haha");
//		log.setOperationContent("登录系统");
//		String ipAddr = GetUserIpUtils.getIpAddr(request);
//		log.setOperatorIp(ipAddr);
//		Date date = new Date();
//		log.setOperationTime(date);
//		log.setOperationCurrentTime(new SimpleDateFormat("yyyy-MM-dd").format(date));
//		mapper.addOperationLog(log);
		String ipAddr = GetUserIpUtils.getIpAddr(request);
		System.out.println(ipAddr);
	}
}
