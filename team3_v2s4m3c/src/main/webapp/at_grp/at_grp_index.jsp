<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />



<c:forEach var="at_grp_index" items="${at_grp_index }" >
<%--   <c:choose>
    <c:when test="${list[status.index].at_grp_visible =='Y' }"> --%>


                <div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="img/destination/1.png" alt="">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center">${at_grp_index.at_grp_name }
                            <a href="${root}/at/list.do?at_grp_no=${at_grp_index.at_grp_no }">${at_grp_index.cnt }</a></p>
                            
                        </div>
                    </div>
                </div>
             
  
<%--     </c:when>
  </c:choose> --%>
</c:forEach>