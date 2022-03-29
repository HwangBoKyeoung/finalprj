<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/users/css/movieList.css">
<style>
#result {
  position: relative;
  
}
.image {
  display: block;
  width: 100%;
  height: auto;
}
figure > img{
  display: block;
  width: 100%;
  height: auto;	
}
.caption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: rgba(0,0,0,0.7);
}
.text {
  color: white;
  font-size: 20px;
  top: 50%;
  left: 50%;
  position: relative;
  transform: translate(-50%, -50%);
  text-align: center;
}
#result> .card:hover .caption {
  opacity: 1;
}
</style>
</head>
<body>
	<h1>박스오피스 순위</h1>
	<div id="result">
	</div>
	<h1>상영 예정작</h1>
    <div id="wrapper">
    </div>
</body>
<script>
//박스오피스
(function() {
    let date=new Date();
    let year=date.getFullYear();
    let day=date.getDate()-8;
     var month = date.getMonth() + 1;
     if(month < 10 ) {
         month='0'+ month
     } else{
         month='' + month
     }; 
    let now=String(year)+String(month)+String(day);
    let url =
    'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt='+now;
    fetch(url)
        .then(response => response.json())
        .then(response => {
            console.log(response);
            let list = response.boxOfficeResult
                .weeklyBoxOfficeList;
            for (i = 0; i < list.length; i++) {
            	
            	//card
                let card=document.createElement('div');
                card.classList.add('card');
              	//header
                let header=document.createElement('header');
                let h5=document.createElement('h5');
                h5.innerText=list[i].movieNm;
             
                header.appendChild(h5);

             	//figure
                let figure=document.createElement('figure');
                let img=document.createElement('img');
                img.src="resources/users/img/poster1.png";
                figure.appendChild(img);

                //p1
                let p1=document.createElement('p');
                let audiCnt=document.createElement('span');
                audiCnt.innerText='관객수: '+list[i].audiCnt;
                p1.appendChild(audiCnt); 
              	//p2
                let p2=document.createElement('p');
                let salesShare=document.createElement('span');
                salesShare.innerText='예매율: '+list[i].salesShare;
                p2.appendChild(salesShare); 
               
                
                //caption
                let caption=document.createElement('div');
                caption.classList.add('caption');
                let openDt=document.createElement('p');
                openDt.classList.add('text');
                openDt.innerText='개봉일자: '+list[i].openDt;
                let audiAcc=document.createElement('p');
                audiAcc.classList.add('text');
                audiAcc.innerText='누적 관객수: '+list[i].audiAcc+'명';
              //form
                let form=document.createElement('form');
                    form.action='movieDetail.do';
                    form.method='post';
                    let inputNm=document.createElement('input');
                    inputNm.type='hidden';
                    inputNm.name='name';
                    inputNm.value=list[i].movieNm;
                    console.log(list[i].movieNm);
                    let inputMvNo=document.createElement('input');
                    inputMvNo.type='hidden';
                    inputMvNo.name='mvNo';
                    inputMvNo.value=212;
                    let inputDt=document.createElement('input');
                    inputDt.type='hidden';
                    inputDt.name='startDate';
                    let splitDay=(list[i].openDt).split('-');
                    let splitDate='';
                    for (var j=0;j<splitDay.length;j++){
                        splitDate+=splitDay[j];
                    }
                    console.log(splitDate);
                    inputDt.value=splitDate;
                    
                    form.append(inputNm,inputDt,inputMvNo);
                //caption > detailBtn
                let detailBtn=document.createElement('button');
                detailBtn.innerText="상세보기";
                detailBtn.type="submit";
                detailBtn.classList.add('text');
                detailBtn.classList.add('btn');
                detailBtn.classList.add('btn-warning');
               	form.append(detailBtn);
                //caption > bookingBtn
                let bookingBtn=document.createElement('button');
                bookingBtn.innerText="예매하기";
                bookingBtn.type="button";
                bookingBtn.classList.add('text');
                bookingBtn.classList.add('btn');
                bookingBtn.classList.add('btn-success');
                let br=document.createElement('br');
                bookingBtn.onclick=(function(){
                	
                	location.href='movieBooking.do';
                })
                caption.append(openDt,audiAcc,form,br,bookingBtn);
                card.append(header,figure,p1,p2,caption);
               
                result.append(card);
            }
        });
     }()); 
// 상영예정작
(function (){
		 //현재 날짜 yyyymmdd
    	 let date=new Date();
         let year=date.getFullYear();
         let day=date.getDate();
         var month = date.getMonth() + 1;
         if(month < 10 ) {
             month='0'+ month
         } else{
             month='' + month
         }; 
         let now=String(year)+String(month)+String(day);
         
         //14일 더한 날짜 yyyymmdd
         let weeks=new Date(date.setDate(date.getDate()+15));
         let y=weeks.getFullYear();
         let m=weeks.getMonth()+1;
         let d=weeks.getDate();
         if(m < 10 ) {
             m='0'+ m
         } else{
             m='' + m
         }; 
         let future=String(y)+String(m)+String(d);
         
         let url='http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=U8ECM752YKB763PI62AV&releaseDts='+now+'&releaseDte='+future+'&listCount=30';
    fetch(url)
    .then(response => response.json())
    .then(response =>{
       
        let list=response.Data[0].Result;
        console.log(list);
        let wrapper=document.getElementById('wrapper');
        for(var i=0;i<list.length;i++){

        //card
        let card=document.createElement('div');
        card.classList.add('card');
        //header
        let header=document.createElement('header');
        let h3=document.createElement('h3');
        h3.innerText=list[i].title;
        header.appendChild(h3);
        //figure
        let figure=document.createElement('figure');
        let img=document.createElement('img');
    
        let a=list[i].posters;
        if(a==''){
        img.src="resources/users/img/poster2.png";
        }else{
        let posterImg=a.split('|');
        img.src=posterImg[0];
        }
        
        
        figure.appendChild(img);
        //p1
        let p1=document.createElement('p');
        let director=document.createElement('span');
        director.innerText='감독: '+list[i].directors.director[0].directorNm+'   ';
        let actors=document.createElement('span');
        actors.innerText='배우: '+list[i].actors.actor[0].actorNm;;
        p1.append(director,actors);
        //p2
        let p2=document.createElement('p');
        let genre=document.createElement('span');
        genre.innerText='장르: '+list[i].genre+' ';
        let basic=document.createElement('span');
        basic.innerText='연령: '+list[i].rating+' 상영시간: '+list[i].runtime+'분';
        p2.append(genre,basic);
        //p3
        let p3=document.createElement('p');
        let repRlsDate=document.createElement('span');
        repRlsDate.innerText='개봉예정일: '+list[i].repRlsDate;
        p3.append(repRlsDate);
        
        card.append(header,figure,p1,p2,p3);
        wrapper.append(card);
        }
       

    });
})();

</script>

</html>