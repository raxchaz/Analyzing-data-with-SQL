다양한 조건 = WHERE LIKE

LIKE는 특정 문자가 포함된 문자열을 찾고 싶을 때 사용하는 명령어
EX. 책 정보를 저장하는 book 테이블에서 제목이 `왕자`로 끝나는 책을 검색하고 싶을 때 사용

LIKE 조건의 기본 형태는 WHERE 조건절의 뒤에 들어가는 형태이다.
1.  %문자열 == 문자열로 끝나는 값 조회
2.  문자열% == 문자열로 시작하는 값 조회
3.  %문자열% == 문자열이 포함된 값 조회

SELECT *
FROM book
WHERE title LIKE '%왕자';
== book 테이블에서 제목이 `왕자`로 끝나는 책 검색

SELECT *
FROM book
WHERE title LIKE '어린%';
== book 테이블에서 제목이  `어린`으로 시작하는 책 검색

SELECT *
FROM book
WHERE title LIKE `%린왕%`;
== book 테이블에서 제목에 `린왕`이 포함되는 책 검색


----------------------------------------------------------------------------------------------

데이터 정렬 ORDER BY

ORDER BY 는 데이터를 정렬하여 검색하는 명령어
EX. 성적을 저장하는 score 테이블에서 수학 점수가 높은 순서대로 정렬하여 검색할 때 사용되는

DESC == 내림차순 (큰 값부터 정렬)
ASC == 오름차순 (작은 값부터 정렬)

SELECT * 
FROM score
ORDER BY math DESC;

SELECT *
FROM Book
ORDER BY title ASC;

----------------------------------------------------------------------------------------------

데이터 삽입 INSERT

INSERT는 테이블에 새로운 데이터를 삽입하는 명령어
EX. 책 정보를 저장하는 book 테이블에 새로운 책에 대한 데이터를 추가하는 경우

INSERT INTO book(id, title, author, publisher) (명령 / 테이블 / 컬럼 순)
VALUE('3', '햄릿', '윌리엄 셰익스피어', '앨리스 출판');

참고로, 컬럼의 자리에 컬럼을 명시하지 않으면, 순서대로 값을 삽입한다.

INSERT INTO book(id, title, author, publisher, date_received) VALUES (1000, 'Don Quixote', 'Miguel de Cervantes Saavedra', NULL, '2015-03-31');
INSERT INTO book(id, title, author, publisher, date_received) VALUES (1001, 'The Little Prince', 'Antoine de Saint-Exupery', NULL, '2018-12-21');
INSERT INTO book(id, title, author, publisher, date_received) VALUES (1002, 'Harry Potter and the Philosophers Stone', 'Joanne Kathleen Rowling', 'Bloomsbury Publishing', '2017-06-26');

SELECT * FROM book;

----------------------------------------------------------------------------------------------

데이터 수정 UPDATE

UPDATE는 데이터베이스에 저장된 값을 수정하는 명령어
EX. 책 정보를 저장하는 book 테이블에 제목이 '돈키호테'인 책을 '돈키호테 1'로 수정하는 경우

UPDATE book
SET title = '돈키호테 1'
WHERE title = '돈키호테';
== 책 제목이 돈키호테인 데이터의 제목을 돈키호테 1로 변경한다.

@ [문제]

도서관에는 대출과 반납 현황 역시 DB를 이용하여 관리합니다.
빌려갈 때, rental 테이블에 값을 추가하는데 이때 반납 시간은 null로 두었다가 반납할 때, 
반납 시간을 기록합니다. Elice 회원이 2019-04-05 12:00:30 에 책을 반납하였습니다.

이에 맞게 반납 시간을 null에서 올바른 시간으로 변경해 봅시다.
Elice 회원의 id는 1000번입니다.

UPDATE rental
SET rental = '2019-04-05 12:00:30'
WHERE id == '1000';

마지막 줄이 WHERE rental = 'null';이 아닌 이유는 1000번의 아이디를 가진 회원의 시간만 변경해야 하니까!
WHERE rental = 'null'로 작성하게 되면, 값이 없던 사용자들의 시간이 전부 2019-04-05 12:00:30 로 찍히게 될 것.


----------------------------------------------------------------------------------------------

데이터 삭제 DELETE

DELETE는 테이블에 있는 데이터를 삭제하는 명령어
EX. 책 정보를 저장하는 book 테이블에 제목이 '돈키호테 1'인 책을 삭제하는 경우

DELETE
FROM book
WHERE title = '돈키호테 1';
== 제목이 '돈키호테 1'인 책 데이터를 book 테이블에서 삭제한다.

* 참고로, WHERE 절의 조건이 없을 경우, 모든 데이터를 삭제하게 됩니다.
* 테이블 자체가 삭제되는 것이 아니라, 모든 행이 삭제된다!

[문제]

현재 도서관에서 잃어버린 책이 몇 권 있습니다.
하지만 아직 도서관 DB에 남아있어 이용자들에게 혼란을 주는 상황입니다.
여러분이 book 테이블에서 아래 책들을 지워봅시다.

1. Harry Potter and the Philosophers Stone
2. The Lord of the Rings

DELETE
FROM Book
WHERE title ='Harry Potter and the Philosophers Stone', 'The Lord of the Rings'

* 참고로 SQL에서 문자열 속에 어퍼스트로피를 넣으려면 \로 넣어야 합니다. (돈 표시!)
