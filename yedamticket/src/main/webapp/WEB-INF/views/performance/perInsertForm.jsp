<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	*{
			list-style:none;
		}

.btn1{
    border-radius: 10px;
    background: #8867bf;
    font-size: 14px;
    margin-left: 4px;
    margin-top: 2px;
    padding: 8px;
}


</style>
</head>
<input type="hidden" name="PNo" id="PNo">
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<br>
				<h2 class="text-center">공연 등록</h2>
				<form id="frm" action="perInsert.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" id="CId" name="CId" value="${sessionId }">
					<table class="table">
						<tr>
							<td>기업명</td>
							<td><input type="text" id="" name="" value="${sessionName }"
								class="form-control" readonly="readonly"></td>
						</tr>
						<tr>
							<td>공연 이름</td>
							<td><input type="text" id="name" name="name"
								class="form-control" required="required"></td>
						</tr>
						<tr>
							<td>출연 배우</td>
							<td><input type="text" id="actor" name="actor"
								class="form-control" required="required"></td>
						</tr>
						<tr>

							<td>시작날짜</td>
							<td><input type="date" id="frdt" name="frDt"
								class="form-control" required="required"></td>

						</tr>
						<tr>

							<td>시작시간</td>
							<td><input type="time" id="time" name="time"
								class="form-control" required="required"></td>

						</tr>
						<tr>

							<td>종료날짜</td>
							<td><input type="date" id="trDt" name="trDt"
								class="form-control" required="required"></td>

						</tr>
						<tr>

							<td>종료시간</td>
							<td><input type="time" id="endTime" name="endTime"
								class="form-control" required="required"></td>

						</tr>
						<tr>
							<td>지역</td>
							<td><select name="loc" id="loc" class="form-control">
									<option value="강원도">강원도</option>
									<option value="광주광역시">광주광역시</option>
									<option value="경기도">경기도</option>
									<option value="경상남도">경상남도</option>
									<option value="경상북도">경상북도</option>
									<option value="대구광역시">대구광역시</option>
									<option value="대전광역시">대전광역시</option>
									<option value="부산광역시">부산광역시</option>
									<option value="서울특별시">서울특별시</option>
									<option value="세종특별자치시">세종특별자치시</option>
									<option value="인청광역시">인청광역시</option>
									<option value="울산광역시">울산광역시</option>
									<option value="전라남도">전라남도</option>
									<option value="전라북도">전라북도</option>
									<option value="제주특별자치도">제주특별자치도</option>
									<option value="충천남도">충천남도</option>
									<option value="충청북도">충청북도</option>
							</select></td>
						</tr>
						<tr>
							<td>주소</td>
							<td ><input type="text" class="form-control" placeholder="주소" required="required" id="addr" name="addr" maxlength="20">
								<input type="text" class="form-control" placeholder="상세주소" required="required" id="addr2" name="addr2">
								<input type="hidden" id="sample6_extraAddress">
								<input type="hidden" id="sample6_postcode">
								<input type="button" id="AddrSample" onclick="findAddr();" value="주소찾기" class="btn1 btn btn-primary btn-xs"> 
								<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div></td>
								
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" id="price" name="price"
								class="form-control" required="required"></td>
						</tr>
						<tr>
							<td>포스터</td>
							<td><input type="file" id="file" name="file"
								accept="image/gif, image/jpeg, image/png" class="form-control"
								required="required"></td>
						</tr>
						<tr>
							<td>상세정보</td>
							<td><textarea rows="10" cols="90" id="content"
									name="content" required="required"></textarea></td>
						</tr>
					</table>
					<button type="submit" style="background-color: #cfc5e9;margin-bottom: 20px;" class="form-control">등록</button>
				</form>
			</div>
		</div>
	</div>



	<script>
	/* 
		function execDaumPostcode() {
			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						$("#addr").val(data.roadAddress);
					}
				}).open();
			});
		} */
		
		// 주소찾기
	    function findAddr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	            }
	        }).open();
	    }
	</script>
</body>
</html>
