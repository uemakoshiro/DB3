--DDL

CREATE DATABASE db_ex3;

CREATE TABLE publisher(
�o�Ŏ�ID INT PRIMARY KEY,
�o�ŎЖ� VARCHAR(50));

CREATE TABLE author(
����ID INT PRIMARY KEY,
���Җ� VARCHAR(50));

CREATE TABLE books(
����ID INT PRIMARY KEY,
���Ж� VARCHAR(50),
�o�Ŏ�ID INT REFERENCES publisher(�o�Ŏ�ID) ,
�艿 DECIMAL,
���s�N���� date,
����ID INT REFERENCES author(����ID));
