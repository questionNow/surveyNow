package survey.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import survey.model.dao.SurveyDao;
import survey.model.vo.DoSurvey;
import survey.model.vo.Question;
import survey.model.vo.SortByType;
import survey.model.vo.Survey;
import survey.model.vo.SurveyTarget;

public class SurveyService {

	public ArrayList<Survey> selectHoldSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectHoldSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public ArrayList<Survey> selectDeletedSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectDeletedSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public int reviveSurvey(int sNum) {
		Connection conn = getConnection();

		int result = new SurveyDao().reviveSurvey(conn, sNum);

		close(conn);

		return result;
	}

	public ArrayList<Survey> selectIngSurvey(String userId) {
		Connection conn = getConnection();
		ArrayList<Survey> sList = new SurveyDao().selectIngSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public ArrayList<Survey> selectFinishedSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectFinishedSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public ArrayList<Survey> selectPurchaseSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectPurchaseSurvey(conn, userId);

		close(conn);
		return sList;
	}

	public int checkSNum() {
		Connection conn = getConnection();

		int sNum = new SurveyDao().checkSNum(conn);

		close(conn);
		return sNum;
	}

	public int makeSurvey(Survey s, SurveyTarget st, String[] qNum, String[] qType, String[] qTitle,
			ArrayList<String[]> answer) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int result = sDao.makeSurvey(conn, s);
		if (result > 0) {
			if (st != null) {
				int result1 = sDao.makeSurveyTarget(conn, st);
			}
			int result2 = sDao.makeQuestion(conn, qNum, qType, qTitle, answer);
			if (result2 > 0) {
				
			}
			commit(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Survey> selectSurveys(String userId) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		ArrayList<Survey> sList = sDao.selectSurveys(conn, userId);
		ArrayList<Survey> stList = sDao.checkSurveys2(conn, sList, userId);
		System.out.println(stList);
		close(conn);
		return stList;
	}

	public ArrayList<DoSurvey> doServey(int sNum) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS(conn, sNum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, s);
		ArrayList<DoSurvey> dsList = sDao.doServeyA(conn, s, qList);
		close(conn);

		return dsList;
	}

	public ArrayList<DoSurvey> chartSurvey2(int snum) {

		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.doServeyS2(conn, snum);
		ArrayList<Question> qList = sDao.doServeyQ(conn, s);
		// qnum과 일치하는 anum들의 리스트를 작성
		ArrayList<DoSurvey> dsList = sDao.doServeyA(conn, s, qList);
		close(conn);

		return dsList;
	}

	public int recordAnswer(String userId, int sNum, int sPoint, int[] qNum, int[] aNum, String[] aContent) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int[] result = sDao.recordAnswer(conn, userId, sNum, qNum, aNum, aContent);
		sDao.updateSurveyCount(conn, userId);	
		int[] countResult = new int[result.length];
		int cResult = 0;
		int countSurvey = sDao.addSurveyCount(conn, sNum);
		int checkSurveyCount = sDao.checkSurveyCount(conn, sNum);
		Survey survey = sDao.selectSurveys(conn, sNum);
		int pointRecord = sDao.recordPoint(conn, survey, userId);
		int addUpdate = sDao.addPoint(conn, survey, userId);
		int addAnswerUser = sDao.addAnswerUser(conn, survey, userId);
		for (int i = 0; i < result.length; i++) {
			if (result[i] > 0) {
				countResult[i] = sDao.addAnswerCount(conn, aNum[i]);
			}
		}
		if (result.length == countResult.length) {
			cResult = 1;
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return cResult;
	}

	public int deleteSurvey(int sNum) {
		Connection conn = getConnection();

		int result = new SurveyDao().deleteSurvey(conn, sNum);
		if (result > 0) {
			commit(conn);
		} else
			rollback(conn);

		close(conn);
		return result;
	}

	public int powerDeleteSurvey(int sNum) {
		Connection conn = getConnection();

		int result = new SurveyDao().powerDeleteSurvey(conn, sNum);
		if (result > 0) {
			commit(conn);
		} else
			rollback(conn);

		close(conn);
		return result;
	}

	public ArrayList<DoSurvey> modifySurvey(int sNum, String userId) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		Survey s = sDao.selectSurvey(conn, sNum);
		ArrayList<SurveyTarget> stList = null;
		ArrayList<Question> qList = sDao.selectQuestion(conn, s);
		ArrayList<DoSurvey> dsList = new ArrayList<DoSurvey>();
		if(s.getsTarget() != null) {
			stList = sDao.selectSurveyTarget(conn, s);
			if(stList != null) {
				dsList = sDao.modifySurveyTarget(conn, s, qList, stList);
			}
		}else {
			dsList = sDao.modifySurvey(conn, s, qList);
		}
		
		close(conn);
		
		return dsList;
	}

	public int deleteModifiedSurvey(String[] delSnum, String[] delQnum, ArrayList<String> delAnum) {
		Connection conn = getConnection();
		SurveyDao sDao = new SurveyDao();
		int result1 =  sDao.deleteModifiedAnswer(conn, delQnum);
		int result2 =  sDao.deleteModifiedQuestion(conn, delSnum);
		int result3 =  sDao.deleteModifiedSurvey(conn, delSnum);
		commit(conn);
		
		close(conn);
		return result1 +result2+result3; 
	}

	public void sortChart(String aContent, int qNum) {
		Connection conn = getConnection();
		
		SurveyDao sDao = new SurveyDao();
		sDao.sortChart(conn, aContent, qNum);
	}


	public int purchaseSurvey(String sNums) {
		Connection conn = getConnection();
		System.out.println("purchase Survey : " + sNums);	
		 int result = new SurveyDao().purchaseSurvey(conn, sNums);
		commit(conn);
	
		close(conn);
		return result;
	}

	public ArrayList<SortByType> sortByType(int qNum, String aContent) {
		Connection conn = getConnection();
		
		ArrayList<SortByType> sbtList = new SurveyDao().sortByType(conn, qNum, aContent);
		
		close(conn);
		return sbtList;
	}

	public ArrayList<Survey> selectWaitingSurvey(String userId) {
		Connection conn = getConnection();

		ArrayList<Survey> sList = new SurveyDao().selectWaitingSurvey(conn, userId);

		close(conn);
		return sList;
	}
	
	// 전페 설문 조회
		public ArrayList<Survey> getAllList() {
			Connection conn = getConnection();
			ArrayList<Survey> list = new SurveyDao().allSurvey(conn);


			close(conn);
			return list;
		}

		// 완료된 설문 조회
		public ArrayList<Survey> getCompList() {
			Connection conn = getConnection();
			ArrayList<Survey> list = new SurveyDao().compSurvey(conn);

			close(conn);
			return list;
		}

		// 결제 설문 조회
		public ArrayList<Survey> getHoldList() {
			Connection conn = getConnection();
			ArrayList<Survey> list = new SurveyDao().getHoldList(conn);

			close(conn);
			return list;
		}

		// 진행 설문 조회
		public ArrayList<Survey> getProcList() {
			Connection conn = getConnection();

			ArrayList<Survey> list = new SurveyDao().getProcList(conn);

			close(conn);
			return list;
		}

		public int[] getGenderStats(String value, int qnum) {
			Connection conn = getConnection();
			int MaleStats = new SurveyDao().getMaleStats(conn, value, qnum);
			int FemaleStats = new SurveyDao().getFemaleStats(conn, value, qnum);
			
			int[] stats = {MaleStats , FemaleStats};
			//System.out.println(stats);
			close(conn);
			return stats;
		}

		public int[] getFinalEduStats(String value, int qnum) {
			Connection conn = getConnection();
			int ElementStats = new SurveyDao().getElementStats(conn, value, qnum);
			int MiddleStats = new SurveyDao().getMiddelStats(conn, value, qnum);
			int HighStats = new SurveyDao().getHighStats(conn, value, qnum);
			int CollegeStats = new SurveyDao().getCollegeStats(conn, value, qnum);
			int UniversityStats = new SurveyDao().getUniversityStats(conn, value, qnum);
			int MasterStats = new SurveyDao().getMasterStats(conn, value, qnum);
			int DoctorStats = new SurveyDao().getDoctorMasterStats(conn, value, qnum);
			
			
			int[] stats = {ElementStats, MiddleStats, HighStats, CollegeStats, UniversityStats, MasterStats, DoctorStats};
			close(conn);
			
			return stats;
		}
		


		public int[] getJobStats(String value, int qnum) {
			
			Connection conn = getConnection();
			
			int UnemployedStats = new SurveyDao().getUnemployedStats(conn, value, qnum);
			int StudentStats = new SurveyDao().getStudentStats(conn, value, qnum);
			int SelfStats = new SurveyDao().getSelfStats(conn, value, qnum);
			int OfficeStats = new SurveyDao().getOfficeStats(conn, value, qnum);
			int ServiceStats = new SurveyDao().getServiceStats(conn, value, qnum);
			int TechnicalStats = new SurveyDao().getTechnicalStats(conn, value, qnum);
			int ArtStats = new SurveyDao().getArtStats(conn, value, qnum);
			int ManagementStats = new SurveyDao().getManagementStats(conn, value, qnum);
			int LiveStockStats = new SurveyDao().getLiveStockStats(conn, value, qnum);
			int EctStats = new SurveyDao().getEctStats(conn, value, qnum);

			int [] stats = {UnemployedStats,StudentStats,SelfStats, OfficeStats, ServiceStats, TechnicalStats, ArtStats, ManagementStats, LiveStockStats, EctStats};
			close(conn);
			return stats;
		}

		public int[] getIncomeStats(String value, int qnum) {
			Connection conn = getConnection();
			
			int twoHlessStats = new SurveyDao().getTwoHlessStats(conn, value, qnum);
			int fourHlessStats = new SurveyDao().getFourHlessStats(conn,value, qnum);
			int sixHlessStats = new SurveyDao().getSixHlessStats(conn,value, qnum);
			int sixHmoreStats = new SurveyDao().getSixHmoreStats(conn, value, qnum);
			
			int[] stats = {twoHlessStats, fourHlessStats, sixHlessStats, sixHmoreStats};
			close(conn);
			
			return stats;
		}

		public int[] getLivingTypeStats(String value, int qnum) {
			Connection conn = getConnection();
			int monthlyStats = new SurveyDao().getMonthlyStats(conn, value, qnum);
			int charterStats = new SurveyDao().getCharterStats(conn, value, qnum);
			int onesStats = new SurveyDao().getOnesStats(conn, value, qnum);
			int LivingEctStats = new SurveyDao().getLivingEctStats(conn, value, qnum);
			
			int[] stats = {monthlyStats, charterStats, onesStats, LivingEctStats};
			close(conn);

			return stats;
		}

		public int[] getHouseTypeStats(String value, int qnum) {
			Connection conn = getConnection();
			int singleHsStats = new SurveyDao().getSingleHsStats(conn, value, qnum);
			System.out.println(singleHsStats);
			int multiHsStats = new SurveyDao().getMultiHsStats(conn, value, qnum);
			int apartmentStats = new SurveyDao().getApartmentStats(conn, value, qnum);
			int houseEctStats = new SurveyDao().getHouseEctStats(conn, value, qnum);
			
			int[] stats = {singleHsStats, multiHsStats,apartmentStats, houseEctStats};
			close(conn);

			return stats;
		}

		public int[] getReligionStats(String value, int qnum) {
			Connection conn = getConnection();
			int noneReliStats = new SurveyDao().getNoneReliStats(conn, value, qnum);
			int ChristianStats = new SurveyDao().getChristianStats(conn, value, qnum);
			int BuddhismStats = new SurveyDao().getBuddhismStats(conn, value, qnum);
			int CatholicStats = new SurveyDao().getCatholicStats(conn, value, qnum);
			int ReliEctStats = new SurveyDao().getReliEctStats(conn, value, qnum);
			
			int[] stats = {noneReliStats,ChristianStats ,BuddhismStats,CatholicStats,ReliEctStats};
			close(conn);
			System.out.println(stats[0] +"," + stats[1]+"," + stats[2]+"," + stats[3]);
			return stats;
		}

		public int[] getMaritalStats(String value, int qnum) {
			Connection conn = getConnection();
			int SingleStats = new SurveyDao().getSingleStats(conn, value, qnum);
			int MarriedStats = new SurveyDao().getMarriedStats(conn, value, qnum);
			
			int[] stats = {SingleStats, MarriedStats};
			close(conn);
			return stats;
		}

		public int[] getLivingWithStats(String value, int qnum) {
			Connection conn = getConnection();
			int zeroStats = new SurveyDao().getZeroStats(conn, value, qnum);
			int oneStats = new SurveyDao().getOneStats(conn, value, qnum);
			int twoStats = new SurveyDao().getTwoStats(conn, value, qnum);
			int threeStats = new SurveyDao().getThreeStats(conn, value, qnum);
			int fourStats = new SurveyDao().getFourStats(conn, value, qnum);
			int fiveStats = new SurveyDao().getFiveStats(conn, value, qnum);
			int sixMStats = new SurveyDao().getSixMStats(conn, value, qnum);
			
			int[] stats = {zeroStats, oneStats, twoStats, threeStats, fourStats, fiveStats, sixMStats};
			close(conn);
			return stats;
		}

		public int[] getArmyStats(String value, int qnum) {
		Connection conn = getConnection();
		int militaryPen = new SurveyDao().getMilitaryPen(conn, value, qnum);
		int mifill = new SurveyDao().getMifill(conn,value, qnum);
		int exemption = new SurveyDao().getExemption(conn, value, qnum);
		
		int[] stats = {militaryPen, mifill, exemption};
		close(conn);
		return stats;
		}

		public ArrayList<DoSurvey> adminModifySurvey(int sNum) {
			Connection conn = getConnection();
			SurveyDao sDao = new SurveyDao();
			Survey s = sDao.selectSurvey(conn, sNum);
			ArrayList<SurveyTarget> stList = null;
			ArrayList<Question> qList = sDao.selectQuestion(conn, s);
			ArrayList<DoSurvey> dsList = new ArrayList<DoSurvey>();
			if(s.getsTarget() != null) {
				stList = sDao.selectSurveyTarget(conn, s);
				if(stList != null) {
					dsList = sDao.adminModifySurveyTarget(conn, s, qList, stList);
				}
			}else {
				dsList = sDao.adminModifySurvey(conn, s, qList);
			}
			
			close(conn);
			
			return dsList;
		}

		public int adminMakeSurvey(Survey s, SurveyTarget st, String[] qNum, String[] qType, String[] qTitle,
				ArrayList<String[]> answer) {
				Connection conn = getConnection();
				SurveyDao sDao = new SurveyDao();
				int result = sDao.adminMakeSurvey(conn, s);
				if (result > 0) {
					if (st != null) {
						int result1 = sDao.adminMakeSurveyTarget(conn, st);
					}
					int result2 = sDao.adminMakeQuestion(conn, qNum, qType, qTitle, answer);
					if (result2 > 0) {
						
					}
					commit(conn);
				}
				
				close(conn);
				return result;
			}

		public ArrayList<Survey> adminFinishedSurvey(String userId) {
			Connection conn = getConnection();

			ArrayList<Survey> sList = new SurveyDao().adminFinishedSurvey(conn);

			close(conn);
			return sList;
		}

		public int adminDeleteSurvey(int sNum) {
			Connection conn = getConnection();

			int result = new SurveyDao().deleteSurvey(conn, sNum);
			if (result > 0) {
				commit(conn);
			} else
				rollback(conn);

			close(conn);
			return result;
		}

		public ArrayList<Survey> adminSelectDeletedSurvey() {
			Connection conn = getConnection();

			ArrayList<Survey> sList = new SurveyDao().adminSelectDeletedSurvey(conn);

			close(conn);
			return sList;
		}

		public int adminPowerDeleteSurvey(int sNum) {
			Connection conn = getConnection();

			int result = new SurveyDao().adminPowerDeleteSurvey(conn, sNum);
			if (result > 0) {
				commit(conn);
			} else
				rollback(conn);

			close(conn);
			return result;
		}
		public ArrayList<Survey> adminSelectSurveys() {
			Connection conn = getConnection();
			SurveyDao sDao = new SurveyDao();
			ArrayList<Survey> sList = sDao.adminSelectSurveys(conn);
			System.out.println(sList);
			close(conn);
			return sList;
		}

}
