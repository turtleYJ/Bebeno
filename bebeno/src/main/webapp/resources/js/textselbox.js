
// input태그 기타 텍스트 값 입력받기 
$(function(){

$("#directBox").hide();

$("#selbox").change(function() {

    if($("#selbox").val() == "1") {

        $("#directBox").show();

    }  else {
    $("#directBox").hide();
    }

    }) 
});

$(function(){

$("#directBox1").hide();

$("#selbox1").change(function() {

    if($("#selbox1").val() == "1") {

        $("#directBox1").show();

    }  else {
    $("#directBox1").hide();
    }

    }) 
});
$(function(){

$("#directBox2").hide();

$("#selbox2").change(function() {

    if($("#selbox2").val() == "1") {

        $("#directBox2").show();

    }  else {
    $("#directBox2").hide();
    }

    }) 
});

// textarea 값 받기 
val = $("textarea#wineinfo").val();

// input 가격에 콤마적용, 숫자만 입력
//숫자만 사용할 수 있는 함수 
function inputNumberFormat(obj) {
 	obj.value = comma (uncomma(obj.value));
 }
 
 // 콤마를 붙이는 함수 
 function comma (str) {
 	str - String(str);
 	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

// 콤마를 떼는 함수
function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

// input 태그에 '원' 붙이는 함수 
$(document).on("focusout", "input:text[koreanCurrency]", function()	{
	$(this).val( $(this).val().replace(",","") );
	$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
	$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
	if($(this).val() != '' ) {
		$(this).val( $(this).val()+'원');
	}		
});

// 입력창에서 떼면 보여지게 해주는 함수  
$(document).on("focus", "input:text[koreanCurrency]", function()	{	
	$(this).val( $(this).val().replace("원", ""));
});





























