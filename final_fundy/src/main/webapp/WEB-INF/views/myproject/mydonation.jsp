<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
	/* 마이페이지 시작 */
	.memberupdate-header
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    font-size: 27px;
	    font-weight: bold;
	    margin: 30px 0;
	}
	
	.memberupdate-nav
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	}
	
	.memberupdate-nav > div
	{
	    margin: 0 20px;
	    font-size: 17px;
	    position: relative;
	}
	
	#divider
	{
	    position: absolute;
	    display: block;
	    height: 1px;
	    border: none;
	    border-top: 1px solid #ccc;
	    left: 0;
	    width: 100vw;
	    margin: 7px 0 0 0;
	}
	
	.indicator
	{
	    display: block;
	    bottom: -8px;
	    position: absolute;
	    width: 100%;
	    height: 5px;
	    background-color: rgb(76, 168, 228);
	}
	
	.mypage-body
	{
	    display: flex;
	    margin-top: 40px;
	    
	}
	
	
	/* 페이지 토글 부분 */
	
	.major-category-toggle
	{
	    display: flex;
	    flex-flow: column nowrap;
	    position: relative;
	    width: 50px;
	}
	
	.major-category-toggle > div {margin-bottom: 25px; line-height: 18px; cursor: pointer;}
	
	.divider-2
	{
	    display: block;
	    position: absolute;
	    width: 1px;
	    height: 65px;
	    top: 0;
	    right: 0;
	    background-color: #ccc;
	}
	
	.indicator-2
	{
	    display: block;
	    position: absolute;
	    width: 5px;
	    height: 22px;
	    top: 0;
	    right: 0;
	    background-color: rgb(76, 168, 228);
	    transition: .3s ease;
	}
	
	/* 프로젝트 리스트 부분 */
	
	.proj-list-wrapper
	{
	    width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	    margin-left: 30px;
	}
	
	.project-count
	{
		font-size: 21px;
		font-weight: bold;
		margin: 20px 0 50px 0;
	}
	.proj-list-header
	{
	    width: 100%;
	    display: flex;
	    justify-content: flex-end;
	    align-items: center;
	}
	
	.proj-list-header > span
	{
	    font-size: 15px;
	    font-weight: bold;
	}
	
	.proj-search-container
	{
	    display: flex;
	    align-items: center;
	    margin: 0 15px;
	}
	
	.proj-search-container i
	{  
	    font-size: 32px;
	    line-height: 33px;
	    margin-bottom: -4px;
	    color: gray;
	}
	
	.proj-search
	{
	    border: none;
	    border-bottom: 1px solid #ccc;
	    padding: 3px 0;
	    width: 150px;
	}
	
	.proj-list-order
	{
	    display: flex;
	    justify-content: flex-end;
	}
	
	.proj-list-order > select
	{
	    padding: 3px 8px;
	    margin-right: 10px;
	}
	
	.proj-list-box
	{
	    width: 100%;
	    display: flex;
	    padding: 23px;
	    box-sizing: border-box;
	    margin: 20px 0;
	    border: 1px solid #ccc;
	    position: relative;
	    cursor: pointer;
	}
	
	.proj-list-thumnail
	{
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex: 4 1 0;
	}
	
	.proj-list-thumnail > img
	{
	    width: 97%;
	    height: 97%;
	}
	
	.proj-list-title
	{
	    font-size: 30px;
	    font-weight: bold;
	    line-height: 29px;
	}
	
	.proj-list-body
	{
	    padding-left: 20px; flex: 7 1 0;
	    display: flex;
	    flex-flow: column;
	    justify-content: space-between;
	}
	
	.proj-list-body > hr
	{
	    margin: 5px 0 ;
	    width: 25px;
	}
	
	.proj-creator{font-weight: bold;}
	
	.proj-brief{color: #666;}
	
	.proj-progbar-container
	{
	    position: relative;
	    width: 100%;
	}
	
	.proj-progbar-emtpy
	{
	    background-color: #eee;
	    height: 5px;
	    width: 100%;
	    margin-bottom: 10px;
	}
	.proj-progbar-filled
	{
	    position: absolute;
	    top: 0;
	    height: 5px;
	    width: 60%;
	    background-color: var(--basic-color);
	    margin-bottom: 10px;
	}
	
	.proj-progbar-info
	{
	    display: flex;
	    justify-content: space-between;
	    line-height: 19px;
	}
	
	.status-tag
	{
	    position: absolute;
	    left: 0;
	    top: 0;
	    padding: 10px 20px;
	    font-weight: bold;
	    font-size: 19px;
	    line-height: 19px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.examining{background-color: rgb(220, 177, 7); color: white;}
	.open{background-color: var(--basic-color); color: white;}
	.closed{background-color: #666; color: white;}
	.denied{background-color: rgb(211, 84, 0); color: white;}
	
	.info-empty
	{
		padding: 30px 100px;
		border: 1px solid #444;
		display: flex;
		flex-flow: column nowrap;
		align-items: center;
		margin: 60px 0 45px 0;
	}
	
	.info-empty > i
	{
		font-size: 45px;
	}

</style>    
    <section class="section">
        <div class="memberupdate-header">마이페이지</div>
        <div class="memberupdate-nav">
            <div>내 프로젝트<span class="indicator"></span></div>
            <div>내 후원내역</div>
        </div>
        <hr id="divider" />
        <div class="mypage-body">
            <div class="major-category-toggle">
                <div>후원</div>
                <div>펀딩</div>
                <span class="divider-2"></span>
                <span class="indicator-2"></span>
            </div>
            <div class="proj-list-wrapper">
				<span class="project-count">총 ${fn:length(list) }건의 프로젝트가 있습니다.</span>
        			<div class="proj-list-header">        
	                    <div class="proj-search-container">
	                        <i class="material-icons">search</i>
	                        <input type="text" name="" class="proj-search" placeholder="내 프로젝트 검색">
	                    </div>
	                    <div class="proj-list-order">
	                        <select name="projectStatCode" id="project-stat-filter">
	                        	<option value="" ${map['projectStatCode'] eq null or projectStatCode eq '' ? 'selected' : '' }>전체보기</option>
	                            <option value="PS01" ${map['projectStatCode'] eq 'PS01' ? 'selected' : ''}>임시저장</option>
	                            <option value="PS02" ${map['projectStatCode'] eq 'PS02' ? 'selected' : ''}>검토중</option>
	                            <option value="PS03" ${map['projectStatCode'] eq 'PS03' ? 'selected' : ''}>진행중</option>
	                            <option value="PS04" ${map['projectStatCode'] eq 'PS04' ? 'selected' : ''}>마감됨</option>
	                            <option value="PS05" ${map['projectStatCode'] eq 'PS05' ? 'selected' : ''}>반려됨</option>
	                        </select>
	                        <select name="orderby" id="orderby">
				                <option value="null" disabled>정렬</option>
				                <option value="funderNo" ${map['orderby'] eq "funderNo" ? "selected" : "" }>후원자순</option>
				                <option value="reachRate" ${map['orderby']  eq "reachRate" ? "selected" : "" }>달성율순</option>
				                <option value="endDate" ${map['orderby']  eq "endDate" ? "selected" : "" }>마감임박순</option>
				                <option value="reach" ${map['orderby'] eq "reach" ? "selected" : "" }>달성액순</option>
				            </select>
	                    </div>
	                </div>
	            <c:if test="${fn:length(list) == 0}">
	                <div class="info-empty">
        				<i class="material-icons info-icon">info_outline</i><br>
        				<span>내 프로젝트가 없습니다.</span>
        				<span>프로젝트 신청 버튼은 상단에 있습니다.</span>
        			</div>
                </c:if>
        		<c:if test="${fn:length(list) != 0 }">
				    <div class="donation-list">
				        <div class="donation-list-header">
				            <div>프로젝트 사진</div>
				            <div>프로젝트 이름</div>
				            <div>상태</div>
				            <div>마감일</div>
				            <div>기부일</div>
				            <div>기부금액</div>
				        </div>
	        			<c:forEach items="${list }" var="list" varStatus="vs">
				        <div class="donation-list-row">
				            <div>
				                <img src="images/thumnail_sample_0.jpg">
				            </div>
				            <div>후라라라라라라</div>
				            <div>진행중</div>
				            <div>19/04/31</div>
				            <div>19/05/03 12:00</div>
				            <div>3,000 ￦</div>
				        </div>
		        		</c:forEach>
				    </div>
        		</c:if>
        		<c:if test="${fn:length(list) != 0}">
				${pageBar }
				</c:if>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>