/* SQL 시작하기

데이터베이스에서 데이터를 <정의, 조작, 제어>하기 위해 사용되는 명령어입니다.
SQL의 구성 요소로는 크게 DDL, DML, DCL로 나뉩니다.

데이터 정의어 (DDL) == 데이터 베이스를 <생성>하거나 테이블을 만드는 언어
데이터 조작어 (DML) == 데이터 베이스에 저장된 데이터를 <조회, 수정, 삭제> 하는 언어
데이터 제어어 (DCL) == 사용자의 권한을 설정하는 언어

테이블이란?
항상 이름을 가지고 있는 리스트로, 데이터가 저장되어있는 공간을 의미합니다.
테이블은 행(=ROW)과 열(=COULMN)로 이루어져 있으며, 대응하는 값인 FIELD로 구성됐다.

1. 검색 - SELECT
SELECT는 테이블에 저장된 데이터를 <검색>하는 명령어입니다.
SELECT는  검색 명령어이고, title, author는 검색할 컬럼, Book은 테이블을 의미합니다. */

# 책의 제목과 저자만 골라서 조회하는 쿼리를 작성해 주세요. 
SELECT title, author
FROM Book; 

# 전체를 검색할 때에는 *를 입력합니다. 
SELECT * (==전체 검색)
FROM Book;


/* 2. 조건 - WHERE
WHERE절은 검색하고자 하는 데이터의 조건을 설정할 수 있는 명령
테이블의 <특정 데이터>를 검색하려고 할 때, 사용되는 부분이다. */

# 책 정보를 저장하는 Book 테이블에서 제목이 `돈키호테`인 책을 검색해 주세요.
SELECT *
FROM Book
WHERE title = `돈키호테`;

# Joanne Kathleen Rowling 작가의 책만 골라서 조회하는 쿼리를 작성해 주세요.
SELECT *
FROM Book
WHERE author = `Joanne Kathleen Rowling`;

# score 테이블에서 국어 성적이 90 이상인 값을 검색해 주세요.
SELECT *
FROM score
WHERE korea >= 90;

/* 복합 조건 연산자
 AND, && == A 그리고 B를 모두 만족하는 값
OR, || == A 또는 B인 값
NOT, ! == A가 아닌 값 */

# score 테이블에서 국어 성적이 90 이상이거나 수학 성적이 80 초과인 값 검색해 주세요.
SELECT *
FROM score
WHERE korea>=90 OR math>80;

/* 기타 연산자
BETWEEN [A BETWEEN 10 AND 20] == A가 10과 20 사이에 포함된 값
IN [A IN B] == B에 A가 포함된 값
NOT IN [A NOT IN B] == B에 A가 포함되지 않은 값 */