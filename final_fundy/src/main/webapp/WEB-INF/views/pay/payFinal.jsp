<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
        .option-header
        {
            width: 100%;
            height: auto;
            display: flex;
            justify-content: center;
            position: relative;
            margin: 50px 0;
        }

        .project-title
        {
            font-size: 30px;
            font-weight: bold;
        }

        .go-back
        {
            position: absolute;
            left: -9px;
            font-size: 15px;
            cursor: pointer;
        }

        .go-back > i
        {
            transform: translateY(8px);
            font-size: 28px;
        }

        .option-price-title
        {
            display: flex;
        }

        .selected-options-title
        {
            width: 100%;
            font-weight: bold;
            font-size: 25px;
            margin: 25px 30px 25px 0;
            display: flex;
            justify-content: center;
        }

        .price-info-title
        {
            width: 100%;
            font-weight: bold;
            font-size: 25px;
            display: flex;
            justify-content: center;
            margin: 25px 0;
        }

        .option-price-container
        {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
        }

        .option-price-container > div{flex: 1 1 0;}

        .option-box
        {
            margin-right: 30px;
            border: 1px solid #ccc;
            padding: 25px;
            box-sizing: border-box;
            display: flex;
            flex-flow: column nowrap;
            justify-content: space-between;
            position: relative;
        }

        .option-box:nth-of-type(2n){margin-left: 3%;}

        .option-price
        {
            font-size: 25px;
            color: var(--basic-color);
            font-weight: bold;
        }

        .horizontal-line
        {
            display: block;
            width: 100%;
            height: 1px;
            background-color: #ccc;
            margin: 20px 0;
        }

        .line-2
        {
            margin: 50px 0;
        }

        .ship-date
        {
            display: flex;
            font-size: 14px;
            margin-top: 15px;
        }

        .divider
        {
            font-size: 12px;
            margin: 0 15px;
            display: flex;
        }
        
        .date
        {
            font-weight: bold;
        }

        .price-info-container
        {
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
            justify-content: center;
            border: 1px solid #ccc;
            padding: 25px;
            box-sizing: border-box;
        }

        .price-div
        {
            width: 100%;
            display: flex;
            align-items: center;
        }

        .price-div > div{flex: 1 1 0; margin: 0 20px;}
        .price-div > div:first-of-type{display:flex; justify-content: flex-end;}
        .price-div > div:last-of-type{display:flex; justify-content: flex-start;font-size: 25px; font-weight: bold;}

        .total-price > div:first-of-type{font-size: 25px; font-weight: bold;}
        .total-price > div:last-of-type{font-size: 30px; color: var(--basic-color);}

        .sub-option-container{display: flex; width: 100%;}
        .sub-option-container > div{width: 100%; display: flex;}
        .sub-option-container > div:first-of-type{flex: 1 1 0;}
        .sub-option-container > div:last-of-type{flex: 5 1 0;}
        
        .shipping-addr > div{flex-flow: column nowrap;}
        
        .addr-tab-container
        {
            border-bottom: 1px solid #ccc;
            display: flex;
        }

        .addr-tab
        {
            border-top: 1px solid #ccc;
            border-left: 1px solid #ccc;
            width: 180px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .addr-tab:last-of-type{border-right: 1px solid #ccc;}

        .addr-list-container
        {
            display: flex;
            margin-bottom: 40px;
        }

        .addr-unit
        {
            border-radius: 20px;
            background-color: #aaa;
            padding: 7px 27px;
            margin-right: 10px;
            color: rgb(243, 243, 243);
            font-size: 15px;
            cursor: pointer;
        }

        .addr-unit-selected
        {
            background-color: var(--basic-color);
        }

        .add-addr
        {
            background-color: rgba(44, 141, 145, 0.87);
            display: flex;
            align-items: center;
            justify-content: center;
            width: 37px;
            height: 37px;
            color: rgb(235, 235, 235);
            border-radius: 50%;
            cursor: pointer;
        }

        .addr-inputs
        {
            display: flex;
            flex-flow: column nowrap;
        }

        .addr-inputs > div{display: flex; margin: 10px 0;}
        .addr-inputs > div > div:first-of-type{flex: 1 1 0;}
        .addr-inputs > div > div:last-of-type{flex: 5 1 0;}

        .addr-row input {margin: 5px 0;}

        .addr-row > div:last-of-type
        {
            display: flex;
            flex-flow: column nowrap;
        }
        .addr-row button
        {
            margin: 5px 10px 5px 0;
            padding: 6px 15px;
            transform: translateY(1px);
        }

        .addr-inputs input 
        {
            box-sizing: border-box;
            height: 31px;
            width: 190px;
        }

        #zip-code {width: 97px;}
        .addr-row input {width: 422px;}
        .phone-row input {width: 124px;}
        .phone-row span {margin: 0 5px;}

        .request-row > div:last-of-type
        {
            width: 416px;
            height: 90px;
        }

        #request
        {
            width: inherit;
            height: inherit;
            resize: none;
        }

        .addr-message
        {
            font-size: 15px;
            margin-top: 30px;
        }

        .pay-method > div:first-of-type{align-items: center;}
        .pay-method > div:last-of-type {font-size: 21px; cursor: pointer;}
        .pay-method > div > div {margin-right: 100px; display: flex; align-items: center; font-weight: bold;}
        .pay-method > div > div > i {font-size: 80px; margin-right: 30px; margin-left: -8px;}

        .sub-title
        {
            font-size: 21px;
            font-weight: bold;
        }

        .confirm-btn-sets
        {
            width: 100%;
            display: flex;
            justify-content: center;
            margin: 30px 0 100px 0;
        }

        .btn-mod
        {
            padding: 12px 45px;
        }

    </style>
    <section class="section">
        <div class="option-header">
            <div class="go-back" onclick="location.href='${path}/projectList/projectListDetail.do?projectNo=${project.projectNo}'">
            	<i class="material-icons">chevron_left</i>옵션선택으로 돌아가기</div>
            <div class="project-title">${projectTitle }</div>
        </div>
        <div class="option-price-title">
            <div class="selected-options-title">후원 상세</div>
            <div class="price-info-title">최종 결제금액</div>
        </div>
        <div class="option-price-container">
            <div class="option-box">
                <div>
                    <div class="option-price">
                        ${fundingOption.fundPrice }  
                    </div>
                    <span class="horizontal-line"></span>
                    <div class="option-detail">
                    	<c:forEach items="${fundingOption.odList }" var="odList" varStatus="vs">
                        · ${odList.packageName } ${odList.packageAmount }개${!varStatus.last ? "<br>" : ""}
                        </c:forEach>
                    </div>
                </div>
                <div>
                    <span class="horizontal-line"></span>
                    <div class="amount">수량 2개</div>
                    <div class="ship-date">예상 발송일 <span class="divider">|</span><span class="date">2019년 4월 26일</span></div>
                </div>    
            </div>
            <div class="price-info-container">
                <div class="price-div original-money">
                    <div>후원 금액</div>
                    <div>19,800</div>
                </div>
                <div class="price-div extra-money">
                    <div>추가 후원금</div>
                    <div>0</div>
                </div>
                <span class="horizontal-line"></span>
                <div class="price-div total-price">
                    <div>총금액</div>
                    <div>19,800</div>
                </div>
            </div>
        </div>
        <span class="horizontal-line line-2"></span>
        <div class="sub-option-container shipping-addr">
            <div class="sub-title">배송지</div>
            <div>
                <div class="addr-list-container">
                    <div class="addr-unit addr-unit-selected">이일교</div>
                    <div class="addr-unit">정우진</div>
                    <div class="addr-unit">이일교</div>
                    <div class="addr-unit">정우진</div>
                    <div class="addr-unit">정우진</div>
                    <div class="add-addr tooltip"><i class="material-icons">add</i>
                        <span class="tooltiptext">새 배송지</span>
                    </div>                        
                </div>
                <div class="addr-inputs">
                    <div class="addr-tag-row">
                        <div>배송지명</div>
                        <div>
                            <input type="text" name="" id="addr-tag">
                        </div>
                    </div>
                    <div class="receiver-row">
                        <div>수취인</div>
                        <div>
                            <input type="text" name="" id="receiver">
                        </div>
                    </div>
                    <div class="addr-row">
                        <div>주소</div>
                        <div>
                            <div>
                                <button class="basic-btn basic-btn-active ripple">주소찾기</button>
                                <input type="text" name="" id="zip-code">
                            </div>
                            <input type="text" name="" id="addr-1">
                            <input type="text" name="" id="addr-2" placeholder="상세주소를 입력해주세요.">
                        </div>
                    </div>
                    <div class="phone-row">
                        <div>연락처</div>
                        <div>
                            <input type="tel" name="" id="phone-1"><span>─</span>
                            <input type="tel" name="" id="phone-2"><span>─</span>
                            <input type="tel" name="" id="phone-3">
                        </div>
                    </div>
                    <div class="request-row">
                        <div>요청사항</div>
                        <div><textarea name="" id="request"></textarea></div>
                    </div>
                </div>
                <span class="addr-message">배송지 저장은 5개까지 가능합니다.</span>
            </div>
        </div>
        <span class="horizontal-line line-2"></span>
        <div class="sub-option-container pay-method">
            <div class="sub-title">결제수단</div>
            <div>
                <div class="pay-method-option">
                    <i class="material-icons">payment</i>
                   	 	신용카드
                    <input type="radio" name="payMethod" class="pay-method-radio" value="credit" hidden/>
                </div>
                <div class="pay-method-option">
                    <i class="material-icons">local_atm</i>    
                    	계좌송금
                    <input type="radio" name="payMethod" class="pay-method-radio" value="remittance" hidden/>
                </div>
            </div>
        </div>
        <span class="horizontal-line line-2"></span>
        <div class="confirm-btn-sets">
            <button class="basic-btn btn-mod">이전</button>
            <button class="basic-btn basic-btn-active btn-mod">결제하기</button>
        </div>
    </section>
<script>

    //주소 선택 이벤트
        const addrUnits = $('.addr-unit');
    $(() => {
        addrUnits.on('click', e => {
            addrUnits.removeClass('addr-unit-selected');
            $(e.currentTarget).toggleClass('addr-unit-selected');
        });
    });

    //결제수단 클릭 이벤트 바인드
    const payMethod = $('.pay-method-option');
    $(() => {
        payMethod.on('click', e => {
            if($('.pay-method-radio').attr('checked') === 'checked')
            {
                payMethod.css('color', '#444');
                payMethod.children().css('color', '#444');
                payMethod.children('input').attr('checked', 'false');
            }
            $(e.currentTarget).css('color', 'var(--basic-color)');
            $(e.currentTarget).children().css('color', 'var(--basic-color)');
            $(e.currentTarget).children('input').attr('checked', 'true');
        });
    });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>