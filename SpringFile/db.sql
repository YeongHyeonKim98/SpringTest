
-- SpringFile > db.sql

drop table tblSpringBoard;

create table tblSpringBoard (
    seq number primary key,
    subject varchar2(1000) not null,
    content varchar2(3000) not null,
    regdate date default sysdate not null
);

create sequence seqSpringBoard;

create table tblSpringFile (
    seq number primary key,
    filename varchar2(100) not null,
    filesize varchar2(30) not null,
    mimetype varchar2(50) not null,
    bseq number not null references tblSpringBoard(seq)
);

create sequence seqSpringFile;

select * from tblSpringBoard;
select * from tblSpringFile;





