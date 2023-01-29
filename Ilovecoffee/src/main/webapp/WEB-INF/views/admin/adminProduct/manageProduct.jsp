<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 실제작업 공간 -->
<div class="container-fluid pt-4 px-4">
<div class="col-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">[상품 관리]</h6>
        <div class="table-responsive">
            <table class="table" style="font-size:80%;">
                <thead>
                    <tr style="text-align: center;">
                        <th scope="col">상품번호</th>
                        <th scope="col">카테고리<br>번호</th>
                        <th scope="col">상품명</th>
                        <th scope="col">가격</th>
                        <th scope="col">설명</th>
                        <th scope="col">등록일</th>
                        <th scope="col">이미지url</th>
                    </tr>
                </thead>
                <tbody>
                    	<c:if test="${empty list }">
                    		<tr style="text-align: center;">
                    			<td colspan="5">조회되는 상품이 없습니다.</td>
                    		</tr>
                    	</c:if>
                    	
                    	<c:if test="${!empty list }">
	                    	<c:forEach var="p" items="${list }">
			                    <tr style="text-align: center;">
			                        <th scope="row" style="text-align: center;">${p.productNo}</th>
			                        <td>${p.categoryNo }</td>
			                        <td>${p.productName }</td>
			                        <td>${p.price }</td>
			                        <td>${p.explains }</td>
			                        <td><fmt:formatDate value="${p.regdate }" pattern="yyyy-MM-dd"/></td>
			                        <th scope="col" style="font-size: 80%;">${p.imageURL }</th>
			                    </tr>
	                    	</c:forEach>
                    	</c:if>
                </tbody>
            </table>
            <a class="btn btn-sm btn-primary" href="/admin/insertProduct">상품등록</a>
        </div>
    </div>
</div>
</div>
<!-- 실제작업 공간 끝 -->

<%@ include file="../admin_bottom.jsp" %>