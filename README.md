# 📍Chunjae Project 01
천재교육 첫번째 프로젝트 
# 💻프로젝트 소개
"CORNEDU" 라는 인터넷 강의와 학부모 및 학생의 커뮤니티를 제공하는 가상 교육 기업이다.


### 📅 개발 기간
* 23.08.01 ~




### 👤 팀원 
* **박진권** : QnA , Faq 카테고리 기능 구현, 화면설계도 작성 
* **김현경** : 마이페이지 (정보수정, 내가 쓴 글) 기능 구현, 화면설계도 작성
* **김보경** : 로그인, 로그아웃, 아이디 중복 체크, 회원가입 기능 구현, usecaseDiagram 작성
* **신예은** : 관리자페이지(회원관리, 커뮤니티 관리, 개인정보 변경) 기능 구현, usecaseDiagram 작성
* **오태훈** : 학부모 커뮤니티, 학생 커뮤니티 기능구현, 소개 페이지 제작, 요구사항정의서 작성
* 전체 메뉴 구성 기획 및 DB 설계, frontend 설계는 다같이!




### ⚙ 개발 환경


* 페이퍼 프로토타입으로 사용성을 테스트 한 후, html과 css, javascript로 작성하여 프론트엔드를 설계하였고
백엔드 부분은 jsp의 디렉티브, 스크립트릿, 표현식만 활용하여 기업형 데스크탑 웹 애플리케이션을 작성하였습니다. 



#### ✅FRONTEND : <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"><img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"><img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">

#### ✅BACKEND : <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">


#### ✅DATABASE : <img src="https://img.shields.io/badge/mariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white"><img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">

#### ✅Server : <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">



### 📌 주요기능


*  **회원기능** (로그인, 로그아웃, 회원가입)
* **마이페이지** ( 개인정보수정 및 내가 쓴 글 목록, 글 상세보기)
* **관리자페이지** (회원 정보 수정, 회원 강제 탈퇴, 회원 통계, 글 관리 기능)
* **게시판** ( 게시판 글 목록, 글 상세보기, 글 등록, 글 수정, 글삭제)
* **Qna 및 FAQ** ( 글 목록, 글 상세보기, 글 등록, 글 수정, 글삭제)


# ⚒프로젝트 설계

### 📂개념적 설계 (USE CASE DIAGRAM)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/848d0d3f-ac3b-4ee7-8da7-15e52cd62c8b)
### 📂논리적 설계
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/b9200ed8-74b4-427e-bafb-260a74497fe7)
### 📂논리적 ERD
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/fee9b456-59db-43e1-bec4-cb07f8ad6cf2)
### 📂DATABASE
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/8f7be9dd-bf0e-4142-87bb-aa2407134e0b)
### 📂DATABASE - 테이블 구현
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/e94a6a06-9672-4e26-ae7a-361aa2225e6a)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/1e40c798-815a-44b8-97e3-5214524e6366)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/fb25266e-ed08-45eb-978f-515c8cabdbb8)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/4d1ecd48-ff5e-4443-9dd0-a23fe91d8487)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/cc1c70c4-1454-4b1a-8efe-29af5d83e5ba)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/69a2d610-490a-4950-8c02-94e8462a3a8c)
### 📂DATABASE - 테이블 ERD
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/b347b26d-6372-4b09-bd9a-447e6bf70f2e)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/cd6e23ad-291e-44ab-9b39-560ac020e39d)


### 📂CLASS DIAGRAM
![class diagram](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/f1e567b0-5043-4a4b-859e-92085b0684e9)

# 📎기능 구현

## 🗂로그인/회원가입
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/42c1eb55-ffe0-4827-8f6a-ef260a65df22)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/1f2388dd-a006-446b-a4a6-d32daf7c2c0d)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/68976ae7-4696-4b51-ba7c-317a6f4be0bb)

## 🗂게시판(커뮤니티, faq, qna)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/bb3a2cec-4d52-4cf5-9623-32325e1f6245)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/e8cbd4bf-03de-4864-9543-41cc36d6903f)

## 🗂마이페이지
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/65c54683-2c33-4358-8022-9f4d824fb82e)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/3ae9f6a7-96f8-4604-a8e0-72b5a9959aa6)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/244bfecf-5c5a-4fda-8023-5018b5960f96)

## 🗂관리자페이지
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/759fb3b1-61dc-4824-bf5c-1b4ef2a98a53)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/77c2995b-4c08-433e-9a40-9276929e7ca0)
