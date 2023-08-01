<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>JSP</title>
</head>
<body>
	<h1>mebmerList</h1>
	<table>
      <thead>
        <tr>
          <th>id</th>
          <th>이름</th>
          <th>전화번호</th>
          <th>이메일</th>
          <th>입사일</th>
          <th>등급</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach var="mem" items="${dataList}">
        <tr>
          <td>${mem.id}</td>
          <td>${mem.memberName}</td>
          <td>${mem.tel}</td>
          <td>${mem.email}</td>
          <td>${mem.regdate}</td>
          <td>${mem.role}</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
</body>
</html>