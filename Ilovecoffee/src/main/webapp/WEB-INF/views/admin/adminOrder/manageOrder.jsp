<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_top.jsp" %>

<!-- 실제작업 공간 -->
<div class="container-fluid pt-4 px-4">
<div class="col-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">[주문 관리]</h6>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr style="text-align: center;">
                        <th scope="col">주문번호</th>
                        <th scope="col">고객아이디</th>
                        <th scope="col">총 가격</th>
                        <th scope="col">배송/픽업 현황</th>
                        <th scope="col">주문일자</th>
                    </tr>
                </thead>
                <tbody>
                    	<c:if test="${empty list }">
                    		<tr style="text-align: center;">
                    			<td colspan="5">조회되는 주문이 없습니다.</td>
                    		</tr>
                    	</c:if>
                    	
                    	<c:if test="${!empty list }">
	                    	<c:forEach var="orlist" items="${list }">
			                    <tr style="text-align: center;">
			                        <td>${orlist.orderNo }</td>
			                        <td>${orlist.customerId }</td>
			                        <td>${orlist.totalPrice }</td>
			                        <td>${orlist.deliveryStatus }</td>
			                        <td>${orlist.regdate }</td>
			                    </tr>
	                    	</c:forEach>
                    	</c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<!-- 실제작업 공간 끝 -->

<%@ include file="../admin_bottom.jsp" %>