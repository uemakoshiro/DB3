--演習4-DB演習問題



--1.インデックスの作成

--1--
CREATE INDEX m_name ON major(major_name);
--2--
CREATE INDEX s_name ON student(student_name);
--3--
CREATE INDEX m_index ON student(grade, student_name);
 


--2.ビューの作成
CREATE VIEW v_student AS
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student s
INNER JOIN major m
ON s.major_id = m.major_id
WHERE hometown != '東京'
ORDER BY major_name;



--3.マテリアルズド・ビュー
CREATE MATERIALIZED VIEW mv_student AS
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student s
INNER JOIN major m
ON s.major_id = m.major_id
WHERE hometown != '東京'
ORDER BY major_name;



--4.ファンクション

--ファンクション作成
CREATE OR REPLACE FUNCTION func(price decimal) RETURNS integer
 LANGUAGE plpgsql AS $function$
declare

begin
    return trunc(price * 1.1, 0);
end;
$function$;

--ファンクション実行
SELECT *,func(amount) AS カラム名なし
from sales;



--5.シーケンス
CREATE TABLE users(
id SERIAL PRIMARY KEY,
name VARCHAR(50));

--idが101から連番になるよう設定
SELECT SETVAL('users_id_seq', 101 , false);


