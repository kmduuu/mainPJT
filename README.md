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

### [비밀번호 찾기]
- 잃어버린 아이디의 비밀번호를 찾기 위한 창입니다.
- 아이디를 입력 후, 휴대폰 번호를 입력합니다.
- 인증번호를 발송한 뒤, 번호를 입력하면 해당 아이디를 가진 비밀번호가 출력됩니다.

| 비밀번호 찾기 |
|----------|
![image](https://github.com/kmduuu/mainPJT/assets/120400092/ef035c61-8f88-4470-a289-be2fa0b2e628)


<br>

## 8. 트러블 슈팅

- [탭메뉴 프로필 버튼 이슈](https://github.com/likelion-project-README/README/wiki/README-8.%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85_%ED%83%AD%EB%A9%94%EB%89%B4-%ED%94%84%EB%A1%9C%ED%95%84-%EB%B2%84%ED%8A%BC-%EC%9D%B4%EC%8A%88)

- [프로필 수정 이슈](https://github.com/likelion-project-README/README/wiki/README-8.%ED%8A%B8%EB%9F%AC%EB%B8%94-%EC%8A%88%ED%8C%85_%ED%94%84%EB%A1%9C%ED%95%84-%EC%88%98%EC%A0%95-%EC%9D%B4%EC%8A%88)

<br>

## 9. 개선 목표

- API 모듈화 : API를 불러오는 코드의 반복이 많아 모듈화할 예정
- lighthouse Performance 증진
    - 모든 페이지에서 특히 Best Practices & SEO 점수는 90~100으로 우수
    - Performance 점수가 대체적으로 미흡한 문제
    
    ![KakaoTalk_Photo_2023-01-04-16-55-30](https://user-images.githubusercontent.com/112460466/210591134-09bf8efd-3c34-4b99-a3d7-895ca99e1457.png)
    
- **23-01-17 성능 개선 내용**
    
    ![성능개선 후](https://user-images.githubusercontent.com/106502312/212872369-7ceeb2cf-d551-41d2-bfb0-01e35e9903fe.png)
    
    - 이미지 최적화
        - `<img>` 요소에 `width` , `height` 속성값을 명시해 불필요한 Reflow를 방지했습니다.
        - browser-image-compression 라이브러리를 사용해 유저가 업로드하는 이미지를 압축했습니다.
        - Intersection Observer API를 사용해 Lazy Loading 기법을 적용하여 홈 피드의 게시글 이미지가 viewport 내에 들어오는 순간 로딩되도록 변경했습니다.
    - 웹폰트 최적화
        - WOFF2 포맷을 추가하고 가장 우선적으로 적용되도록 선언했습니다.
        - 서브셋 폰트로 교체해 용량을 줄였습니다.
    
<br>

## 10. 프로젝트 후기

### 🍊 고지연

깃헙을 통한 협업에 익숙해지는 것, 서로 감정 상하지 않고 무사히 마무리하는 것이 1차적인 목표였어서 항상 이 부분을 명심하면서 작업했습니다.
각자 페이지를 작업하고 합치는 과정에서 마주친 버그들이 몇 있었는데, 시간에 쫓기느라 해결하기에 급급해서 제대로 트러블슈팅 과정을 기록하지 못한 게 살짝 아쉬운 부분으로 남습니다. 그래도 2022년 한 해 동안 가장 치열하게 살았던 한 달인 것 같습니다. 조원들 모두에게 고생했다고 전하고 싶습니다🧡

<br>

### 👻 김민제

여러모로 많은 것들을 배울 수 있었던 한 달이었습니다. 혼자서는 할 수 없었던 일이라는 것을 너무 잘 알기에 팀원들에게 정말 감사하다는 말 전하고 싶습니다. 개인적으로 아쉬웠던 부분은 기한 내에 기능을 구현하는 데에만 집중하면서 트러블 슈팅이나 새로 배웠던 것들을 체계적으로 기록하지 못했다는 점입니다. 이렇게 느낀 바가 있으니 이후의 제가 잘 정리하면서 개발할 거라 믿습니다… 하하 다들 수고하셨습니다!!!!

<br>

### 😎 양희지

팀 프로젝트 시작에 앞서 초기 설정을 진행하며 체계적인 설계의 중요성을 느꼈습니다. 앞으로는 점점 더 체계적이고 효율적으로 프로젝트를 진행할 수 있도록 발전하고 싶습니다.
정규 수업 직후에 프로젝트를 진행하면서 배운 내용을 직접 구현하는 과정이 어색했지만 어떤 부분이 부족한지 알 수 있는 기회였습니다. 스스로 최대한 노력해보고 팀원들과 함께 해결해 나가면서 협업의 장점을 체감할 수 있었습니다. 하지만 빠르게 작업을 진행하면서 팀원들과 함께 해결한 이슈가 어떤 이슈이며 어떻게 해결했는지에 대해 자세히 작성하지 못한 것이 아쉽습니다.
’멋쟁이 사자처럼’이라는 같은 목표를 가진 집단에서 프로젝트에 함께할 수 있는 소중한 경험이었습니다. 함께 고생한 조원들 모두 고생하셨습니다! 앞으로도 화이팅해서 함께 목표를 이뤄가고 싶습니다.

<br>

### 🐬 지창언

컨벤션을 정하는 것부터 Readme 파일 작성까지 전 과정을 진행하려니 처음 생각보다 많은 에너지를 썼어요. 좋은 의미로 많이 썼다기보다, 제 능력을 십분 발휘하지 못해서 아쉬움이 남는 쪽입니다. 개발한다고 개발만 해서는 안 된다는 것을 몸소 느껴보는 기간이었던 것 같습니다. 이번 기회로 프로젝트를 진행하면서, 제가 잘하는 점과 부족한 점을 확실하게 알고 가는 건 정말 좋습니다. 기술적인 부분에 있어서는 리액트의 컴포넌트화가 주는 장점을 알았습니다. 조금 느린 개발이 되었을지라도 코드 가독성 부분에 있어서 좋았고, 오류가 발생해도 전체가 아닌 오류가 난 컴포넌트와 근접한 컴포넌트만 살펴보면 수정할 수 있는 부분이 너무 편했습니다. 모두 고생 참 많으셨고 리팩토링을 통해 더 나은 프로젝트 완성까지 화이팅입니다.
