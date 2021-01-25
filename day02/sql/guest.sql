-- 방명록(guest01)
-- 글(content),글쓴이(name),날짜(nalja)
drop table guest01;
create table guest01(
	content varchar2(1024),
	name varchar2(15),
	nalja date
);
-- dummy data
insert into guest01 values ('일빠','user1',sysdate-4);
insert into guest01 values ('2등','user2',sysdate-3);
insert into guest01 values ('3등으로 글쓰다','user3',sysdate-3);
insert into guest01 values ('많이 늦은 4등','user4',sysdate-1);
commit;
select * from guest01 order by nalja desc;