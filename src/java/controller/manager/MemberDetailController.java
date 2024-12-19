
package controller.manager;

import dal.ClubDBContext;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Comparator;
import java.util.stream.Collectors;
import model.ClubMember;

public class MemberDetailController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int clubId = (Integer) request.getSession().getAttribute("loggedInClubId");
        request.setAttribute("clubId", clubId);
        
        ClubDBContext clubDBContext = new ClubDBContext();
        List<ClubMember> allClubMembers = clubDBContext.getClubMembersByClubId(clubId);
        
        // Search logic
        String searchQuery = request.getParameter("query");
        List<ClubMember> searchedMembers = allClubMembers;
        if (searchQuery != null && !searchQuery.isEmpty()) {
            searchedMembers = allClubMembers.stream()
                .filter(member -> member.getFullName().toLowerCase().contains(searchQuery.toLowerCase()))
                .collect(Collectors.toList());
        }
        
        // Filter logic
        String specialityFilter = request.getParameter("specialityFilter");
        List<ClubMember> filteredClubMembers = searchedMembers;
        if (specialityFilter != null && !specialityFilter.isEmpty()) {
            int specialityId = Integer.parseInt(specialityFilter);
            filteredClubMembers = searchedMembers.stream()
                    .filter(member -> member.getSpeciality_id() == specialityId)
                    .collect(Collectors.toList());
        }
        
        Collections.sort(filteredClubMembers, Comparator.comparingInt(ClubMember::getSpeciality_id));
        
        request.setAttribute("clubMembers", filteredClubMembers);
        
        // Create a map for speciality_id to position names
        Map<Integer, String> specialityMap = new HashMap<>();
        specialityMap.put(1, "Chủ Nhiệm");
        specialityMap.put(2, "Ban Chuyên Môn");
        specialityMap.put(3, "Ban Văn Hóa");
        specialityMap.put(4, "Ban Truyền Thông");
        specialityMap.put(5, "Ban Hậu Cần");
        specialityMap.put(6, "Ban Nội Dung");
        
        Map<Boolean, String> activeStatusMap = new HashMap<>();
        activeStatusMap.put(true, "Active");
        activeStatusMap.put(false, "InActive");
        
        request.setAttribute("specialityMap", specialityMap);
        request.setAttribute("activeStatusMap", activeStatusMap);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("specialityFilter", specialityFilter);
        
        request.getRequestDispatcher("admin/memberDetail.jsp").forward(request, response);
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
