function loadJQuery() {
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";		  
    oScript.src = "http://code.jquery.com/jquery-3.5.1.min.js";	
    document.getElementsByTagName("head")[0].appendChild(oScript);
}

function email_change() {
	let em = document.getElementsByName("email")[0];
	let email = document.getElementsByName("email")[1];
	if (email.value == '0') {
		em.disabled = true;
	}
	if (email.value == '9') {
		em.disabled = false;
	} else {
		em.disabled = true;
	}
}

function btnFnc() {
	var all = "";
	var id = document.getElementsByName("id")[0].value;
	var mail = document.getElementsByName("email")[1].value;
	all = id + "@" + mail;

	var subject = "YD TICKET 회원가입 이메일 입니다.";
	document.getElementById('subject').value = subject;

	var content = "<div align='center' style='border: 1px solid black; width: 400px; height: 600px'>"
	content += "<p>안녕하세요 YD TICKET입니다.</p>";
	//content += "http://localhost/prj/signup_3.do?email=";
	content += "<p>회원가입을 계속 진행하시려면 아래 링크를 눌러주세요</p>"
	//content += all;
	content += "<a href='localhost/prj/signup_3.do'>회원가입 링크</a><br />";
	content += "<div>";
	content += "<img src='\cid:logo\' style='width: 30%; height: 30%' />";
	content += "</div>";
	content += "</div>"
	document.getElementById("content").value = content;
}
