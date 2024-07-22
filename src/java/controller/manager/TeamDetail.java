package controller.manager;

import dal.ClubDBContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ClubMember;
import model.Department;

public class TeamDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        if (action != null && action.equals("updateDepartment")) {
            updateDepartment(request, response);
            return;
        }
        
        HttpSession session = request.getSession();
        Integer clubId = (Integer) session.getAttribute("loggedInClubId");
        if (clubId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        request.setAttribute("clubId", clubId);
        ClubDBContext dbContext = new ClubDBContext();
        
        List<ClubMember> clubMembers = dbContext.getClubMembersByClubId(clubId);
        List<Department> departments = dbContext.getDepartmentsByClubId(clubId);
        
        Map<Integer, String> specialityMap = new HashMap<>();
        specialityMap.put(1, "Ban Chủ Nhiệm");
        specialityMap.put(2, "Ban Chuyên Môn");
        specialityMap.put(3, "Ban Văn Hóa");
        specialityMap.put(4, "Ban Truyền Thông");
        specialityMap.put(5, "Ban Hậu Cần");
        specialityMap.put(6, "Ban Nội Dung");
        
        Map<Integer, List<ClubMember>> departmentMembersMap = new HashMap<>();
        for (ClubMember member : clubMembers) {
            int specialityId = member.getSpeciality_id();
            if (!departmentMembersMap.containsKey(specialityId)) {
                departmentMembersMap.put(specialityId, new ArrayList<>());
            }
            departmentMembersMap.get(specialityId).add(member);
        }
        
        Map<Integer, Department> departmentInfoMap = new HashMap<>();
        for (Department dept : departments) {
            departmentInfoMap.put(dept.getSpecialityId(), dept);
        }
        
        request.setAttribute("departmentMembersMap", departmentMembersMap);
        request.setAttribute("specialityMap", specialityMap);
        request.setAttribute("departmentInfoMap", departmentInfoMap);
        
        request.getRequestDispatcher("admin/teamDetail.jsp").forward(request, response);
    }

   private void updateDepartment(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    int specialityId = Integer.parseInt(request.getParameter("specialityId"));
    String description = request.getParameter("description");
    String currentProjects = request.getParameter("currentProjects");
    String regularMeetingSchedule = request.getParameter("regularMeetingSchedule");

    ClubDBContext dbContext = new ClubDBContext();
    
    // Lấy departmentId từ specialityId
    int departmentId = dbContext.getDepartmentIdBySpecialityId(specialityId);
    
    if (departmentId != -1) {
        boolean success = dbContext.updateDepartmentInfo(departmentId, description, currentProjects, regularMeetingSchedule);
        response.setContentType("text/plain");
        response.getWriter().write(success ? "success" : "failure");
    } else {
        response.setContentType("text/plain");
        response.getWriter().write("Department not found");
    }
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}