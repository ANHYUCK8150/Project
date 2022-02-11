<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<script type="text/javascript">
		var timer;
		function changeImage() {
			var $I = $('.selectedImage').index();
			$('.selectedImage').fadeOut('slow').removeClass('selectedImage');
			if($I<$('.ds_idx_view').length-1) { $I++; } else { $I=0; }
			$('.selectedTab img').attr('src',$('.selectedTab img').attr('src').replace('_on','_off'));
			$('.selectedTab').removeClass('selectedTab');
			$('.ds_visual_tab').eq($I).find('a').addClass('selectedTab');
			$('.selectedTab img').attr('src',$('.selectedTab img').attr('src').replace('_off','_on'));
			$('.ds_idx_view').eq($I).fadeIn('slow').addClass('selectedImage');
		};
		$(document).ready(function() {
			var rollingSpeed = 10000; // 롤링속도 
			
			$(".price").hide();
			$("#main1").show();
		
			if($('.ds_idx_view').length) { 
				//if($.browser.msie) { $('.ds_idx_view img').css('filter','inherit').parent().css('filter','inherit'); } // IE8 에러해결
				$('.ds_idx_view').first().show().addClass('selectedImage');
				$('.ds_visual_tab').first().find('a').addClass('selectedTab');
				$('.selectedTab img').attr('src',$('.selectedTab img').attr('src').replace('_off','_on'));
			}
			$('.ds_idx_view').hover(function() {
			}, function() {});
			$('.ds_visual_tab').hover(function() {
				var $I=$(this).index();
				if($(this).find('a').hasClass('selectedTab')) return;
				$('.selectedImage').stop(true,true).fadeOut('slow').removeClass('selectedImage');
				$('.selectedTab img').attr('src',$('.selectedTab img').attr('src').replace('_on','_off'));
				$('.selectedTab').removeClass('selectedTab');
				$(this).find('a').addClass('selectedTab');
				$('.ds_idx_view').eq($I).fadeIn('slow').addClass('selectedImage');
				$('.selectedTab img').attr('src',$('.selectedTab img').attr('src').replace('_off','_on'));
			},function() {
			});
		
			/*##################################*/
			/* 자재 세부 이미지 , 이미지 슬라이더 스크립트 */
			/*##################################*/
			
			$(".categoryMenu a").on("click" , function(){
				var clickMain = $(this).attr("data-category-id");
				
				if(clickMain != "" && clickMain != undefined){
					var selectSkill = new Array();
					
					selectSkill.push(clickMain);
					
					$.ajax({
			            url: "list.do",
			            type: "POST",
			            data: {
			            	"selectSkill" : selectSkill
			            },
			            success: function(data){
			            	$('#projectList').empty();
			                $('#projectList').html(data);
			            },
			            error: function(){
			                
			            }
			        });
					
				}
				
			});
		
			$(".itemPrev").on("click keypress", function(){
			
				var itemLn = $(this).parent().parent().find($(".categoryItem.slide li")).length;
				var getContWd = 1216;
				var cnt = $(this).parent().parent().find($(".categoryItem.slide")).attr("index");
				
				if(cnt == 0){
					return false;
				}else{
					if($(this).parent().parent().find($(".categoryItem.slide ul")).is(":animated")){
						return false;
					}else{
						$(this).parent().parent().find($(".categoryItem.slide ul")).animate({
							"margin-left" : "+=" + getContWd + "px"
						}, 1000);
						cnt--;
						$(this).parent().parent().find($(".categoryItem.slide")).attr("index", cnt);
					}
				}
				return false;
			});
			$(".itemNext").on("click keypress", function(){
				
				var itemLn = $(this).parent().parent().find($(".categoryItem.slide li")).length;
				var getContWd = 1216;
				var cnt = $(this).parent().parent().find($(".categoryItem.slide")).attr("index");
				
				if(cnt >= itemLn/4 -1){     
					return false;
				}else{
					if($(this).parent().parent().find($(".categoryItem.slide ul")).is(":animated")){
						return false;
					}else{
						$(this).parent().parent().find($(".categoryItem.slide ul")).animate({
							"margin-left" : "-=" + getContWd + "px"
						}, 1000);               
						cnt++;
						$(this).parent().parent().find($(".categoryItem.slide")).attr("index", cnt);
					}
				}
				return false;
			});

		});
	</script>
	
	<div class="ds_main_visual_wrap" style = "z-index:1;">
	
		<div class="ds_main_visual_01 ds_idx_view">
		</div>
		<div class="ds_main_visual_02 ds_idx_view">
		</div>
		<div class="ds_main_visual_03 ds_idx_view">
		</div>
		<div class="ds_idx_tab">
			<span class="ds_visual_tab"><a href="#"><img src="${path}/resources/images/main_visual_btn_on.png" alt=""></a></span>
			<span class="ds_visual_tab"><a href="#"><img src="${path}/resources/images/main_visual_btn_off.png" alt=""></a></span>
			<span class="ds_visual_tab"><a href="#"><img src="${path}/resources/images/main_visual_btn_off.png" alt=""></a></span>
		</div>
	
	</div>
	
	<div class="ds_container_wrap" style="margin-top:-10px;">

		<div class="category" index="0">
			<div class="divWrap">
				<h2>프로젝트</h2>
				<div class="categoryMenu">
					<ul>
						<li class="cateMenu01"><a href="javascript:return false;" class="aTagEvent " data-category-id="Spring" style="background:url(${path}/resources/images/Spring.png) no-repeat 0 0; background-position: top;">Spring</a></li>
						<li class="cateMenu02"><a href="javascript:return false;" class="aTagEvent " data-category-id="PHP" style="background:url(${path}/resources/images/PHP.png) no-repeat 0 0; background-position: top;">PHP</a></li>
						<li class="cateMenu03"><a href="javascript:return false;" class="aTagEvent " data-category-id="C#" style="background:url(${path}/resources/images/CS.png) no-repeat 0 0; background-position: top;">C#</a></li>
						<li class="cateMenu04"><a href="javascript:return false;" class="aTagEvent " data-category-id="DB" style="background:url(${path}/resources/images/DB.png) no-repeat 0 0; background-position: top;">DB</a></li>
						<li class="cateMenu05"><a href="javascript:return false;" class="aTagEvent " data-category-id="기타" style="background:url(${path}/resources/images/Other.png) no-repeat 0 0; background-position: top;">기타</a></li>
					</ul>
				</div>
				
				<div class="price" id = "main1">
					<div class="priceAndSameMaker categoryItem slide compOverFlow" id="projectList" index="0" style="overflow:hidden;">
						<ul style="margin-left: 0px;">
							<c:forEach items="${projectList }" var="projectList">
								<li style="  margin-right: 17px;">
									<div>
										<a href="/project/reg.do?pbIdx=${projectList.pbIdx }">
											<p class="categoryImg" style="height:220px;">
												<img src="${path}/${projectList.pbImage }" alt="" >
											</p>
											<div class="comProductInfo">
												<p style="font-weight:bold">${projectList.pbSubject }</p>
												<span>${projectList.pbWork }</span>
											</div>					
											<dl>
												<dt>${projectList.pbSkill }</dt>
												<dd>${projectList.pbStartDT } ~ ${projectList.pbEndDT }</dd>
											</dl>
										</a>
									</div>
									<span class="number">1</span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="categoryArr">
						<a href="#" class="itemPrev" title="이전자재"></a>
						<a href="#" class="itemNext" title="다음자재"></a>
					</div>
					
				</div>				
			</div>
		</div>
	</div>
	<div class="use" style="width:100%;">
		<div class="divWrap">
			<h2>게시글</h2>
			<ul>
				<li class="resistGuide">
					<a href="/Manual"  >
						<div>
							<strong>등록가이드</strong>
							<p>자재 및 설비 자재 등록에 대한 가이드 입니다.<br>사 및 자재정보, 시험성적서 등 자재 관련 정보를<br>등록하실 경우 참고하여 주세요.</p>
						</div>
					</a>
				</li>
				<li class="searchGuide">
					<a href="/Register" >
						<div>
							<strong>검색가이드</strong>
							<p>자재 및 설비 관련 자재정보, 가격,<br>시험성적서 등 검색을 위한 가이드 입니다.<br>원하시는 자재정보 검색 시 참고하여 주세요.</p>
						</div>
					</a>
				</li>
				<li class="goodsGuide">
					<a href="/Introduce"  >
						<div>
							<strong>자재 구성 체계</strong>
							<p>자재의 등록 코드 체계 및 PK 체계에 대한<br>설명입니다. 코드에 따라 자재의 분류체계를<br>확인하실 수 있습니다.</p>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</div>