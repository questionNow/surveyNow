<%@page import="com.google.gson.JsonObject"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="user.controller.SMTPAuthenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="com.google.gson.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
 
String m_name = "서재웅";   
String m_email = request.getParameter("emailTo");
String m_title = "테스트 메일"; 
String m_text = "인증번호는  ";   
int randomNum = (int)(Math.random()*10000)+1;  // <- 추가 메일 내용 
String plusText = " 입니다. 정확히 입력해주세요.";
try {
    String mail_from = "chadolskii123@gmail.com";  // 내 메일 
    String mail_to = m_email;  // 받는 사람 
    String title = m_title;  // 제목 
    String contents = m_text + randomNum + plusText; //  메일 내용 

    mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
    mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");

    Properties props = new Properties();
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "465");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.fallback", "false");
    props.put("mail.smtp.auth", "true");

    Authenticator auth = new SMTPAuthenticator();

    Session sess = Session.getDefaultInstance(props, auth);

    MimeMessage msg = new MimeMessage(sess);

    msg.setFrom(new InternetAddress(mail_from));
    msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
    msg.setSubject(title, "UTF-8");
    msg.setContent(contents, "text/html; charset=UTF-8");
    msg.setHeader("Content-type", "text/html; charset=UTF-8");

    Transport.send(msg);
} catch (Exception e) {
    response.sendRedirect("views/common/errorPage.jsp");  //  실패 
} finally {

}
out.println("<script>alert('이메일을 확인해주세요');</script>");  // 성공 시
String num = ""+randomNum;
response.setContentType("text");
response.getWriter().print(num);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>