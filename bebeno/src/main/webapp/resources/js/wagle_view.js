$('.slick').slick({
    dots: true, //페이지 네비게이션 
    arrows:true, // next, prev 이동 버튼
    autoplay:ture, // 자동 넘김 여부 
    infinite: false, //반복설정 
    speed: 300, //슬라이드 속도 
    autoplaySpeed : 10000, // 자동 넘김시 슬라이드 시간 
    pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤 
    vertical : false, // 세로 방향 슬라이드 옵션 
    prevArrow : "<button type='button' class='slick-prev'>Previous</button>", 
    nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀 
    slidesToShow: 1, //보여질 슬라이드 수 
    slidesToScroll: 10, //넘겨질 슬라이드 수 
    responsive: [ // -> 반응형 옵션 
        {
        breakpoint: 1024, // 반응형 ~ 1024 
        settings: { 
            slidesToShow: 1, 
            slidesToScroll: 1, 
            infinite: true, 
            dots: true 
        } 
    }, 
    { 
        breakpoint: 600,// 반응형 ~ 600 
        settings: { 
            slidesToShow: 1, 
            slidesToScroll: 1 
        } 
    }, 
    { 
        breakpoint: 480,// 반응형 ~ 480 
        settings: { 
            slidesToShow: 1, 
            slidesToScroll: 1 
        } }
    ] 
});