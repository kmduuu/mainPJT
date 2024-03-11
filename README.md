# ⚾ 야구를 위한 하나의 길, YaguRoute!

![Untitled (1)](https://github.com/kmduuu/mainPJT/assets/120400092/1c184d70-9a3d-4f9d-a528-f24cc46afc6e)

- 배포 URL : http://www.yaguroute.com(현재는 서버가 종료되었습니다.)
- Test ID : admin  
- Test PW : 1234

<br>

## 프로젝트 소개

- 분산 된 야구 관련 서비스를 한 곳에 모은 **야구 통합 웹 서비스** 입니다.
- 우리는 보통 야구 중계를 시청하거나 굿즈 구매를 하는 것, 궁금한 선수의 정보를 검색하려면 각각 다른 사이트에 접속해야 하는 불편함을 느꼈습니다.
- 이 문제를 해결하고자 오직 한 곳에서 편하게 즐길 수 있는 플랫폼 "야구루트"를 생각해냈습니다.

<br>

## 1. 사용 기술

- **사용 기술**
    
    (제가 사용한 기술은 볼드와 기울임 표시 하였습니다)
    
    ✅ **OS**
    
    - **windows 10, Ubuntu 20.04(Naver Cloud Server)**
    
    **✅Front End**
    
    - 언어 : **JavaScript, HTML5, CSS**
    - API : **Ajax, jQuery, Servlet & JSP, JSTL, BootStrap**, Chart JS, **Jackson**, Video.js,
    socket.io-client, **DropZone**
    
    ✅ **Back End**
    
    - 언어 : **Java, javascript**
    - Framework :  **Spring, MyBatis, Sping Boot**, Node.js, Express
    - API : **JDBC, Tomcat, log4j, jUnit, Selenium**, Soket.IO, nodemon, awssdk&multer-s3(Object Storage), multer, mongoose. aws-java-sdk-s3
    
    **✅Naver Cloud**
    
    - **VPC, Global DNS, Server, Cloud DB for MySQL**, Cloud DB for MongoDB, CDN+,
    **LoadBalacner**
    
    **✅ 외부 API**
    
    - **Naver Login, KaKao Login, Daum 주소**, PortOne, Summer Note, **Naver SENS**, Naver
    Map, Naver Live Station, **Naver Objectstorage**, **Naver Image Optimizer**
    
    **✅ 형상 관리**
    
    - **Git**
    
    **✅ Communication Tool**
    
    - **Discord, Notion**
    
    **✅ 개발 IDE & Tool**
    
    - IDE : **Eclipse, VS Code**
    - Tool : **Junit(Unit Test), Maven(Spring Boot Build), MySQL Workbench**, MongoDB
    compass, **Oven App, StarUML**
    
    **✅ CI/CD**
    
    - Deploy : **Jenkins**
    - Runtime Container : **Docker**
<br>

## 서버 스펙

![image](https://github.com/kmduuu/mainPJT/assets/120400092/4acfdf11-02f5-469d-801d-c88fb4bc4ff1)

## 3. Package 구조

![image](https://github.com/kmduuu/mainPJT/assets/120400092/0aed40c3-9138-4e4f-a72d-34fcacb6d12e)

<br>

## 5. 개발 기간 및 작업 관리

### 개발 기간

![image](https://github.com/kmduuu/mainPJT/assets/120400092/ee33d0f2-7c93-4e6c-bf65-36c655d251ca)

- 분석 2주, 설계 2주, 구현을 5주로 정하고, 총 9주동안 프로젝트를 진행하였습니다.

<br>

### 작업 관리

- Notion과 Discord를 통해 진행 상황을 공유하고, 혼자 해결하기 어려운 문제가 발생하면 문제를 공유하고 서로 의논했습니다.
  
![image](https://github.com/kmduuu/mainPJT/assets/120400092/4df9b41f-d6f3-405d-8f6c-b587cd9e2880)

<br>

## 7. 페이지별 기능

### [초기 화면]
- 서비스 접속 초기화면입니다. 로그인이 되지 않았다면 해당 페이지에 접속되고, 로그인이 된다면 메인 페이지로 자동 Redirect 됩니다. 
- 일반 로그인 기능을 구현하였고, 사용자의 편의를 향상시키기 위해 네이버, 카카오 로그인 API를 도입하였습니다.

| 초기화면 |
|----------|
![Untitled](https://github.com/kmduuu/mainPJT/assets/120400092/c5eadfed-6f65-4031-9842-578f236ad75a)

### [카카오 추가정보]
- 카카오 로그인 후, 해당 사이트에서 처음 로그인하게 되면 출력되는 창입니다.
  필수 입력사항 : 닉네임, 생년월일, 주소, 휴대폰 번호
  선택 입력사항 : 선호구단

| 카카오 추가정보 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/3bffc71f-41f1-4699-9479-fe092878434c)

### [네이버 추가정보]
- 네이버 로그인 후, 해당 사이트에서 처음 로그인하게 되면 출력되는 창입니다.
- 카카오 로그인과 정보 입력 내용에 차이가 있는데, 카카오와 다르게 사업자 등록 번호를 입력하지 않아도 휴대폰 번호와 닉네임을 제공받을 수 있습니다.
  필수 입력사항 : 닉네임, 주소
  선택 입력사항 : 선호구단

| 네이버 추가정보 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/2c46148a-2a9c-4f1b-93e1-067e955669e3)

### [아이디 찾기]
- 잃어버린 아이디를 찾기 위한 창입니다.
- 휴대폰 번호를 입력하고 인증번호를 발송한 뒤, 번호를 입력하면 해당 휴대폰 번호를 갖고 있는 전체 아이디가 출력됩니다.

| 비밀번호 찾기 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/94ca8afc-7ed6-45fa-84fd-41734ed314e4)


### [비밀번호 찾기]
- 잃어버린 아이디의 비밀번호를 찾기 위한 창입니다.
- 아이디를 입력 후, 휴대폰 번호를 입력합니다.
- 인증번호를 발송한 뒤, 번호를 입력하면 해당 아이디를 가진 비밀번호가 출력됩니다.

| 비밀번호 찾기 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/ef035c61-8f88-4470-a289-be2fa0b2e628)


### [내 정보 보기]
- 내가 입력했던 정보가 출력됩니다.
- 아이디, 선호구단, 이메일, 휴대폰 번호 등의 개인 정보가 출력되는 것을 확인할 수 있습니다.

| 내 정보 보기 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/abc93bf4-050d-44f7-9617-524c8cf63bdd)


### [회원 정보 수정]
- 사용자가 입력했던 정보를 수정할 수 있습니다.
- 아이디를 제외한 모든 정보가 수정 가능하고, 수정을 완료되면 "수정" 버튼을 반드시 눌러야 합니다. 

| 회원 정보 수정 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/c12ebf4d-d25f-48e3-b923-68bdaecb35f1)


### [회원 가입]
- 아이디와 비밀번호를 입력하면 입력창에서 바로 유효성 검사가 진행되고 통과하지 못한 경우 빨간색 경고 문구가 입력창 하단에 표시됩니다.
- 이메일 주소의 형식이 유효하지 않거나 비밀번호가 15자 미만일 경우에는 각 입력창 하단에 경구 문구가 나타납니다.
- 작성이 완료된 후, 유효성 검사가 통과된다면, 메인 페이지로 들어갈 수 있습니다. 
- 프로필 사진은 선택사항이고, 로컬에 있는 이미지 파일을 끌어올려 첨부가 가능합니다.

| 회원 가입 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/87f9f970-364a-4001-a474-53dfbb4a0897)


### [회원 탈퇴]
- 회원 탈퇴를 진행합니다.
- 비밀번호를 두 번 입력하고, 일치한다면 탈퇴가 가능합니다.
- 탈퇴 시, 사용자가 입력한 개인 정보 뿐만 아니라 커뮤니티에 올린 글, 장바구니, 결제내역 등 모든 정보가 삭제됩니다.

| 회원 탈퇴 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/f4347f02-787c-43f4-a181-c40874d3639b)


### [회원 목록 조회]
- 관리자가 회원 목록을 조회합니다.
- 사이트에 가입한 모든 사용자가 리스트 형태로 출력됩니다.
- 관리자가 아니라면 접속할 수 없습니다. 

| 회원 목록 조회 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/a2405e7a-c57f-4de1-92e8-9f80fa9b17ff)


### [선수 리스트 조회]
- 각 구단에 속한 선수를 조회합니다.
- 선수 명을 입력하여 조회할 수 있고, 초기화 버튼을 통해 입력된 텍스트를 지울 수 있습니다.

| 선수 리스트 조회 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/7d8acd22-dcdd-441c-8cd6-37a58167b4ad)


### [이 주의 선수 목록 조회]
- 이 주의 베스트 선수로 선정 된 9명의 선수단을 확인할 수 있습니다.
- 매 주 월요일 8시마다 업데이트되고, 이전에 베스트 선수로 선정 된 선수단도 확인이 가능합니다. 

| 이 주의 선수 목록 조회 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/a05b9919-de16-48f0-87f2-8f68ca631959)


### [이 주의 선수]
- 각 포지션 별 성적(타율, 평균자책점)이 높은 선수를 9명(타자 8명, 투수 1명) 선정합니다.

| 이 주의 선수 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/5ecde28b-78a1-4f53-8572-28709bd7757b)

<br>

## 8. 트러블 슈팅

- 설정한 시간이 지나 세션이 종료되더라도 로그인 후 이용할 수 있는 페이지에 머무는 오류를 해결하기 위해 WebMVCConfig를 적용하였습니다.
- 네이버 클라우드 서버를 Classic 버전으로 서버를 생성했다가, 해킹을 당하는 치명적인 문제점을 발견 해 VPC 서버로 교체했습니다.
- 크롤링 시, 자동으로 선수 정보를 업데이트 하는 방법이 필요했습니다. Spring Scheduler를 사용해 원하는 시간, 혹은 주기마다 메서드를 동작시켜 자동 크롤링을 구현할 수 있었습니다.
  
<br>

## 9. 개선 목표

<br>

## 10. 프로젝트 후기

### 🍊 김동욱

GitHub 관리자를 맡아 팀원들과 협업에 익숙해지는 것이 첫번째 목표였고, 그 다음이 프로젝트를 모두 사이좋게 마무리하는 것이었습니다.
각자 역할을 분담하고 공통모듈을 합치는 과정에서 마주친 버그들이 꽤 있었는데, 기록해두지 않은 것이 참 아쉬운 부분으로 남습니다. 
그래도 2023년 6월 까지 총 6달 동안 가장 열심히 살았던 것 같아 행복했습니다. 
우리 조원들 모두에게 고생했다고 전하고 싶습니다.
