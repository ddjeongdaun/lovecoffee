<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 실제작업 공간 -->

<!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">전체 판매금액</p>
                                <h6 class="mb-0">
                                <fmt:formatNumber pattern="#,###" value="${totalOrderPrice }"/></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">전체 판매수량</p>
                                <h6 class="mb-0">${totalOrder }</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">전체 고객</p>
                                <h6 class="mb-0">${totalMember }</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">전체 메뉴</p>
                                <h6 class="mb-0">${totalProduct }</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sale & Revenue End -->

            <!-- Recent Sales Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">최근 판매내역</h6>
                        <a href="/admin/order">[전체 판매내역]</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col">날짜</th>
                                    <th scope="col">상품</th>
                                    <th scope="col">고객이름</th>
                                    <th scope="col">픽업여부</th>
                                    <th scope="col">총 금액</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty orderList }">
                            		<tr style="text-align: center;">
                    					<td colspan="5">조회되는 주문내역이 없습니다.</td>
                    				</tr>
                            	</c:if>
                            	<c:if test="${!empty orderList }">
	                            	<c:forEach var="list" items="${orderList }">
		                                <tr>
		                                    <td>${list.regdate }</td>
		                                    <td>${list.productName }</td>
		                                    <td>${list.customerId }</td>
		                                    <td>${list.deliveryStatus }</td>
		                                    <td>${list.totalPrice }</td>
		                                </tr>
	                            	</c:forEach>
	                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Widgets End -->
            
<!-- 실제작업 공간 끝 -->

<%@ include file="admin_bottom.jsp" %>