package survey.model.vo;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

public class userType {
	public userType() {
	}	
	
	public static String[] userTypes() {
		String[] type = new String[]{"GENDER", "FINAL_EDUCATION", "JOB", "INCOME","LIVING_TYPE","HOUSE_TYPE","RELIGION","MARITAL_STATUS","LIVING_WITH","ARMY_GO"};
		return type;
	}
	
	public static HashMap<String, String[]> checkSurveys() {
		HashMap<String, String[]> typeList = new HashMap<String, String[]>();
		String[] type = userTypes();
		String[] GENDER = new String[] {"남자","여자"};
		String[] FINAL_EDUCATION = new String[] {"초등학교 졸업", "중학교 졸업", "고등학교 졸업", "2·3년제 대학교 졸업","4년제 대학교 졸업", "석사학위 취득", "박사학위 취득"};
		String[] JOB = new String[] {"무직","학생","자영업","사무직","판매/서비스직","생산/기술직","전문/예술직","경영/관리직","농/어/축산업","기타"};
		String[] INCOME = new String[] {"200만원 이하","200이상~400만원미만","400만원이상~600만원미만","600만원이상"};
		String[] LIVING_TYPE = new String[] {"월세","전세","자가"};
		String[] HOUSE_TYPE = new String[] {"단독 주택","다세대 주택", "아파트"};
		String[] RELIGION = new String[] {"무교","기독교","불교","천주교","기타"};
		String[] MARITAL_STATUS = new String[] {"미혼","기혼"};
		String[] LIVING_WITH = new String[] {"0명","1명","2명","3명","4명","5명","6명 이상",};
		String[] ARMY_GO = new String[] {"미필","군필","면제"};
		
		typeList.put(type[0],GENDER);
		typeList.put(type[1],FINAL_EDUCATION);
		typeList.put(type[2],JOB);
		typeList.put(type[3],INCOME);
		typeList.put(type[4],LIVING_TYPE);
		typeList.put(type[5],HOUSE_TYPE);
		typeList.put(type[6],RELIGION);
		typeList.put(type[7],MARITAL_STATUS);
		typeList.put(type[8],LIVING_WITH);
		typeList.put(type[9],ARMY_GO);
		
		return typeList; 
	}
	public static void main(String[] args) {
		String[] userTypes = userType.userTypes();
		HashMap<String, String[]> hm = checkSurveys();
		
		
		for(int i = 0 ; i< userTypes.length ; i ++) {
			for(int j = 0 ; j< hm.get(userTypes[i]).length ; j++) {
				System.out.println(hm.get(userTypes[i])[j]);
			}
		
		}
	}
	
}
