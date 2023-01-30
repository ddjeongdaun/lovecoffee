#프로젝트2
create database coffee;
use coffee;

#회원
create table member (
no					int 		primary key		auto_increment		,
userid 				char(30) 	unique  not null					,
pwd					char(255) 	not null							,
name 				char(30) 	not null							,
email 				char(100) 	not null							,
hp	 				char(20) 	not null							,
zipcode				char(5)							,		#우편번호
address				char(200)						,		#기본주소
addressDetail		char(100)						,		#상세주소
regdate				datetime	default CURRENT_TIMESTAMP	#회원가입일
);


#관리자
create table admin(
no					int			primary key		auto_increment		,
userid				char(30)	unique not null	,
pwd					char(255)	not	null	,
name				char(30)	not null	,
email				char(100)	not	null
);

#우편번호
create table zipcode(
zipcode 			char(7),	#우편번호
area1 				char(10),	#시
area2 				char(20),	#구
area3 				char(40),	#동
area4 				char(20)	#상세주소
);

#카테고리
create table category(
no					int			primary key		auto_increment		,
categoryName		char(50)	not null
);

insert into category(categoryName) value('ice');
insert into category(categoryName) value('hot');

#상품(product)
create table product(
productNo				int			primary key		auto_increment,	#상품번호
categoryNo				int			not null	,				#카테고리번호
foreign key (categoryNo) references category(no),
productName				char(30)	not null	,				#제품명
price					int			not null	,				#가격
explains				blob(300)				,				#상세설명
regdate					datetime	default current_timestamp,	#상품등록일
imageURL				char(50)								#이미지url
);

insert into product(categoryNo, productName, price, explains, regdate, imageURL)
values(1,'아메리카노','4000','깊고 진한 커피풍미를 느낄 수 있는 아이스 아메리카노',now(),'icedAmericano.jpg');
insert into product(categoryNo, productName, price, explains, regdate, imageURL)
values(2,'아메리카노','3800','깊고 진한 커피풍미를 느낄 수 있는 핫 아메리카노',now(),'hotAmericano.jpg');
insert into product(categoryNo, productName, price, explains, regdate, imageURL)
values(1,'카페라떼','5000','깊고 진한 커피풍미를 느낄 수 있는 카페라떼',now(),'iceCafelatte.jpg');
insert into product(categoryNo, productName, price, explains, regdate, imageURL)
values(2,'카페라떼','4800','깊고 진한 커피풍미를 느낄 수 있는 따듯한 카페라떼',now(),'hotCafelatte.jpg');

#주문
create table myOrder(
orderNo					int			primary key		auto_increment,	#번호
customerId				char(30)	not null,						#회원아이디
foreign key	(customerId) references member(userid),
totalPrice				int					,						#총가격
deliveryStatus			int					,						#배송현황 (1:배송/픽업전, 2:배송/픽업 진행중 3.배송/픽업완료)
zipcode					char(5),									#우편번호
address					char(200),									#기본주소
addressDetail			char(100),									#상세주소
regdate					datetime	default CURRENT_TIMESTAMP		#주문일자(결제일)
);

#장바구니
create table cart(
cartNo					int			primary key		auto_increment,	#번호
customerId				char(30)	not null,						#회원아이디
foreign key	(customerId) references member(userid),	
productNo				int			not null,						#상품번호
foreign key (productNo)	references product(productNo),
quantity				int			not	null,						#수량
regdate					datetime	default current_timestamp		#등록일
);

commit;