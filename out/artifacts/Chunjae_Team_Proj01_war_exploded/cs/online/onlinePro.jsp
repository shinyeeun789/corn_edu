<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>

<%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        //3. 보내온 이메일 데이터 받기
        String name = request.getParameter("name");
        String id = request.getParameter("author");
        String email = request.getParameter("from");    //보내는 사람 이메일
        String tel = request.getParameter("tel");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String to = "admin@cornedu.com";  //받는 사람 이메일

        //4. smtp 설정 -> Properties 활용
        Properties p = new Properties();
        p.put("mail.smtp.host","smtp.naver.com");
        p.put("mail.smtp.port", "465");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.debug", "true");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.socketFactory.fallback", "false");

        //5. 이메일 보내기
        try {
                Authenticator auth = new SMTP();
                Session ses = Session.getInstance(p, auth);

                ses.setDebug(true);
                MimeMessage msg = new MimeMessage(ses);

                msg.setSubject(title); //  메일 제목 추가

                StringBuffer buffer = new StringBuffer();   //이메일 내용
                buffer.append("보내는 사람 : ");
                buffer.append(name+"\n");
                buffer.append("연락처 : ");
                buffer.append(tel+"\n");
                buffer.append("이메일 : ");
                buffer.append(email+"\n");
                buffer.append("제목 : ");
                buffer.append(title+"\n");
                buffer.append("내용 : ");
                buffer.append(content+"\n");

                Address fromAddr = new InternetAddress(email);  //보내는 사람
                msg.setFrom(fromAddr);

                Address toAddr = new InternetAddress(to);      // 받는 사람
                msg.addRecipient(Message.RecipientType.TO, toAddr);



                msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 메일 내용 추가
                //msg.setText("이메일 내용"); - 메일 내용이 텍스트로만 가능
                Transport.send(msg); // 이메일 전송
        } catch(Exception e){
                e.printStackTrace();
                return;
        } finally {
                response.sendRedirect("/index.jsp");
        }

%>