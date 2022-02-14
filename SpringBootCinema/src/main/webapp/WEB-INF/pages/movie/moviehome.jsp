<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@page import="tw.cinema.model.Movie"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.chart-container{
background: #ffffff;
  background-color: #ffffff;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.16), 0 1px 3px 0 rgba(0, 0, 0, 0.12);
  padding: 20px 25px;
  text-align: right;
  display: block;
  margin-top: 20px;
  margin-bottom: 15px;
}
</style>
<meta charset="UTF-8">
<title>Movie Controller</title>
<link rel="stylesheet"
 href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
 integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
 crossorigin="anonymous" />
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
 $(document)
   .ready(
     function() {
      $
        .ajax({
         url : "/movie/getActionForChart",
         method : "GET",
         dataType : 'JSON',
         contentType : 'application/json',
         success : function(data) {
          console.log(data);

          var chartdata = {
           labels : [ "動作", "喜劇", "恐怖", "科幻",
             "懸疑", "愛情" ],
           datasets : [ {
            label : '電影類型統計',
            backgroundColor : [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)' ],
            borderColor : 'rgba(200, 200, 200, 0.75)',
            hoverBackgroundColor : 'rgba(200, 200, 200, 1)',
            hoverBorderColor : 'rgba(200, 200, 200, 1)',
            data : data
           } ]
          };

          var ctx = $("#pie-chart");

          var barGraph = new Chart(ctx, {
           type : 'bar',
           data : chartdata
          });
         },
         error : function(data) {
          console.log(data);
         }
        });
     });
</script>

</head>
<body>


 <%@include file="../Dashboard.jsp"%>

 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
  <div
   class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

   <div align="center">
    <!--    <div align="right">
     <form action="export/csv" method="get">
      <button type="submit" value="send" class="btn btn-success">匯出csv</button>
     </form>
    </div> -->




    <div align="right">
     <form action="insertmovie.controller" method="get">
      <button type="submit" value="send" class="btn btn-success">新增電影</button>


     </form>
    </div>


    <h1>電影管理</h1>

    <br>
    <div class="chart-container" style="width: 50%">

     <canvas id="pie-chart" width="400" height="250"></canvas>

    </div>



    <table class="table table-striped align-middle">
     <thead>
      <tr>
       <th scope="col" class="fs-5">編號</th>
       <th scope="col" class="fs-5">名稱</th>
       <th scope="col" class="fs-5">片長</th>
       <th scope="col" class="fs-5">類別</th>
       <th scope="col" class="fs-5">級別</th>
       <th scope="col" class="fs-5">狀態</th>
       <th scope="col" class="fs-5">導演</th>
       <th scope="col" class="fs-5">圖片</th>
      </tr>
     </thead>
     <tbody>
      <c:forEach items="${allMovies}" var="element">

       <tr>
        <th class="fs-6"><c:out value="${element.movie_No}" /></th>
        <td class="fs-6"><c:out value="${element.movie_Name}" /></td>
        <td class="fs-6"><c:out value="${element.movie_Length}" /></td>
        <td class="fs-6"><c:out value="${element.type}" /></td>
        <td class="fs-6"><c:out value="${element.grading}" /></td>
        <td class="fs-6"><c:out value="${element.releases}" /></td>
        <td class="fs-6"><c:out value="${element.director}" /></td>
        <td><img src="/upload/${element.filename}" height="200"
         width="150"></td>

        <td><a href="findMovieById/${element.movie_No}"
         class="fas fa-edit fa-2x icon-green" title="Edit"></a></td>
        <td><a href="deletemovie/${element.movie_No}"
         class="far fa-trash-alt fa-2x icon-green"></a></td>
       </tr>


      </c:forEach>
     </tbody>
    </table>

    <form action="export/csv" method="get">
     <button type="submit" value="send" class="btn btn-success">Export
      to CSV</button>


    </form>
    <br>
    <div class="text-center">

     <span>Total pages : ${totalPages} Total Movies :
      ${totalElements} </span> <br> <br>
     <div>
      <nav>
       <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link"
         href="/movie/MovieQueryAll.controller/${currentPage - 1}"
         aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
        </a></li>
        <c:forEach var="i" begin="1" end="${totalPages}" step="1">
         <li class="page-item"><a class="page-link"
          href="/movie/MovieQueryAll.controller/${i}">${i}</a></li>
        </c:forEach>
        <li class="page-item"><a class="page-link"
         href="/movie/MovieQueryAll.controller/${currentPage + 1}"
         aria-label="Next"> <span aria-hidden="true">&raquo;</span>
        </a></li>
       </ul>
      </nav>
     </div>
     <br>
    </div>
   </div>
  </div>

 </main>

</body>
</body>
</html>