<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.0.min.js"/>'></script>
<script type="text/javascript" src="<c:url value='/js/mainF.js'/>"></script>
<script type="text/javascript">
var itemSel=[];
var nItemSel=[];
</script>
<%@ include file="../../inc/top.jsp"  %>
<div class="body-sec"><div class="in-sec">
<p class="privacy-fixed"><a href="/policy/privacy">개인정보처리방침</a></p>
<div class="not-top">
	<div class="tit-sec-1 tit-sec-full shop-search" style="display: block;"><div class="in">
		<strong>'<em>s</em>' 샵 검색결과 <i>294</i></strong>
		<a href="javascript:;" class="more" style="display: inline;">더보기</a>
	</div></div>
	<ul class="item-list shop-search" style="display: block;"><li class="shop  F ia" style="display: list-item;"><a href="javascript:;" seq="121">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1472529181667_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472529181667_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>316,800</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>갠소</strong>		<span><i cate="201">러블리</i>, <i cate="215">심플베이직</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: list-item;"><a href="javascript:;" seq="2541">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471836803055_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471836803055_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>312,900</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>시크릿라벨</strong>		<span><i cate="201">러블리</i>, <i cate="204">모던시크</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: list-item;"><a href="javascript:;" seq="959">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1472628987224_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472628987224_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>184,000</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>봉자샵</strong>		<span><i cate="201">러블리</i>, <i cate="206">십대쇼핑몰</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: list-item;"><a href="javascript:;" seq="772">	<img src="http://img.sta1.kr/_up/shop/logo/2016/09/1472699062890_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/09/1472699062890_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>74,500</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>스타일티바</strong>		<span><i cate="201">러블리</i>, <i cate="214">페미닌</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: list-item;"><a href="javascript:;" seq="1785">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1472542271240_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472542271240_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>319,100</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>사뿐</strong>		<span><i cate="209">슈즈</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: list-item;"><a href="javascript:;" seq="1528">	<img src="http://img.sta1.kr/_up/shop/logo/2015/09/1442973435990_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2015/09/1442973435990_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>57,500</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>울트라패션</strong>		<span><i cate="206">십대쇼핑몰</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="1770">	<img src="http://img.sta1.kr/_up/shop/logo/2014/09/1409747803784_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2014/09/1409747803784_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>50,600</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>슈마루</strong>		<span><i cate="209">슈즈</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="1636">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471508108603_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471508108603_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>51,320</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>디스코살롱</strong>		<span><i cate="201">러블리</i>, <i cate="204">모던시크</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop C F ia" style="display: none;"><a href="javascript:;" seq="964">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471509043597_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471509043597_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>22,570</i> 회 포털검색</p>		<div class="bg"></div>	</div><div class="coupon"><em>5% 쿠폰다운로드</em></div>	<div class="info">		<strong>얀스토리</strong>		<span><i cate="207">미시스타일</i>, <i cate="215">심플베이직</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="2679">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471511219122_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471511219122_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>20,890</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>세즈윅</strong>		<span><i cate="203">럭셔리·명품</i>, <i cate="214">페미닌</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="1101">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471585533713_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471585533713_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>39,520</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>모스빈</strong>		<span><i cate="204">모던시크</i>, <i cate="205">유니크</i>, <i cate="215">심플베이직</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="2974">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1472516867128_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472516867128_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>1,450</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>스퀘어101</strong>		<span><i cate="206">십대쇼핑몰</i>, <i cate="215">심플베이직</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop C F ia" style="display: none;"><a href="javascript:;" seq="2585">	<img src="http://img.sta1.kr/_up/shop/logo/2016/09/1473757500943_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/09/1473757500943_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>36,390</i> 회 포털검색</p>		<div class="bg"></div>	</div><div class="coupon"><em>5% 쿠폰다운로드</em></div>	<div class="info">		<strong>마이클라씨</strong>		<span><i cate="204">모던시크</i>, <i cate="205">유니크</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="271">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471857259160_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>1,183,000</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>육육걸즈</strong>		<span><i cate="206">십대쇼핑몰</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="11">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471859539678_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471859539678_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>671,900</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>스타일난다</strong>		<span><i cate="202">섹시</i>, <i cate="205">유니크</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="869">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471858782950_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471858782950_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>659,800</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>소녀나라</strong>		<span><i cate="206">십대쇼핑몰</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="9">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1471859116749_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1471859116749_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>600,800</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>고고싱</strong>		<span><i cate="206">십대쇼핑몰</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="16">	<img src="http://img.sta1.kr/_up/shop/logo/2016/08/1472204688902_n1.jpg" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472204688902_n1.jpg" class="item" style="display: block;">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>585,400</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>미아마스빈</strong>		<span><i cate="201">러블리</i>, <i cate="214">페미닌</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="1148">	<img src="http://img.sta1.kr/rsc/front/img/t.png" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472204640535_n1.jpg" class="item">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>539,800</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>메롱샵</strong>		<span><i cate="206">십대쇼핑몰</i></span>		<em class="">팔로우</em>	</div></a></li><li class="shop  F ia" style="display: none;"><a href="javascript:;" seq="18">	<img src="http://img.sta1.kr/rsc/front/img/t.png" data-original="http://img.sta1.kr/_up/shop/logo/2016/08/1472462338086_n1.jpg" class="item">	<div class="over">		<div class="btn"><span class="shop"></span><i>샵 상세페이지</i><span class="fb sns"></span><i>페이스북 공유</i><span class="tw sns"></span><i>트위터 공유</i></div>		<p><i>410,500</i> 회 포털검색</p>		<div class="bg"></div>	</div>	<div class="info">		<strong>파티수</strong>		<span><i cate="203">럭셔리·명품</i>, <i cate="204">모던시크</i></span>		<em class="">팔로우</em>	</div></a></li></ul>

	<div class="tit-sec-1 tit-sec-full prod-search" style="display: block;"><div class="in">
		<div class="tit">
			<strong>'<em>s</em>' 상품 검색결과 <i>6,000</i></strong>
			<div class="cate disnone" style="display: block;">
				<a href="javascript:;">ALL<em>6,000</em></a>
				<ul><li><a href="javascript:;" val="103">BOTTOM<em>1,627</em></a></li><li><a href="javascript:;" val="102">TOP<em>1,332</em></a></li><li><a href="javascript:;" val="104">ONE PIECE<em>1,245</em></a></li><li><a href="javascript:;" val="105">SHOES<em>723</em></a></li><li><a href="javascript:;" val="106">ACC/ETC<em>452</em></a></li><li><a href="javascript:;" val="101">OUTER<em>448</em></a></li><li><a href="javascript:;" val="107">BAG<em>77</em></a></li><li><a href="javascript:;" val="108">UNDERWEAR<em>52</em></a></li><li><a href="javascript:;" val="109">BEACHWEAR<em>44</em></a></li></ul>
			</div>
		</div>
		<div class="option-sec-1">
			<ul>
				<li class="order">
					<a href="javascript:;" class="aw-1">신상품순</a>
					<ul>
						<li><a href="javascript:;" val="0">신상품순</a></li>
						<li><a href="javascript:;" val="2">클릭순</a></li>
						<li><a href="javascript:;" val="3">낮은 가격순</a></li>
						<li><a href="javascript:;" val="4">높은 가격순</a></li>
					</ul>
				</li>

				<li class="detail-search">
					<a href="javascript:;" class="search-1">상세검색</a>
					<div class="sec"><div class="in">
					<form id="_frmDetailSearch">
						<p><input type="text" name="sw2" value="" fieldname="검색어" placeholder="결과내 재검색" checkfunctionname="checkSpecialChar" restrictutf8bytes="45" confirmmessage="특수문자로 검색하실수 없습니다." autocomplete="off" focus="off"></p>
						<div>
							<label>가격대</label>
							<input type="text" name="ssp" value=""> ~ <input type="text" name="sep" value="">
						</div>
						<div>
							<label>연령대</label>
							<ul>
								<li><input type="radio" name="sac" value="1" id="age1"><label for="age1">10대</label></li>
								<li><input type="radio" name="sac" value="2" id="age2"><label for="age2">20대</label></li>
								<li><input type="radio" name="sac" value="3" id="age3"><label for="age3">30대</label></li>
							</ul>
						</div>
						<div class="btn">
							<input type="submit" value="선택항목으로 검색">
							<a href="javascript:;" class="reset">초기화</a>
						</div>
					</form>
					</div></div>
				</li>
			</ul>
		</div>
	</div></div>
	<ul class="item-list abs-list prod-search" style="display: block;">
	<li class="prod F" style="left: 0px; top: 0px;"><a href="javascript:;" sseq="11" seq="1388374">
		<img src="http://img.sta1.kr/_up/prod/thmb/w/2016/09/17/03/1474048911831_AL.jpg" data-original="http://img.sta1.kr/_up/prod/thmb/w/2016/09/17/03/1474048911831_AL.jpg" style="height: 310px; display: block;" class="item">	<span class="favor">관심상품</span>
			<div class="info">		<span class="shop">스타일난다</span>		<span class="name">오프숄더 FLARE MINI OPS_IV</span>		<em class="cate" cate="104">ONE PIECE</em><i>67,800</i>
					<div class="btn"><span class="fb">
	</span><i>페이스북 공유</i><span class="tw"></span><i>트위터 공유</i></div>	
	</div>	<div class="bg"></div></a></li>
</div>
</div>
</div>
</body>
</html>