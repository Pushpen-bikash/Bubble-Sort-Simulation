<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Arrays" %>

<%
    Integer[] array = (Integer[]) request.getAttribute("array");
    int divLeft;
    int pHeight;
    int pleft;
    int iIndex = Integer.parseInt(request.getAttribute("i").toString());
    int jIndex = Integer.parseInt(request.getAttribute("j").toString());
    out.print("<input type='hidden' id='arrayValue' value='" + Arrays.toString(array) + "'/>");

    for (int i = 0; i < array.length; i++) {
        pHeight = array[i] + 70;
        if (i == 0) {
            out.print("<p id='value_" + array[i] + "' style='position:absolute; bottom:" + pHeight + "px; left:360px;'>" + array[i] + "</p>");
            out.print("<div id='" + array[i] + "' style='border:6px solid darkred;height:" + array[i] + "px; position:absolute; bottom:70px; left:360px;'></div>");
            if (iIndex == 0) {
                out.print("<p id='value_index_" + array[i] + "' style='position:absolute; bottom:30px; left:360px'>i</p>");
            }
        } else {
            divLeft = i * 40 + 360;
            pleft = divLeft - 5;

            out.print("<p id='value_" + array[i] + "' style='position:absolute; bottom:" + pHeight + "px; left: " + pleft + "px;'>" + array[i] + "</p>");
            out.print("<div id='" + array[i] + "' style='border:6px solid darkred;height:" + array[i] + "px; position:absolute; bottom:70px; left:" + divLeft + "px;'></div>");
            if (i == iIndex && iIndex<array.length-1) {
                out.print("<p id='value_index_" + array[i] + "' style='position:absolute; bottom:30px; left: " + pleft + "px;'>i</p>");
            }
            if (i == jIndex && iIndex<array.length) {
                out.print("<p id='value_index_" + array[i] + "' style='position:absolute; bottom:5px; left: " + pleft + "px;'>j</p>");
            }
        }
    }
%>