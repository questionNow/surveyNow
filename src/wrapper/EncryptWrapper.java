package wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{
 
	// 부모 클래스인 HttpServletRequestWrapper에는 기본생성자가 없기 때문에
	// 반드시 명시적으로 매개변수 있는 생성자를 작성해 주어야 한다.
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	// ServletRequestWrapper의 getParameter 메소드를 오버라이딩
	@Override
	public String getParameter(String key){
		
		String value="";
		
		if(key != null && key.equals("userPwd")) {
			// request 객체에 담긴 파라미터 key 값이 userPwd인 경우 암호화 하는 내용
			value = getSha512(super.getParameter(key));
		}else {
			value=super.getParameter(key);
		}
		
		return value;
	}
	
	/*
	 * sha512 해쉬 함수를 사용하여 암호화한다.
	 */
	public static String getSha512(String userPwd) {
		String encPwd = null;
		
		// SHA-512 방식의 암호화 객체
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 전달 받은 userPwd를 UTF-8형식의 바이트 배열로 리턴함
		byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
		
		// md 객체에 userPwd 바이트 배열을 전달해서 갱신
		md.update(bytes);
		
		// java.util.Base64 인코더를 이용해서 암호화된 바이트 배열을 인코딩해서 문자열로 출력
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		
		return encPwd;
	}
	
	// 이제 이 EncryptWrapper를 필터에 적용시키기 위해 EncryptFilter를 만들러 가자!(filter폴더로)
	
	
	

}
