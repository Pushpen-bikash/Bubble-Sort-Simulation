package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SortSimulatorController extends HttpServlet {
    public Integer[] array= new Integer[]{ 100,50,300,400,80,180,230,150,90,10 };
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer [] arrayToSort = array;
        String arrayString = request.getParameter("array").substring(1, request.getParameter("array").length()-1);
        String iIndex = request.getParameter("i");
        String jIndex = request.getParameter("j");

        if(!arrayString.isEmpty()){
            String[] arr = arrayString.split(",");
            arrayToSort = new Integer[arr.length];
            for (int i=0; i<arr.length; i++){
                arrayToSort[i] = Integer.parseInt(arr[i]);
            }
        }
        request.setAttribute("array", arrayToSort);
        request.setAttribute("i", iIndex);
        request.setAttribute("j", jIndex);

        request.getRequestDispatcher("/pages/sort.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String iIndex = request.getParameter("i");
        String jIndex = request.getParameter("j");
        request.setAttribute("array", array);
        request.setAttribute("i", iIndex);
        request.setAttribute("j", jIndex);
        request.getRequestDispatcher("/pages/sort.jsp").forward(request, response);
    }
}
