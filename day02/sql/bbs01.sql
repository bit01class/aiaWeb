-- 게시판(bbs01)
-- 글번호(num), 제목(sub), 글쓴이(name), 날짜(nalja), 내용(content)
drop table bbs01;
create table bbs01(
	num number,
	sub varchar2(30),
	name varchar2(15),
	nalja date,
	content varchar2(2000)
);
insert into bbs01 values (1,'제목없음','user1',sysdate,' 냉무');
insert into bbs01 values (2,'제목없음','user2',sysdate,' 냉무');
insert into bbs01 values (3,'제목없음','user1',sysdate,' 냉무');
insert into bbs01 values (4,'제목없음','user4',sysdate,' 냉무');
insert into bbs01 values (5,'제목없음','user3',sysdate,' 냉무');
commit;
select * from bbs01 order by num desc;

