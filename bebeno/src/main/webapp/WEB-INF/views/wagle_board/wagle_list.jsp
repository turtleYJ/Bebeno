	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<jsp:include page="/WEB-INF/views/wagle_board/wagle_header.jsp" />
    
    <section class="wagle_contains">
            <div>
                <div class="wagle_item_box">
                    <!-- 출력 div -->
                    <div class="wagle_item">

                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/1.jpg" alt="">
                                </span>
                                <p><strong>닉네임ㄴ아머림넝리ㅓ마ㅣㄴ어리ㅏㄴ멍린ㅁ어리ㅏ</strong></p>
                                <p><strong>글제목 미리보기 테스트입니다 ㅁㄴ아ㅓ린아ㅓㄹ</strong></p>
                                <p>글내용 미리보기ㅁㄴ어ㅏ룀ㅈ덕미나어럊더갬ㅈ더ㅏㄱㅁ니ㅏㅇ러ㅣ나얾ㅇㄴ미ㅏ럼ㄴㅇㄹㅁㄴㅇㄹ</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/3.jpg" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기ㅑㅐㅈ뎌개ㅑㅂㄷ개ㅑㅓㅈ배겆ㄱ</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/2.jpg" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/3.jpg" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/4.jpeg" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/5.png" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/2.jpg" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/5.png" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기</p>
                            </a>
                        </div>
                    </div>
                    <div class="wagle_item">
                        <div class="wagle_item_contents">
                            <a href="a">
                                <span>
                                    <img class="wagle_thumb_img" src="./img/1.jpg" alt="">
                                </span>
                                <p><strong>닉네임</strong></p>
                                <strong>글제목</strong>
                                <p>글내용 미리보기</p>
                            </a>
                        </div>
                        <ul>
                            <li>
                                <a href="a">
                                    <span>
                                        <img class="wagle_thumb_img" src="${ path }/resources/image/flower1.PNG" alt="">
                                    </span>
                                    <p><strong>닉네임</strong></p>
                                    <strong>글제목</strong>
                                    <p>글내용 미리보기</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
        </div>
    </section>
    <footer></footer>    
    <script>
        var elem = document.querySelector('.wagle_contains');
        var msnry = new Masonry( elem, {
        itemSelector: '.wagle_item',
        gutter: 10
        });
    
    function getPenPath() {
        const pageList = [
            'page1',
            'page2',
            'page3'
        ];
    
        let page = pageList[ this.loadCount ];
        if (page) return `/masonry/${page}.html`;
        }
    
        let infScroll = new InfiniteScroll( '.wagle_contains', {
        path: getPenPath,
        append: '.wagle_item',
        outlayer: msnry
        });
    </script>
    
</body>
</html>
