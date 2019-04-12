<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.fundy.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
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
        
        .memberupdate-nav > div > a
        {
        	text-decoration: none;
        	color: #444;
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
            margin-top: 7px;
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

        .memberupdate-body
        {
            display: flex;
            margin-top: 40px;
        }

        .shipping-addr 
        {
            display: flex;
            width: 100%;
            flex-flow: column nowrap;
            align-items: center;
        }
        .shipping-addr > div{width: 570px; display: flex;}
        .shipping-addr > div:first-of-type{flex: 1 1 0;}
        .shipping-addr > div:last-of-type{flex: 5 1 0;}
        
        .addr-list-container
        {
            display: flex;
            margin: 15px 0 40px 0;
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
            position: relative;
        }

        .delete-btn
        {
            position: absolute;
            right: -3px;
            top: -3px;
            background-color: rgb(124, 21, 52);
            border-radius: 50%;
            font-size: 15px;
            padding: 2px;
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

        .addr-inputs > div {display: flex; margin: 10px 0;}
        .addr-inputs > div > div:first-of-type{flex: 1 1 0; font-weight: bold;}
        .addr-inputs > div > div:last-of-type{flex: 5 1 0;}
        .addr-inputs input {width: 190px; height: 35px; padding: 0 6px; border-radius: 3px; border: 1px solid #ccc; }
        
        .addr-row input {margin: 5px 0;}

        .addr-row > div:last-of-type
        {
            display: flex;
            flex-flow: column nowrap;
        }
        .addr-row button
        {
            margin: 5px 10px 5px 0;
            padding: 6px 15px 6px 15px;
            transform: translateY(-1px);
        }

        #zip-code {width: 97px;}
        .addr-row input {width: 422px;}
        .phone-row input {width: 121px;}
        .phone-row span {margin: 0 5px;}

        .addr-unit-selected
        {
            background-color: var(--basic-color);
        }

        .message
        {
            font-size: 14px;
            margin: 30px;
        }

        .btn-sets
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
        }

        .add-btn-set
        {
            display: none;
        }

        .btn-mod
        {
            margin: none;
            padding: 10px 35px;
        }


</style>

	<section class="section">
        <div class="memberupdate-header">회원정보 수정</div>
        <div class="memberupdate-nav">
            <div><a href="${path }/member/memberUpdateView.do">기본정보수정</a></div>
            <div><a href="${path }/member/memberPwView.do">비밀번호변경</a></div>
            <div><a href="${path }/member/memberAddressView.do">배송지관리</a><span class="indicator"></span></div>
            <div><a href="${path }/member/memberDeleteView.do">회원탈퇴</a></div>
        </div>
        <hr id="divider" />
        <div class="memberupdate-body">
            <form action="${path }/member/memberAddress.do" method="post" class="shipping-addr" id="addr-frm" autocomplete="off">
                <div class="addr-list-container">
                	<c:forEach items="${list }" var="list" varStatus="vs">
	                    <div data-ship-addr-no="${list.shipAddrNo }" class="addr-unit ${vs.index == 0 ? 'addr-unit-selected' : ''}">${list.shipAddrTag }<i class="material-icons delete-btn">close</i></div>                   
                    </c:forEach>
                    <div class="add-addr my-tooltip"><i class="material-icons">add</i>
                        <span class="my-tooltiptext">새 배송지</span>
                    </div>
                </div>
                
                <div class="addr-inputs">
                    <div class="addr-tag-row">
                        <div>배송지명</div>
                        <div>
                            <input type="text" name="shipAddrTag" id="ship-addr-tag" value="">
                        </div>
                    </div>
                    <div class="receiver-row">
                        <div>수취인</div>
                        <div>
                            <input type="text" name="shipAddrReceiver" id="ship-addr-receiver" value="">
                        </div>
                    </div>
                    <div class="addr-row">
                        <div>주소</div>
                        <div>
                            <div>
                                <button class="basic-btn basic-btn-active ripple" id="find-addr" onclick="return false;">주소찾기</button>
                                <input type="text" name="zipCode" id="zip-code" >
                            </div>
                            <input type="text" name="shipAddr" id="ship-addr" value="">
                            <input type="text" name="shipAddrDetail" id="ship-addr-detail" placeholder="상세주소를 입력해주세요." value="">
                        </div>
                    </div>
                    <div class="phone-row">
                        <div>연락처</div>
                        <div>
                            <input type="tel" name="phone1" id="phone-1" value=""><span>─</span>
                            <input type="tel" name="phone2" id="phone-2" value=""><span>─</span>
                            <input type="tel" name="phone3" id="phone-3" value="">
                        </div>
                    </div>
                </div>
                

                <span class="message">배송지는 5개까지 등록됩니다.</span>
                <div class="btn-sets">
                    <div class="save-btn-set btn-set">
                        <button class="basic-btn btn-mod save-cancel-btn ripple">취소</button>
                        <button class="basic-btn basic-btn-active btn-mod modify-btn ripple" onclick="update();">수정</button>
                    </div>
                    <div class="add-btn-set btn-set">
                        <button class="basic-btn btn-mod add-cancel-btn ripple">취소</button>
                        <button class="basic-btn basic-btn-active btn-mod add-btn ripple" onclick="send();">추가</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
<script>
    //주소 선택 이벤트
    const deleteBtn = $('.delete-btn');
    const addrUnits = $('.addr-unit');
    $(() => {
        addrUnits.on('click', e => {
            if(deleteBtn.index(e.target) != -1) return;
            addrUnits.removeClass('addr-unit-selected');
            $(e.currentTarget).toggleClass('addr-unit-selected');
			
            const shipAddrNo = $(e.currentTarget).data('shipAddrNo');
			
            $.ajax({
            	type: 'get',
            	url: '${path}/memberUpdate/selectShipAddr.ajax?shipAddrNo='+shipAddrNo,
            	dataType: 'json',
            	success: data => {
                	$('#ship-addr-tag').val(data.addr.shipAddrTag);
                	$('#ship-addr-receiver').val(data.addr.shipAddrReceiver);
                	$('#zip-code').val(data.addr.zipCode);
                	$('#ship-addr').val(data.addr.shipAddr);
                	$('#ship-addr-detail').val(data.addr.shipAddrDetail);

                	$('#phone-1').val(data.addr.phone.substring(0, 3));
                	$('#phone-2').val(data.addr.phone.substring(4, 8));
                	$('#phone-3').val(data.addr.phone.substring(9, 13));
            	}
            });
        });
    });

    //주소 삭제 이벤트
    $(() => {
        deleteBtn.on('click', e => {
            const flag = confirm('정말로 삭제하시겠습니까?');
            if(flag)
            {
            	const shipAddrNo = $(e.currentTarget).parent().data('shipAddrNo');
            	
            	$.ajax({
            		type: 'get',
            		url: '${path}/memberUpdate/deleteShipAddr.ajax?shipAddrNo='+shipAddrNo,
            		dataType: 'json',
            		success: data => {
            			if(data.result > 0)
            			{
                        	$(e.currentTarget).parent().fadeOut(500);
                        	setTimeout(() => {
            	                $(e.currentTarget).parent().remove();            		
                        	}, 600);
            			}
            		}
            	});
            }
        });
    });
    

    $(() => {
        $('.save-cancel-btn').on('click', e =>{
            e.preventDefault();
        });

        $('.modify-btn').on('click', e => {
            e.preventDefault();
        });

        $('.add-btn').on('click', e => {
            e.preventDefault();
        	$("#addr-frm").attr("action","${pageContext.request.contextPath}/memberUpdate/insertShipAddr.do");
        	$("#addr-frm").submit();
        });

        $('.add-cancel-btn').on('click', e =>{
            e.preventDefault();
        });

        $('.add-addr').on('click', () => {
        	addrUnits.removeClass('addr-unit-selected');
            $('input').val("");
            $('.btn-set').toggle();
        });
    });

</script>

<script>
	function fn_updateAddr(){
		addrFrm.submit();
	}

</script>

<script>
	//주소API 기능 바인드
	$(() => {
		$('#find-addr').on('click', loadDaumPost);
	});


	const loadDaumPost = () => {
	    new daum.Postcode({
	        oncomplete: data => {
				$('#zip-code').val(data.zonecode);
				$('#ship-addr').val(data.roadAddress);
	        }
	    }).open();
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>