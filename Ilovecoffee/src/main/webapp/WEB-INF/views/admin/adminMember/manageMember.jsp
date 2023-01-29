<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_top.jsp" %>

<!-- 실제작업 공간 -->
<div class="container-fluid pt-4 px-4">
<div class="col-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">[회원 관리]</h6>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr style="text-align: center;">
                        <th scope="col">회원번호</th>
                        <th scope="col">이름</th>
                        <th scope="col">아이디</th>
                        <th scope="col">Email</th>
                        <th scope="col">주소</th>
                        <th scope="col">총 주문횟수</th>
                        <th scope="col">총 주문금액</th>
                        <th scope="col">pw초기화</th>
                    </tr>
                </thead>
                <tbody>
                    	<c:if test="${empty list }">
                    		<td colspan="8">조회되는 회원이 없습니다.</td>
                    	</c:if>
                    	
                    	<c:if test="${!empty list }">
	                    	<c:forEach var="mem" items="${list }">
			                    <tr style="text-align: center;">
			                        <th scope="row" style="text-align: center;">${mem.no}</th>
			                        <td>${mem.name }</td>
			                        <td>${mem.userid }</td>
			                        <td>${mem.email }</td>
			                        <td>${mem.address }</td>
			                        <td>123</td>
			                        <td>1,000</td>
			                        <td><a class="btn btn-sm btn-primary" href="/admin/passwordReset?userid=${mem.userid }">reset</a></td>
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