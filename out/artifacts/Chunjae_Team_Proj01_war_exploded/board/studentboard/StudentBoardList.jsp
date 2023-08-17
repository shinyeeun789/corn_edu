<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 로딩 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae_pro01.util.DBC" %>
<%@ page import="com.chunjae_pro01.util.MariaDBCon" %>
<%
    String path5 = request.getContextPath();
%>

<%
    int pageNo = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
    // 총 페이지 수
    int totalPage = 0;
    // 마지막 페이지
    int endPage = pageNo+2 < 5 ? 5 : pageNo+2;
    // 학부모 게시글 총 개수
    int count = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    // 페이징 처리 - 전체 페이지 수 구하기
    String sql = "SELECT COUNT(*) as 'count' FROM studentboard";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    if(rs.next()) {
        count = rs.getInt("count");
        totalPage = count % 10 == 0 ? count / 10 : (count / 10) + 1;
        // 전체 페이지가 0일 경우 (=게시글이 없는 경우)
        totalPage = (totalPage == 0) ? 1 : totalPage;
    }
    rs.close();
    pstmt.close();

    // 페이징 처리 - 현재 페이지에 출력될 페이지 리스트 구하기
    if(endPage > totalPage) {
        endPage = totalPage;
    }
    List<Integer> pageList = new ArrayList<>();
    for(int p=(endPage-4 > 0 ? endPage-4 : 1); p<=endPage; p++) {
        pageList.add(p);
    }

    // 현재 페이지에 출력할 학부모 게시글 데이터만 가져오기
    sql = "SELECT * FROM studentboard ORDER BY bno DESC";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, 10*(pageNo-1));
    rs = pstmt.executeQuery();

    List<StudentBoard> studentBoardList = new ArrayList<>();
    while(rs.next()) {
        StudentBoard sBoard = new StudentBoard();
        sBoard.setBno(rs.getInt("bno"));
        sBoard.setTitle(rs.getString("title"));
        sBoard.setAuthor(rs.getString("author"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        sBoard.setResdate(sdf.format(d));
        studentBoardList.add(sBoard);
    }
    con.close(rs, pstmt, conn);
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
    <link rel="stylesheet" href="<%=path5%>/css/google.css">
    <link rel="stylesheet" href="<%=path5%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path5%>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path5%>/css/common.css">
    <link rel="stylesheet" href="<%=path5%>/css/header.css">
    <link rel="stylesheet" href="<%=path5%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path5%>/css/msboard.css">
    <link rel="stylesheet" href="<%=path5%>/css/footer.css">
    <style>
        .contents {
            clear:both;
            min-height:100vh;
        }
        .contents::after {
            content:"";
            clear:both;
            display:block;
            width:100%;
        }

        .page {
            clear:both;
            width: 100%;
            min-height: 100vh;
            position:relative;
            top: 50px;
            margin: 0px auto;
        }
        .page::after {
            content:"";
            display:block;
            width: 100%;
            clear:both;
        }

        .page_wrap {
            clear:both;
            width: 1000px;
            height: auto;
            margin:0 auto;
        }

        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 80px 30px 30px 10px;
        }
    </style>

    <link rel="stylesheet" href="<%=path5%>/css/footer.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

    <link rel="stylesheet" href="<%=path5%>/jquery.dataTables.css">
    <script src="<%=path5%>/jquery.dataTables.js"></script>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path5 %>">Home</a> &gt; <span> 관리자 페이지 </span> </p>
                <h2 class="page_tit"> 학부모커뮤니티 상세보기 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> 학생 커뮤니티 </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="bno" style="padding-right: 200px"> 글번호 </div>
                            <div class="Title" style="padding-right: 100px"> 제목 </div>
                            <div style="width: 25%; padding-left: 120px"> 작성자 </div>
                            <div class="resdate"> 작성일 </div>
                        </div>
                        <% for(StudentBoard studentBoard: studentBoardList) { %>
                        <div>
                            <div class="bno"> <%=studentBoard.getBno()%> </div>
                            <% if(sid!=null) { %>
                            <div class="qTitle"> <a href="<%=path5%>/board/studentboard/getStudentBoard.jsp?bno=<%=studentBoard.getBno() %>"><%=studentBoard.getTitle() %></a> </div>
                            <% } else { %>
                            <div class="qTitle"><%=studentBoard.getTitle() %></div>
                            <% } %>
                            <div style="width: 25%"> <%=studentBoard.getAuthor()%> </div>
                            <div class="resdate"> <%=studentBoard.getResdate()%> </div>
                        </div>
                        <% } %>
                        <% if(count == 0) { %>
                        <div>
                            <p class="result"> 공지사항이 없습니다 :) </p>
                        </div>
                        <% } %>
                    </div>
                    <div class="board_page">
                        <a href="<%=path5%>/board/studentboard/StudentBoardList.jsp?page=1" class="bt first"> &lt;&lt; </a>
                        <a href="<%=path%>/board/studentboard/StudentBoardList.jsp?page=<%=pageNo-1 < 1 ? 1 : pageNo-1%>" class="bt prev"> &lt; </a>
                        <%  for(int p : pageList) {  %>
                        <a href="<%=path5%>/board/studentboard/StudentBoardList.jsp?page=<%=p%>" class="num <%=(p==pageNo) ? "on" : ""%>"> <%=p%> </a>
                        <%  } %>
                        <a href="<%=path5%>/board/studentboard/StudentBoardList.jsp?page=<%=pageNo+1 > totalPage ? totalPage : pageNo+1%>" class="bt next"> &gt; </a>
                        <a href="<%=path5%>/board/studentboard/StudentBoardList.jsp?page=<%=totalPage%>" class="bt last"> &gt;&gt; </a>
                    </div>
                </div>
            </div>
        </section>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>