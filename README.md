#동국대 멋사 사이트 개발중..

rails version 4.2.6 <br> ruby version 2.3.1 <br> 템플릿 : 미노형의 SMARTY 템플릿

##주의 사항
1. 각 개발자들은 자신의 이름 별로 branch를 만들어서 설정한다.
1. 컨트롤러 명이나 액션 명은 각 기능 별로 따로 작성한다.
1. 1주에 한 번 씩 master로 합치는 작업을 하고 그 것을 pull 받아서 작업한다.
1. 모델명은 드라이브에 정리되어 있는 이름으로 설정한다.
1. 기본 데이터베이스는 sqlite로 설정하고 후에 mysql로 변경한다.
1. 이슈가 생기면 이슈에 (브랜치 명) 위치 : 이슈 이렇게 적어 둔다. 후에 이슈가 해결되면 ~~취소선 처리~~ 한다. 
1. 현재 상황은 각자 commit시에 어떤 변경 사항이 있는지 적어둔다.
1. 1일 1commit 합시다
!!
## 이슈 

(master) 아직 없음! 

## 현재 상황

###노종원
17.02.20
-
메인 페이지 css만 왼쪽 메뉴바 디자인 고민중.. <br>
메뉴바 render partial함<br>
view/sticky는 공통으로 들어갈 부분 렌더링 할 예정
```html
<%= render partial: "sticky/mainMenu" %>
```
17.02.21
-
왼쪽 메뉴바 디자인 신경 안 쓰기로 함...<br>
footer와 script파일도 render partial함<br>
index화면 구성 slider - 공지사항 - coming up next - 3개 post(과제, 연관 post, Best Idea)설정<bt>
공지사항 masonry사용해서 만듬!<br>
만약 onepage 이동 링크 걸고 싶다면
```html
<div id="topMain" class="nav-onepage">
    <a href="#id"></a>
</div>
<section id="#id"></section>
```
