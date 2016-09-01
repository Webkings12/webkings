<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="body-sec"><div class="in-sec"><p class="privacy-fixed"><a href="/policy/privacy">개인정보처리방침</a></p><div>
	<div class="list-top-1">
		<p class="notice-2"><strong>카테고리 전체 : </strong> <em></em> <i>total</i></p>
		<div class="tab-type-1 tab-type-main">
			<ul>
				<li>
					<dl class="age-sel">
						<dt><a href="/home">신상품 추천</a></dt>
						<dd><a href="javascript:;"><em>전체 연령대</em></a></dd>
						<dd><a href="javascript:;"><em>10대 신상품</em></a></dd>
						<dd><a href="javascript:;"><em>20대 신상품</em></a></dd>
						<dd><a href="javascript:;"><em>30대 신상품</em></a></dd>
					</dl>
				</li>
				<li class="active">
					<dl class="prod-cate-sel">
						<dt><a href="javascript:;">전체 상품</a></dt>
					</dl>
				</li>
			</ul>
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
						<p><input type="text" name="sw2" value="" fieldname="검색어" placeholder="결과내 재검색" 
						checkfunctionname="checkSpecialChar" restrictutf8bytes="45"
						 confirmmessage="특수문자로 검색하실수 없습니다." autocomplete="off" focus="off">
						 </p>
						<div>
							<label>가격대</label>
							<input type="text" name="ssp" value=""> ~ <input type="text" name="sep" value="">
						</div>
						<div>
							<label>연령대</label>
							<ul>
								<li><input type="radio" name="sac" value="1"  id="age1"><label for="age1">10대</label></li>
								<li><input type="radio" name="sac" value="2"  id="age2"><label for="age2">20대</label></li>
								<li><input type="radio" name="sac" value="3"  id="age3"><label for="age3">30대</label></li>
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
	</div>

	<ul class="item-list abs-list"></ul>
</div></div></div>
<form id="pageFrm" name="pageFrm" method="get" target="_self">
	<input type="hidden" name="cs" value="100" />
	<input type="hidden" name="sw2" value="" />
</form>