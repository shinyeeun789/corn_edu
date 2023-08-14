<%--
  Created by IntelliJ IDEA.
  User: jk347
  Date: 2023-08-14
  Time: 오전 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 로딩 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae_pro01.dto.Board" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="java.util.Date" %>

<%
    String path3 = request.getContextPath();
%>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    //2. DB 연결하기
    DBC conn = new MariaDBCon();
    con = conn.connect();

    //3. SQL을 실행하여 Result(공지사항목록)을 가져오기
    String sql = "select * from board order by bno desc";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4.가져온 목록을 boardList(공지사항목록)에 하나 씩 담기
    List<Board> boardList = new ArrayList<>();
    while(rs.next()){
        Board bd = new Board();
        bd.setBno(rs.getInt("bno"));
        bd.setTitle(rs.getString("title"));
        bd.setContent(rs.getString("content"));
        bd.setAuthor(rs.getString("author"));
        bd.setResdate(rs.getString("resdate"));
        bd.setCnt(rs.getInt("cnt"));
        boardList.add(bd);
    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path3%>/css/google.css">
    <link rel="stylesheet" href="<%=path3%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path3%>/css/login.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path3%>/css/common.css">
    <link rel="stylesheet" href="<%=path3%>/css/header.css">
    <link rel="stylesheet" href="<%=path3%>/css/board.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("<%=path3%>/images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 400px; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:500px; margin:0 auto; }
        .tb1 td { width:500px; line-height: 48px; padding-top:24px; padding-bottom:24px; }

        .indata { display:inline-block; width: 500px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path3%>/css/footer.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>
    <style>
        #myTable_length, #dataTables_filter { margin-top:20px; margin-bottom:20px; }
    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="">공지사항</a> &gt; <span>공지사항 목록</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">공지사항 목록</h2>
                <br><br><hr><br><br>
                <table class="tb1" id="myTable">
                    <thead>
                    <th class="item1">글번호</th>
                    <th class="item2">글제목</th>
                    <th class="item3">작성자</th>
                    <th class="item4">작성일</th>
                    </thead>
                    <tbody>
                    <%-- 5. boardList(공지사항목록)을 테이블 태그의 tr 요소를 반복하여 출력 --%>
                    <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                        for(Board bd:boardList) {
                            Date d = ymd.parse(bd.getResdate());  //날짜데이터로 변경
                            String date = ymd.format(d);    //형식을 포함한 문자열로 변경
                    %>
                    <tr>
                        <td class="item1"><%=bd.getBno() %></td>
                        <td class="item2">
                            <%-- 6. 로그인한 사용자만 제목 부분의 a요소에 링크 중 bno 파라미터(쿼리스트링)으로 상세보기를 요청 가능--%>
                            <% if(sid!=null) { %>
                            <a href="/board/getBoard.jsp?bno=<%=bd.getBno() %>"><%=bd.getTitle() %></a>
                            <% } else { %>
                            <span><%=bd.getTitle() %></span>
                            <% } %>
                        </td>
                        <td class="item3"><%=bd.getAuthor() %></td>
                        <td class="item4"><%=date %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order:[[0, "desc"]]
                        });
                    });
                </script>
                <div class="btn_group">
                    <br><hr><br>
                    <%-- 공지사항이므로 관리자만 글 추가 기능(링크)이 적용되도록 설정 --%>
                    <% if(sid!=null && sid.equals("admin")) { %>
                    <a href="/board/addBoard.jsp" class="inbtn">글쓰기</a>
                    <% } else { %>
                    <p>관리자만 공지사항의 글을 쓸 수 있습니다.<br>
                        로그인한 사용자만 글의 상세내용을 볼 수 있습니다.</p>
                    <% } %>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>