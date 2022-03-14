
-- WEB 계정 생성
CREATE USER BEBENO IDENTIFIED BY BEBENO;
GRANT RESOURCE, CONNECT TO BEBENO;

--DROP TABLE MEMBER;
--DROP TABLE BBN_STORE;
--DROP SEQUENCE SEQ_UNO;
--DROP SEQUENCE SEQ_STORE_NO;

------------------------------------------------
-------------- BBN_STORE 관련 테이블 ------------
------------------------------------------------

CREATE TABLE BBN_STORE (
    STORE_NO NUMBER PRIMARY KEY,
    STORE_WRITERNO NUMBER,
    STORE_KORNAME VARCHAR2(100),
    STORE_ENGNAME VARCHAR2(100),
    STORE_ADDRESS VARCHAR2(100),
    STORE_PHONE VARCHAR2(20),
    STORE_TIME VARCHAR2(100),
    STORE_TYPE VARCHAR2(20) CHECK(STORE_TYPE IN('와인샵', '레스토랑')),
    STORE_IMGURL VARCHAR2(100),
    STORE_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STORE_STATUS IN('Y', 'N')),
    STORE_CONTENT VARCHAR2(2000), 
	ORIGINAL_FILENAME VARCHAR2(100), 
	RENAMED_FILENAME VARCHAR2(100), 
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN BBN_STORE.STORE_NO IS '상점고유번호';
COMMENT ON COLUMN BBN_STORE.STORE_WRITERNO IS '작성자고유번호';
COMMENT ON COLUMN BBN_STORE.STORE_KORNAME IS '한글상호';
COMMENT ON COLUMN BBN_STORE.STORE_ENGNAME IS '영문상호';
COMMENT ON COLUMN BBN_STORE.STORE_ADDRESS IS '주소';
COMMENT ON COLUMN BBN_STORE.STORE_PHONE IS '연락처';
COMMENT ON COLUMN BBN_STORE.STORE_TIME IS '운영시간';
COMMENT ON COLUMN BBN_STORE.STORE_TYPE IS '업종';
COMMENT ON COLUMN BBN_STORE.STORE_IMGURL IS '이미지주소';
COMMENT ON COLUMN BBN_STORE.STORE_STATUS IS '상태값';
COMMENT ON COLUMN BBN_STORE.STORE_CONTENT IS '내용';
COMMENT ON COLUMN BBN_STORE.ORIGINAL_FILENAME IS '첨부파일원래이름';
COMMENT ON COLUMN BBN_STORE.RENAMED_FILENAME IS '첨부파일변경이름';
COMMENT ON COLUMN BBN_STORE.ENROLL_DATE IS '등록일';
COMMENT ON COLUMN BBN_STORE.MODIFY_DATE IS '수정일';

CREATE SEQUENCE SEQ_STORE_NO;

INSERT INTO BBN_STORE VALUES(SEQ_STORE_NO.NEXTVAL, 1, '바틀샵 송도캠퍼스타운점', '', '인천 연수구 송도과학로27번길 55 301동 B-124호',  '032-812-8003', '11:00 - 23:00', '와인샵', 'https://ifh.cc/g/sOXBoB.jpg', 'Y', '', '', '',SYSDATE, SYSDATE);
INSERT INTO BBN_STORE VALUES(SEQ_STORE_NO.NEXTVAL, 1, '비스트로네모', '', '인천 연수구 송도과학로27번길 55 c동 118호',  '0507-1394-3123', '17:00 - 00:00', '레스토랑', 'https://ifh.cc/g/p743aO.jpg', 'Y', '', '', '', SYSDATE, SYSDATE);

------------------------------------------------
--------------- MEMBER 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE MEMBER (
    NO NUMBER PRIMARY KEY,
    ID VARCHAR2(30) NOT NULL UNIQUE,
    NICKNAME VARCHAR2(30) NOT NULL,
    PASSWORD VARCHAR2(100) NOT NULL,
    ROLE VARCHAR2(20) DEFAULT 'ROLE_USER',
    NAME VARCHAR2(15) NOT NULL,
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(100),
    ADDRESS VARCHAR2(100),
    BIRTH VARCHAR2(20) NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN MEMBER.NO IS '회원번호';
COMMENT ON COLUMN MEMBER.ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.NICKNAME IS '회원닉네임';
COMMENT ON COLUMN MEMBER.PASSWORD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.ROLE IS '회원타입';
COMMENT ON COLUMN MEMBER.NAME IS '회원명';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.BIRTH IS '생일';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';

CREATE SEQUENCE SEQ_UNO;

INSERT INTO MEMBER (
    NO, 
    ID, 
    NICKNAME,
    PASSWORD, 
    ROLE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    BIRTH, 
    STATUS, 
    ENROLL_DATE, 
    MODIFY_DATE
) VALUES(
    SEQ_UNO.NEXTVAL, 
    'admin2',
    '닉네임',
    '1234', 
    'ROLE_USER', 
    '수민서', 
    '010-1234-5742', 
    'admin@iei.or.kr', 
    '서울시 강남구 역삼동',
    '1999-04-28',
    DEFAULT,
    DEFAULT,
    DEFAULT
);

-- 멤버 조회
-- SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'

-- 멤버 추가
-- INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)

-- 멤버 수정               
-- UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,HOBBY=?,MODIFY_DATE=SYSDATE WHERE NO=?

-- 멤버 패스워드 변경
-- UPDATE MEMBER SET PASSWORD=? WHERE NO=?

-- 멤버 삭제
-- UPDATE MEMBER SET STATUS=? WHERE NO=?

------------------------------------------------
--------- BEBENO_WINEBOARD 관련 테이블 ----------
------------------------------------------------

CREATE TABLE BEBENO_WINEBOARD (	
    WINE_BNO NUMBER PRIMARY KEY,
    WINE_CODE NUMBER,
	WINE_NAME VARCHAR2(100), 
    WINE_ENG VARCHAR2(100),
	WINE_TYPE VARCHAR2(50), 
    WINE_MF VARCHAR2(50),
    WINE_NATIONAL VARCHAR2(50),
    WINE_PRICE VARCHAR2(10),
	ORIGINAL_FILENAME VARCHAR2(100), 
	RENAMED_FILENAME VARCHAR2(100), 
    WINE_SL VARCHAR2(10),
    WINE_AC VARCHAR2(10),
    WINE_BODY VARCHAR2(10),
    WINE_TN VARCHAR2(10),
    WINE_INFO VARCHAR2(500),
	READCOUNT NUMBER DEFAULT 0, 
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    CREATE_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE 
);

-- WINEBOARD 테이블 COMMENT 추가
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_BNO IS '게시물번호';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_CODE IS '와인코드';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_NAME IS '와인명';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_ENG IS '영문명';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_TYPE IS '종류';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_MF IS '제조국';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_NATIONAL IS '지역';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_PRICE IS '가격';
COMMENT ON COLUMN BEBENO_WINEBOARD.ORIGINAL_FILENAME IS '첨부파일원래이름';
COMMENT ON COLUMN BEBENO_WINEBOARD.RENAMED_FILENAME IS '첨부파일변경이름';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_SL IS '당도';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_AC IS '산도';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_BODY IS '바디';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_TN IS '타닌';
COMMENT ON COLUMN BEBENO_WINEBOARD.WINE_INFO IS '상세정보';
COMMENT ON COLUMN BEBENO_WINEBOARD.READCOUNT IS '조회수';
COMMENT ON COLUMN BEBENO_WINEBOARD.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN BEBENO_WINEBOARD.CREATE_DATE IS '게시글올린날짜';
COMMENT ON COLUMN BEBENO_WINEBOARD.MODIFY_DATE IS '게시글수정날짜';

CREATE SEQUENCE SEQ_WINE_NO;

insert into bebeno_wineboard values(seq_wine_no.nextval,01,'지로 리보 Giro Ribot,Giro Ribot', 'Cava Ab Origine Brut Reserva','스파클링','스페인','페네데스','59000원','1','1','1','1','1','1','1',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,11,'K1 츠무킨', 'K1 Tzimmukin','레드','호주','1','450,000원','20220124155143_73943.png','20220124155143_73943.png','1','3','4','3','강렬하면서 진한 블랙 체리 , 자두 , 유칼립트 , 블랙 올리브의 아로마와 함께 정향나무와 계피 향신료의 아로마가 어우러져 허기를 자극하는 향이 피어 오르며 입 안에서는 잘익은 블랙커런트의 아로마가 가득 채워진 맛에 강렬하면서도 풍부하지만 밸런스가 느껴지는 탄닌으로 긴 여운을 느낄 수 있는 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,12,'로네아,쟈 딜랑쥬 레드', 'Rhonea, Jas Dellange Rouge','레드','프랑스','론','25000원','W0170711.png','W0170711.png','1','3','4','4','타임, 가시덤블의 미묘한 향과 함께 코를 자극 하는 레드 베리 류의 향이 피어 오르며 입 안에서는 섬세하고 우아하며 신선한 과일의 풍미가 있는 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,13,'펠렛 에스테이트, 더블 플러스 카베르네 소비뇽', 'Pellet Estate, Double Plus Cabernet Sauvignon','레드','미국','나파 벨리','300,000원','W0170703.png','W0170703.png','1','3','4','4','깔끔한 미네랄, 바닐라, 은은한 체리, 베리, 블랙 올리브, 향신료가 조화로운 아로마가 피어 오르며 입 안에서는 블랙 커런트, 카시스, 초코릿의 부드러운 풍미가 긴 여운으로 이어지는 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,14,'도멘 마샹 프레르, 샹볼 뮈지니 프리미에 크뤼 레 성띠에', 'Domaine Marchand Freres, Chambolle-Musigny 1er Cru Les Sentiers','레드','프랑스','샹볼-뮈지니','290,000원','W0162049.png','W0162049.png','1','4','3','2','가장 훌륭한 포도밭의 매력을 충분히 느껴볼 수 있는 와인이다. 프렌치 오크 배럴에서 13개월간 숙성되었다. 국내 소량 할당으로 한정 수량 공급 가능하며, 빈티지 대비 약 10년 후 음용을 추천한다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,15,'바틱, 까베르네 프랑', 'Batic, Cabernet Franc','레드','슬로베니아','비파바','190,000원','W0162246.png','W0162246.png','1','4','4','2','카베르네 프랑(Cabernet Franc)은 카베르네 소비뇽의 어버이 품종이다. 카베르네 프랑은 입맛을 당기는 라즈베리, 블랜커런트 잎 등의 향을 내며, 카베르네 소비뇽 보다 가볍고 부드럽다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,16,'보데가 세론, 엘 티엠포 큐', 'Bodega Cerron, El Tiempo que nos une','레드','스페인','후미야','80,000원','W0161876.png','W0161876.png','1','3','4','3','6개월 스테인리스 탱크 숙성한다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,17,'도멘 미쉘 그로, 본 로마네 프르미에 크뤼 끌로 드 레아 모노폴', 'Domaine Michel Gros, Vosne Romanee 1er Cru Clos des Reas Monopole','레드','프랑스','본라마네','850,000원','W0144747.png','W0144747.png','1','3','3','4','명실공히 미쉘 그로의 대표 와인 끌로 데 레아는, 라즈베리와 제비꽃향 그리고 매혹적인 과일향이 나는 와인이다. 미디엄 바디에 우아하고 농축됐지만, 상쾌하게 톡쏘는 새콤함이 있으며 맑은 생동감이 절제된 듯 지속적으로 느껴진다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,21,'가트, 리슬링', 'Gatt, Riesling','화이트','호주','에덴 벨리','110,000원','W0154539.png','W0154539.png','2','4','3','1','와인은 산미가 매우 높으며, 드라이한 와인, 오프-드라이한 와인, 달콤한 와인 그리고 스파클링 와인으로 만들어진다. 리슬링은 소비뇽 블랑, 샤르도네와 더불어 3대 화이트 품종에 속한다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,22,'까브 드 루그니, 마콩 루그니 유진 블랑 샤르도네', 'Cave de Lugny, Macon Lugny Eugene Blanc Chardonnay','화이트','프랑스','마꽁','75,000원','W0162240.png','W0162240.png','1','4','3','1','프리울리의 화이트 와인 스타일은 품종의 특성을 명확하게 표현하는 섬세한 향이 있으며 숙성시키지 않고 과일향이 있는 상태를 선호한다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,23,'깐티네 포베로, 모스카토 다스티 캄포 델 팔리오', 'Cantine Povero, Moscato d Asti Campo del Palio','화이트','이탈리아','아스티','34,000원','W0161906.png','W0161906.png','4','2','2','1','진한 황금 빛의 컬러를 띄며 섬세하고 오래 지속되는 기포가 인상적인 와인이다. 달콤하면서도 신선한 과실의 맛이 오랜 여운으로 남는다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,24,'비네롱 카탈랑스, 포시즌 샤도네이', 'Vignerons Catalans, Quatre Saisons Chardonnay','화이트','프랑스','랑그독 루씨용','53,000원','W0170648.png','W0170648.png','1','3','1','1','연한 레몬색을 띠며 배, 사과, 감귤류의 미세하고 섬세한 향을 드러낸다. 입 안에서는 균형이 잘 잡혀있고 신선하고 상큼한 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,25,'레드헤즈 스튜디오, 문라이터스 화이트 블렌드', 'Redheads Studio, Moonlighters White Blend','화이트','호주','사우스 오스트레일리아','68,000원','W0170614.png','W0170614.png','1','3','1','1','stone fruit의 과실향과 복숭아향이 가득하며 입 안에서는 살구 과즙과 은은한 견과류의 균형잡힌 산도가 일품인 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,26,'아르노 엉뜨, 뫼르소 끌로 데 장브르', 'Arnaud Ente, Meursault Clos des Ambres','화이트','프랑스','뫼르소','990,000원','0163025.png','0163025.png','1','4','3','1','2014년 뫼르소 끌로 데 장브르는 기존 뫼르쏘 Village에서 드러나는 사과, 시트러스, 플라워 노트에 더하여 Green pear와 부서진 암석(특히 백악)의 풍미를 느낄 수 있다. 끌로 데 장브르는 1952년-1953년에 심어진 올드 바인의 포도를 사용하는데 En lOrmeau 빈야드에서도 특히나 돌이 많고 지하수면이 더 낮은 곳에 위치한 부분에서 자란다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,27,'슐로스 폴라즈, 에디션', 'Schloss Vollrads, Edition','화이트','독일','라인가우','70,000원','W0150407.png','W0150407.png','2','5','3','1','산뜻한 옐로우 컬러의 리즐링 와인으로 녹색 사과, 복숭아, 그리고 살구향의 복합적인 아로마와 미네랄 터치가 조화를 이룬다. 드라이 와인이지만 적절한 산도(7.6g/L)와 약간의 잔당(13.1g/L)으로 리슬링 특유의 아로마와 스위트 함으로 누구에게나 사랑받는 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,31,'베리 브라더스 & 러드, 프로세코', 'Berry Bros. & Rudd, Prosecco','스파클링','이탈리아','베네토','18,900원','W0166378.png','W0166378.png','2','5','3','1','초록 사과 향과 약간의 흰 꽃향을 느낄 수 있으며, 신선한 산미가 더해져 긴 피니시를 남기는 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,32,'벨라비스타, 사텐', 'Bellavista, Saten','스파클링','이탈리아','롬바르디아','216,000원','W0148234.png','W0148234.png','1','4','3','1','입에서 크리미한 질감과 향기로운 과일향. 절제된 산미, 미네랄 등 모든 요소가 균형있게 되어 있다. 온유하면서도 심지있는 세련된 맛으로 마무리한다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,33,'빌라 산디, 프로세코 뀌베 오리스', 'Villa Sandi, Prosecco Cuvee Oris','스파클링','이탈리아','베네토','35,000원','W0147354.png','W0147354.png','1','3','3','1','엷게 지속적으로 페를라주(Perlage)를 형성하는 밝고 투명한 밀짚 색을 띠는 와인이다. 농익은 노란 사과, 바나나, 멜론, 아카시아의 아로마를 선사한다. 꽃 향이 풍부하다. 상쾌함이 입안을 가득 채우고 오래 지속된다. 피니쉬가 프루티하다. 식전주로 훌륭하다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,34,'산테로 모스카토 스푸만테', 'Santero Moscato Spumante','스파클링','이탈리아','피에몬테','25,000원','W0150991.png','W0150991.png','4','2','2','1','피에몬테의 스파클링와인 전문 생산회사 산테로가 샤르맛 방식으로 만든 스파클링 와인.딸기, 복숭아 등의 다양한 과일 및 케이크등의 디저트와 잘 어울리고 과일의 미와 신선하면서도 우아한 감미를 갖춘 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,35,'아바찌아, 돌체볼로 레드', 'Abbazia, DOLCE VOLO RED','스파클링','이탈리아','뿔리아','24,000원','W0153805_002.png','W0153805_002.png','5','3','3','1','영롱한 루비 칼라, 라즈베리의 맛향과 머스크향, 풍성한 열대과일의 맛향이 조화롭고 매혹적인 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,36,'파이니스트 빈티지 그랑 크뤼 샴페인', 'Finest Vintage Grand Cru Champagne','스파클링','이탈리아','샹빠뉴','99,000원','W0155553.png','W0155553.png','1','4','4','1','샤도네이 100%로 만든 블랑 드 블랑 샴페인으로 사랑스러운 토스트 향과 시트러스 풍미가 돋보이는 최고의 아페리티프 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,37,'판티니 그랑 뀌베 비앙코 스와로브스키', 'Fantini Gran Cuvee Bianco Swarovski','스파클링','이탈리아','아브루쪼','75,000원','W0159687.png','W0159687.png','1','3','2','1','빛나는 밀짚 옐로우를 띠며 감귤류 향이 살짝 감돌며, 과실 향과 꽃 향기기 복합적인 우아하고, 긴 여운이 지속되며 미네랄 풍미와 신선함의 밸런스가 훌륭한 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,41,'모란데, 피오네로 로제', 'Morande, Pionero Rose','로제','칠레','센트럴 밸리','25,000원','W0153980.png','W0153980.png','2','3','3','1','딸기, 블랙 베리의 향이 신선하게 다가오며 달콤한 맛이 적절한 산도와 상쾌한 과일 느낌과 함께 잘 어우러지는 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,42,'이모스, 로제', 'Emos, Rose','로제','미국','테메큘라 밸리','195,000원','W0168650.png','W0168650.png','2','3','2','1','복숭아, 자두, 야생 베리류의 기분 좋은 향이 달콤한 꽃향기와 은은하게 조화를 이루며 생동감을 더한다. 우아한 질감에 부드러운 산미가 입안 가득 퍼지며, 산딸기, 체리 등 다채로운 과일의 풍미가 입 안에서 오래도록 머무는 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,43,'핀카 바카라, 로제', 'Finca Bacara, Rose','로제','스페인','후미야','40,000원','W0168796.png','W0168796.png','1','3','2','1','우아하고 생동감 있는 연한 핑크빛을 띠고 체리, 산딸기, 라즈베리, 블랙베리의 아로마가 느껴진다. 입 안에서는 달콤한 산딸기, 라즈베리와 어우러지는 과일 향과 함께 신선한 산미로 피니시가 이어지는 로제 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,44,'덕혼, 디코이 로제', 'Duckrhon, Decoy Rose','로제','미국','나파 밸리','75,000원','W0162677.png','W0162677.png','1','3','2','1','1989년 첫 빈티지를 출시한 이래 디코이(Decoy)는 뛰어난 품질과 합리적인 가격으로 많은 사랑을 받아 왔다. 지역적 특징을 잘 드러내는 풍부한 과일향으로 어린 빈티지의 와인을 마셔도 즐거운 느낌이 나는 특징을 가진 와인이다. ',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,45,'도멘 몽로즈', 'Domaine Montrose','로제','프랑스','페즈나스','18,000원','W0153018.png','W0153018.png','1','3','2','1','옅은 연어 또는 핑크 색을 띠며 체리, 딸기, 멜론, 복숭아 그리고 약간의 스파이스의 향을 느낄 수 있다. 신선함과 둥글둥글함이 조화로운 우아한 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,46,'라 피우 벨 로제', 'La Piu Belle Rose','로제','칠레','미야후밸리','58,000원','W0168578.png','W0168578.png','1','3','1','1','잘 익은 레드 베리와 살구, 패션 프루츠 시트러스 등의 상큼한 과실향과 함께 라벤더와 바이올렛 등의 아로마가 더해진다. 입 안에서는 풍성한 꽃향기와 둥글고 우아한 타닌감이 균형감 있으면서 드라이한 피니쉬를 보여주는 로제 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,51,'글로리아 토니 포트 와인', 'Gloria Tawny Porto','주정강화','포르투갈','도우루','49,000원','W0168523.png','W0168523.png','4','2','4','3','오크, 바닐라, 건포도의 달콤한 향이 느껴지고 입 안에서는 4년 이상 오크통 숙성으로 벨벳과 같이 부드러운 타닌과 맛, 적절한 산미와 함께 밸런스 좋은 포트 와인이다.',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

insert into bebeno_wineboard values(seq_wine_no.nextval,52,'블랜디스 알바다 5년', 'Blandys Alvada 5 Y.O Rich','주정강화','포르투갈','마데이라','85,000원','W0137925.png','W0137925.png','5','2','5','2','포트와인과는 달리 마데이라는 열처리 과정 (Canteiro)을 거쳐 열 화된 와인으로 캐러멜과 진한 견과류 향이 특징이며, 보관이 용이하고 장기간 방치하여도 맛과 향에는 큰 변화가 없는것이 특징이다. ',DEFAULT,DEFAULT,DEFAULT,DEFAULT);

COMMIT;               