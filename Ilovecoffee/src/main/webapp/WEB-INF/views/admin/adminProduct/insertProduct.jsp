<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<style type="text/css">
	td{
		width: 
	}
</style>
</head>
<!-- 실제작업 공간 -->
<div class="container-fluid pt-4 px-4">
	<div class="col-12">
		<div class="bg-light rounded h-100 p-4">
			<h6 class="mb-4">[상품 등록]</h6>
			<div class="table-responsive" style="text-align: center;">
				<form action="/admin/insertProductProc" method="post"
					enctype="multipart/form-data" style="display: inline-block;">
					<table>
						<tbody>
							<tr>
								<th>카테고리 번호</th>
								<td><input type="number" name="categoryNo" value="1"
									placeholder="1.ice / 2.hot"></td>
							</tr>
							<tr>
								<th>상품명</th>
								<td><input type="text" name="productName" id="productName"></td>
							</tr>
							<tr>
								<th>가격</th>
								<td><input type="number" name="price" id="price"></td>
							</tr>
							<tr>
								<th>상품 설명</th>
								<td><input type="text" name="explains" id="explains"></td>
							</tr>
							<tr>
								<th>파일 첨부</th>
								<td><input type="file" name="uploadFile" multiple></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"><hr></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="submit" id="regBtn" class="btn btn-sm btn-primary">상품 등록</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 실제작업 공간 끝 -->

<%@ include file="../admin_bottom.jsp"%>