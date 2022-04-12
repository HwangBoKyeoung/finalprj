//박스오피스

/*(function() {

    //현재 날짜에서 8일 정도 빼기

  var dateOffset = (24*60*60*1000) * 8; //8 days

  var myDate = new Date();

  myDate.setTime(myDate.getTime() - dateOffset);

  var year=myDate.getFullYear();

  var month=myDate.getMonth()+1;

  var date=myDate.getDate();

  if(date < 10 ) {

    date='0'+ date

     } else{

      date='' + date

     }; 

     if(month < 10 ) {

         month='0'+ month

     } else{

         month='' + month

     }; 
    let now=String(year)+String(month)+String(date);
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
              //detail .form
               		let form=document.createElement('form');
                    form.action='movieDetail.do';
                    form.method='post';
                    let inputNm=document.createElement('input');
                    inputNm.type='hidden';
                    inputNm.name='name';
                    inputNm.value=list[i].movieNm;
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
				let form1=document.createElement("form");
				form1.action='movieBooking.do';
                form1.method='post';
				let inputNm1=document.createElement('input');
                inputNm1.type='hidden';
                inputNm1.name='name';
                inputNm1.value=list[i].movieNm;
                let inputMvNo1=document.createElement('input');
                inputMvNo1.type='hidden';
                inputMvNo1.name='mvNo';
                inputMvNo1.value=212;
                let inputDt1=document.createElement('input');
                inputDt1.type='hidden';
                inputDt1.name='startDate';
                let splitDay1=(list[i].openDt).split('-');
                let splitDate1='';
                for (var j=0;j<splitDay1.length;j++){
                        splitDate1+=splitDay1[j];
                    }
                    inputDt1.value=splitDate1;                 
                    form1.append(inputNm1,inputDt1,inputMvNo1);
                //caption > bookingBtn
                let bookingBtn=document.createElement('button');
                bookingBtn.innerText="예매하기";
               bookingBtn.type="submit";
                bookingBtn.classList.add('text');
                bookingBtn.classList.add('btn');
                bookingBtn.classList.add('btn-success');
				form1.append(bookingBtn);
                caption.append(openDt,audiAcc,form,form1);
                card.append(header,figure,p1,p2,caption);
                result.append(card);

            }

        });

     }()); */

// 상영예정작

