<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
	<!-- header -->
	<%@ include  file="inc/top.jsp" %>
	<!-- body -->
	<div class="bodySec">
		<div class="bodyInSec">
			
			<!-- left -->
			<div class="leftSec">
				<%@ include  file="inc/left.jsp" %>
			</div>
			
			<!-- right content -->
			<div class="rightSec">
				<div class="contentSec">
					<div class="contentInSec">
						<div class="locationSec">
							<ul>
								<li>현재위치 :</li>
								<li>마케팅센터 ></li>
								<li>Home</li>
							</ul>
						</div>
						<div class="tWidth"></div>
						<div class="contType2Sec mgb20">
							<div class="sec sec1">
								<div class="inSec">
									<div class="titTabSec">
										<h2>공지사항</h2>
										<ul>
											<li>
												<a href="#">전체보기</a>
											</li>
										</ul>
									</div>
									<div class="boardList1">
										<table>
											<colgroup>
												<col width="*">
												<col width="120">
											</colgroup>
											<tbody>
												<tr>
													<td class="tleft">
														<a href="#">CPC 최저 가격 변동 공지! (10월 1일 적용 예정)</a>
													</td>
													<td>
														2016-07-28
													</td>
												</tr>												
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="sec sec2">
								<div class="inSec">
									<div class="titTabSec">
										<h2>광고매체 현황</h2>
									</div>
									<div class="boardList1">
										<table class="list">
											<colgroup>
												<col width="*">
												<col width="15%">
												<col width="15%">
												<col width="15%">
											</colgroup>
											<thead>
												<tr>
													<th>매체명</th>
													<th>기본CPC(여)</th>
													<th>기본CPC(남)</th>
													<th>광고주현황</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="contType2Sec mgb20">
							<div class="sec sec1">
								<div class="inSec">
									<div class="titTabSec">
										<h2>광고주현황 (여성쇼핑몰)</h2>
										<p class="txt">2016-09-26 현재</p>
									</div>
									<div class="boardList1">
										<table class="list list1">
											<tbody>
												<tr>
													<td class="tleft"><p>갠소</p></td>
													<td class="tright"><span>gaenso.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>로렌하이</p></td>
													<td class="tright"><span>laurenhi.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>핫핑</p></td>
													<td class="tright"><span>hotping.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>울트라패션</p></td>
													<td class="tright"><span>ultrafashion.net</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>시크릿라벨</p></td>
													<td class="tright"><span>secretlabel.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>봉자샵</p></td>
													<td class="tright"><span>bongjashop.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>사뿐</p></td>
													<td class="tright"><span>sappun.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>모노바비</p></td>
													<td class="tright"><span>monobarbie.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>걸즈비</p></td>
													<td class="tright"><span>girlz-b.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>스타일티바</p></td>
													<td class="tright"><span>styletiba.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>룩걸</p></td>
													<td class="tright"><span>lookgirl.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>후즈걸</p></td>
													<td class="tright"><span>whosgirl.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>반할라</p></td>
													<td class="tright"><span>banhala.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>슈마루</p></td>
													<td class="tright"><span>shoemaru.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>데일리먼데이</p></td>
													<td class="tright"><span>dailymonday.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>제이엘프</p></td>
													<td class="tright"><span>ellpe.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>디스코살롱</p></td>
													<td class="tright"><span>discosalon.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>얀스토리</p></td>
													<td class="tright"><span>yan-story.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>다바걸</p></td>
													<td class="tright"><span>dabagirl.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>세즈윅</p></td>
													<td class="tright"><span>sezwick.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>선데이모닝</p></td>
													<td class="tright"><span>sundaymorning.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>슈앤미</p></td>
													<td class="tright"><span>shoenme.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>이란지</p></td>
													<td class="tright"><span>eranzi.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>세컨드미러</p></td>
													<td class="tright"><span>2ndmirror.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>리플라워</p></td>
													<td class="tright"><span>reflower.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>바이비비안</p></td>
													<td class="tright"><span>by-vivien.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>모스빈</p></td>
													<td class="tright"><span>mossbean.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>오제인</p></td>
													<td class="tright"><span>ojane.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>가르손느</p></td>
													<td class="tright"><span>garconne.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>아이스크림12</p></td>
													<td class="tright"><span>icecream12.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>파퓰러</p></td>
													<td class="tright"><span>popularst.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>어반하다</p></td>
													<td class="tright"><span>urbanhada.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>아르모어</p></td>
													<td class="tright"><span>armoire.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>바이앤헬로</p></td>
													<td class="tright"><span>byeandhello.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>푸하핫</p></td>
													<td class="tright"><span>puhahot.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>데이슈즈</p></td>
													<td class="tright"><span>dayshoes.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>스타일블룸</p></td>
													<td class="tright"><span>style-bloom.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>어프레투</p></td>
													<td class="tright"><span>aphre2.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>나예뻐</p></td>
													<td class="tright"><span>impretty.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>고집언니</p></td>
													<td class="tright"><span>gozip28.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>그레이스원</p></td>
													<td class="tright"><span>grace1.co.kr</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="sec sec2">
								<div class="inSec">
									<div class="titTabSec">
										<h2>광고주현황 (남성쇼핑몰)</h2>
										<p class="txt">2016-09-05 현재</p>
									</div>
									<div class="boardList1">
										<table class="list list1">
											<tbody>
												<tr>
													<td class="tleft"><p>디스코제이</p></td>
													<td class="tright"><span>disco-j.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>머시따</p></td>
													<td class="tright"><span>meosidda.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>조군샵</p></td>
													<td class="tright"><span>jogunshop.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>게리오</p></td>
													<td class="tright"><span>gerio.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>아보키</p></td>
													<td class="tright"><span>aboki.net</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>허밍슈퍼</p></td>
													<td class="tright"><span>hummingsuper.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>바이슬림</p></td>
													<td class="tright"><span>byslim.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>미토샵</p></td>
													<td class="tright"><span>mitoshop.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>스코우</p></td>
													<td class="tright"><span>scou.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>리멤버클릭</p></td>
													<td class="tright"><span>rememberclick.com</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>미스터스트릿</p></td>
													<td class="tright"><span>mr-s.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>코리안어패럴</p></td>
													<td class="tright"><span>koreanapparel.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>플라이데이</p></td>
													<td class="tright"><span>flyday.co.kr</span></td>
												</tr>
												<tr>
													<td class="tleft"><p>탐난다</p></td>
													<td class="tright"><span>tam-nanda.com</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<div class="footSec">
		<h1>
			<a href="javascript:;">
				<img src="http://img.sta1.info/rsc/mkc/img/skin/logo_2.gif" alt="마케팅센터">
			</a>
		</h1>
		<div class="fleft">
			<img src="http://img.sta1.info/rsc/mkc/img/skin/footer_1.gif" alt="">
		</div>
		<div class="fright">
			<img src="http://img.sta1.info/rsc/mkc/img/skin/footer_2.gif" alt="">
		</div>
	</div>
</body>
</html>