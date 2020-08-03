<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
</head>
<body>
<a href="#" onclick="startSimulation();">Start Simulation</a>
<a href="<%=request.getContextPath()%>/sort" style="float: right">Reset</a>
<div id="main"></div>
</body>

<script type="text/javascript">
    $(document).ready(function () {
        getSortedPage({i: 0, j: 1}, "GET");
    });
</script>