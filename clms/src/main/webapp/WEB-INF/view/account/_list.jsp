<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:import url="/WEB-INF/view/common/top.jsp" />
	<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">사용자</h1>
          <p class="mb-4">사용자 목록입니다 생성, 수정, 삭제가 가능합니다.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>사용자 이름</th>
                      <th>권한</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${accounts}" var="account">
                    <tr>
                      <td><a href="${pageContext.request.contextPath}/account/${account.id}/form">${account.id}</a></td>
                      <td>${account.name}</td>
                      <td>
                      	<c:if test="${account.authority eq 'A'}">관리자</c:if>
                      	<c:if test="${account.authority eq 'M'}">사용자</c:if>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
		<a href="${pageContext.request.contextPath}/account/form" class="btn btn-info">
            <span class="text">등록</span>
         </a>
        </div>
        <!-- /.container-fluid -->

      <!-- End of Main Content -->	
</body>
</html>