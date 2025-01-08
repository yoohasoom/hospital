create table tbl_patient_202005(
p_no char(4) not null primary key,
p_name varchar2(20),
p_birth char(8),
p_gender char(1),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4),
p_city char(2)
);

create table tbl_lab_test_202005 (
t_code char(4) not null primary key,
t_name varchar2(20)
);

create table tbl_result_202005(
p_no char(4) not null,
t_code char(4) not null,
t_sdate date not null,
t_status char(4),
t_ldate date,
t_result char(4),
primary key(p_no, t_code, t_sdate)
);

insert into tbl_patient_202005 values('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
insert into tbl_patient_202005 values('1002', '이환자', '19900301', 'M', '010', '2222', '0002', '20');
insert into tbl_patient_202005 values('1003', '박환자', '19770301', 'F', '010', '2222', '0003', '30');
insert into tbl_patient_202005 values('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10');
insert into tbl_patient_202005 values('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40');
insert into tbl_patient_202005 values('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40');
insert into tbl_patient_202005 values('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10');

insert into tbl_lab_test_202005 values('T001', '결핵');
insert into tbl_lab_test_202005 values('T002', '장티푸스');
insert into tbl_lab_test_202005 values('T003', '수두');
insert into tbl_lab_test_202005 values('T004', '홍역');
insert into tbl_lab_test_202005 values('T005', '콜레라');

insert into tbl_result_202005 values('1001', 'T001', '20200101', '1', '20200102', 'X');
insert into tbl_result_202005 values('1002', 'T002', '20200101', '2', '20200102', 'P');
insert into tbl_result_202005 values('1003', 'T003', '20200101', '2', '20200102', 'N');
insert into tbl_result_202005 values('1004', 'T004', '20200101', '2', '20200102', 'P');
insert into tbl_result_202005 values('1005', 'T005', '20200101', '2', '20200102', 'P');
insert into tbl_result_202005 values('1006', 'T001', '20200101', '2', '20200102', 'N');
insert into tbl_result_202005 values('1007', 'T002', '20200101', '2', '20200102', 'P');
insert into tbl_result_202005 values('1005', 'T003', '20200101', '2', '20200102', 'P');
insert into tbl_result_202005 values('1006', 'T004', '20200101', '2', '20200102', 'N');
insert into tbl_result_202005 values('1007', 'T005', '20200101', '2', '20200102', 'N');

<--List-->
select p_no, p_name, substr(p_birth, 1, 4), substr(p_birth, 5, 2), substr(p_birth, 7, 2), p_gender, p_tel1, p_tel2, p_tel3, p_city
from tbl_patient_202005;

<--Listresult-->
select tp.p_no, tp.p_name, tl.t_name, "
substr(t_sdate, 1, 2), substr(t_sdate, 4, 2), substr(t_sdate, 7, 2),
tr.t_status,
substr(t_ldate, 1, 2), substr(t_ldate, 4, 2), substr(t_ldate, 7, 2)
tr.t_result
from tbl_patient_202005 tp, tbl_lab_test_202005 tl, tbl_result_202005 t
where tp.p_no = tr.p_no and tl.t_code = tr.t_code;

<--RegiConfirm-->
insert into tbl_result_202005 values(?, ?, ?, ?, ?, ?);

<--result-->
select tp.p_city, count(*)
from tbl_patient_202005 tp, tbl_result_202005 tr
where tp.p_no = tr.p_no
group by tp.p_city
order by tp.p_city;