#동국대 멋사 사이트 개발중..

rails version 4.2.6 <br> ruby version 2.3.1 <br> 템플릿 : 미노형의 SMARTY 템플릿

##주의 사항
1. 각 개발자들은 자신의 이름 별로 branch를 만들어서 설정한다.
1. 컨트롤러 명이나 액션 명은 각 기능 별로 따로 작성한다.
1. 1주에 한 번 씩 ma       ster로 합치는 작업을 하고 그 것을 pull 받아서 작업한다.
1. 모델명은 드라이브에 정리되어 있는 이름으로 설정한다.
1. 기본 데이터베이스는 sqlite로 설정하고 후에 mysql로 변경한다.
1. 이슈가 생기면 이슈에 (브랜치 명) 위치 : 이슈 이렇게 적어 둔다. 후에 이슈가 해결되면 ~~취소선 처리~~ 한다. 
1. 현재 상황은 각자 commit시에 어떤 변경 사항이 있는지 적어둔다.
1. 1일 1commit 합시다!!
1. 님들 남의 폴더 침범 ㄴㄴ 함 
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
css 변경시
no_custom_default

17.02.27
-
로그인 회원가입 모달 완성(아직 영어임)<br>
로그아웃 기능 구현 , 마이페이지 버튼 생성<br>
이제 회원 정보 어찌 보일지 구상해야할 듯..<br>
```ruby
current_user.username #사용가능 
```

17.02.28
-
블로그 기능 만드는중 스카폴드 비슷하게 구현하는데<br>
resources 하면서 scaffold 안하면 index의 prefix가 다른 문제 발생 <br>
show 기능에서 태그 시스템과 댓글 시스템 연관 포스트 시스템 고민 해봐야할듯<br>
is_writer?메소드를 global하게 사용하기 고민해봅시다. <br>
index show 까지함

17.03.04
-
summernote쓰면 자동으로 s3 연동됨
```angular2html
text_area :content, class: :summernote
```
이거에 대한 코드는 scripts.js, route.rb, summerimage_controller.rb, summernote_uploader.rb
에 위치함 <br>

comment 기능은 polymorphic으로 구현 <br>
사용법은 추가 시키고 싶은 모델에
```ruby
has_many :comments, as: commentable
```
추가 시키고 create 작업은 
```ruby
#1번 방법  
Post.first.comments.create(body: "dd", user_id: 1)

#2번 방법 
Comment.create(commentable: Post.first, body: "dd", user_id: 1)
```
뷰에 적용하는 방법은

<br>route.rb
```ruby
resources :blog do
    resources :comments, module: :blog, only: [:create, :destroy]
end
```
show.html.erb
```ruby
//댓글 달기 폼 추가하고 
<%= render 'comments/form', commentable: @blog, url: :blog %>
<div class="comment-list">
  <% @blog.comments.each do |comment| %>
          <!--댓글달기 ajax용 렌더-->
          <%= render 'comments/item', comment: comment, count: count, url: :blog %>
  <% end %>
</div>
```
나머지는 views/comments에서 확인 