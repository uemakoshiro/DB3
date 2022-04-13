--���K���-SQL1-��{

--1.�f�[�^�x�[�X�쐬
CREATE DATABASE db_exam;


--2.�e�[�u���쐬-����1
create table major (
major_id int primary key
,major_name varchar(50));


--3.�e�[�u���쐬-����2
create table student (
student_id int primary key
,student_name varchar(50)
,grade int
,hometown varchar(50)
,major_id int NOT NULL REFERENCES major(major_id));


--4."major"�e�[�u���փf�[�^�o�^
insert into major values (1,'�p���w'),(2,'���p�Ȋw')
,(3,'���H�w'),(4,'�o�ϊw'),(5,'���ە���');


--5."student"�e�[�u���փf�[�^�o�^
insert into student values (1,'�R�c',1,'�{��',1),(2,'�c��',1,'����',2),(3,'����',1,'����',3),
(4,'���',2,'������',1),(5,'����',2,'�k�C��',2),(6,'�g�c',2,'����',1),(7,'�ɓ�',3,'������',2),
(8,'�R�{',3,'�_�ސ�',3),(9,'�X�{',4,'����',4),(10,'�g��',4,'�_�ސ�',5);


--6.student�e�[�u������-����1
select * from student where grade=1;


--7.student�e�[�u������-����2
select * from student where hometown='����';


--8.major�e�[�u������
select major_name from major;


--9.student�e�[�u���̃��R�[�h�X�V
update student set grade=3 where student_id=10;


--10.student�e�[�u���̃��R�[�h�폜
delete from student where student_id=10;
