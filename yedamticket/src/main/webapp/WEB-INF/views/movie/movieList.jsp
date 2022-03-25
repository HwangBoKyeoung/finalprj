<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<h1>박스오피스 순위</h1>
	
</body>
<script>


/*
let col4=document.createElement('div');
col4.classList.add('col-4');
console.log(col4);

let card=document.createElement('div');
card.classList.add('card');
card.classList.add('shadow-sm');
console.log(card);

let img=document.createElement('img');
console.log(img);


let cardBody=document.createElement('div');
cardBody.classList.add('card-body');
console.log(cardBody);

let cardText=document.createElement('p');
cardText.classList.add('card-text');
console.log(cardText);

let dFlex=document.createElement('div');
dFlex.classList.add('d-flex','justify-content-between','align-items-center');
console.log(dFlex);

let btnGroup=document.createElement('div');
btnGroup.classList.add('btn-group');
console.log(btnGroup);

let viewBtn=document.createElement('button');
viewBtn.classList.add('btn','btn-danger');
viewBtn.innerText='상세보기';
console.log(viewBtn);

let buyBtn=document.createElement('button');
buyBtn.classList.add('btn','btn-danger');
buyBtn.innerText='예매하기';
console.log(buyBtn);

dFlex.appendChild(btnGroup);
btnGroup.appendChild(viewBtn);
btnGroup.appendChild(buyBtn);
*/


(function() {
    let date=new Date();
    let year=date.getFullYear();
    let day=date.getDate()-4;
     var month = date.getMonth() + 1;
     if(month < 10 ) {
         month='0'+ month
     } else{
         month='' + month
     }; 
    let now=String(year)+String(month)+String(day);
    let url =
        "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=" +
        now;
    fetch(url)
        .then(response => response.json())
        .then(response => {
            console.log(response);
            let list = response.boxOfficeResult
                .dailyBoxOfficeList;
            for (i = 0; i < list.length; i++) {
            	  let newDiv = document.createElement('div');
                  let newDiv1= document.createElement('div');
                  let moveNameList=document.createElement('span');
                  let movieCd=document.createElement('span');
                  moveNameList.innerText=list[i].movieNm;
                  movieCd.innerText=list[i].movieCd;
                  newDiv1.append(moveNameList,movieCd);
                  newDiv.append(newDiv1);
                  result.append(newDiv);
            }
        });
     }());        
</script>

</html>