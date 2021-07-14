select * from prof_position;

--교수 직책
insert into prof_position
values(1, '정교수');
insert into prof_position
values(2, '부교수');
insert into prof_position
values(3, '조교수');
insert into prof_position
values(4, '전임강사');
insert into prof_position
values(5, '시간강사');

--카테고리
insert into category(category_code, category_name)
values(1, '공지사항');
insert into category(category_code, category_name)
values(2, '자유게시판');
insert into category(category_code, category_name)
values(3, '거래게시판');
insert into category(category_code, category_name)
values(4, '개설교과목공지');