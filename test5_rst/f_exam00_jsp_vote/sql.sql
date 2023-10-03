select * from emp_master;

create table TBL_VOTE_202005(
	V_JUMIN      CHAR(13) PRIMARY KEY,
	V_NAME       VARCHAR(20),
	M_NO         CHAR(1),
	V_TIME       CHAR(4),
	V_AREA       CHAR(20),
	V_CONFIRM    CHAR(1)
);

desc TBL_VOTE_202005;

insert into TBL_VOTE_202005 values('990101100011','김유권','1','0930','제1투표장','N');

insert into TBL_VOTE_202005 values('890101200021','이유권','2','0930','제1투표장','N');
insert into TBL_VOTE_202005 values('690101100031','박유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('590101200041','홍유권','4','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('790101100051','조유권','5','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('890101200061','최유권','1','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('590101100071','지유권','1','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('490101200081','장유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('790101100091','정유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('890101200101','강유권','4','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('990101100111','신유권','5','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('790101200121','오유권','1','1330','제1투표장','Y');
insert into TBL_VOTE_202005 values('690101100131','현유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('890101100141','왕유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('990101100151','유유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('790101100161','한유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('890101100171','문유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('990101100181','양유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('990101100191','구유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('790101100201','황유권','5','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('690101100211','배유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('790101100221','전유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('990101100231','고유권','1','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('590101100241','권유권','3','1330','제2투표장','Y');

select * from TBL_VOTE_202005;

create table TBL_MEMBER_202005 (
	M_NO		CHAR(1) PRIMARY KEY,
	M_NAME		VARCHAR(20),
	P_CODE		CHAR(2),
	P_SCHOOL	CHAR(1),
	M_JUMIN		CHAR(13),
	M_CITY		VARCHAR(20)
);

desc TBL_MEMBER_202005;

insert into TBL_MEMBER_202005 values('1','김후보','P1','1','6603011999991','수선화동');

insert into TBL_MEMBER_202005 values('2','이후보','P2','3','5503011999992','민들래동');
insert into TBL_MEMBER_202005 values('3','박후보','P3','2','7703011999993','나팔꽃동');
insert into TBL_MEMBER_202005 values('4','조후보','P4','2','8803011999994','진달래동');
insert into TBL_MEMBER_202005 values('5','최후보','P5','3','9903011999995','개나리동');

select * from TBL_MEMBER_202005;

create table TBL_PARTY_202005(
	P_CODE      CHAR(2) PRIMARY KEY,
	P_NAME      VARCHAR2(20),
	P_IDATE     DATE,
	P_READER    VARCHAR2(20),
	P_TEL1      CHAR(3),
	P_TEL2      CHAR(4),
	P_TEL3      CHAR(4)
);

desc TBL_PARTY_202005;

insert into TBL_PARTY_202005 values('P1','A정당','2010-01-01','위대표','02','1111','0001');

insert into TBL_PARTY_202005 values('P2','B정당','2010-02-01','명대표','02','1111','0002');
insert into TBL_PARTY_202005 values('P3','C정당','2010-03-01','기대표','02','1111','0003');
insert into TBL_PARTY_202005 values('P4','D정당','2010-04-01','옥대표','02','1111','0004');
insert into TBL_PARTY_202005 values('P5','E정당','2020-05-01','임대표','02','1111','0005');

select * from TBL_PARTY_202005;



