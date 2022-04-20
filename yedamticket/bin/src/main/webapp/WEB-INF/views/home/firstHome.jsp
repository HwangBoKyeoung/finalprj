<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="https://fonts.googleapis.com/css?family=Titan+One">
<style>
	#bodtBtn{
		cursor: pointer;
		-webkit-font-smoothing: antialiased;
	}
	
	.wrapper {
		display: grid;
		place-items: center;
		min-height: 100vh;
		background: #301e4e;
	}

	.content {
		font-family: system-ui, serif;
		font-size: 2rem;
		padding: 3rem;
		border-radius: 1rem;
		background: #cec5e9;
	}
	
	p.typing-txt{
		display: none;
	}

	.typing {  
		/*position: absolute;*/ 
		text-align: center;
		display: inline-block; 
		animation-name: cursor; 
		animation-duration: 0.3s; 
		animation-iteration-count: infinite; 
		width: 100%;
		height: auto;
		line-height: 300%;
		color: purple;
		font-size: 300%;
		font-weight: bold;
		text-shadow: 0 1px 0 #CCC,
               0 2px 0 #CCC,
               0 3px 0 #CCC,
               0 4px 0 #CCC,
               0 5px 0 #CCC,
               0 6px 0 transparent,
               0 7px 0 transparent,
               0 8px 0 transparent,
               0 9px 0 transparent,
               0 10px 10px purple;
	} 
</style>
</head>
<body style="margin: 0px;" id="bodtBtn">
	<p class="typing-txt">티켓은 어디~? 예담티켓!!</p>
	<div class="wrapper">
		<p class="typing content"></p>
	</div>
	
	<script>
		var typingBool = false; 
		var typingIdx=0; 
	
		// 타이핑될 텍스트를 가져온다 
		var typingTxt = $(".typing-txt").text(); 
	
		typingTxt=typingTxt.split(""); // 한글자씩 자른다. 
	
		if(typingBool==false){ 
		  // 타이핑이 진행되지 않았다면 
		   typingBool=true;     
		   var tyInt = setInterval(typing,150); // 반복동작 
		} 
		     
		function typing(){ 
		  if(typingIdx<typingTxt.length){ 
		    // 타이핑될 텍스트 길이만큼 반복 
		    $(".typing").append(typingTxt[typingIdx]);
		    
		    if(typingIdx == 8){
		    	let br = $("<br>");
		    	$(".typing").append(br);
		    }
		    
		    // 한글자씩 이어준다. 
		    typingIdx++; 
		   } else{ 
		     //끝나면 반복종료 
		    clearInterval(tyInt); 
		   } 
		}  
		
		$("#bodtBtn").on("click", function(){
			location.href="home.do";
		});
	</script>
</body>
</html>