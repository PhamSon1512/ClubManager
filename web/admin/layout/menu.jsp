<%-- 
    Document   : menu
    Created on : June 17, 2024, 3:12:10 PM
    Author     : sodok  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">

        <ul class="sidebar-menu pt-3">
            <c:if test="${sessionScope.account.status == 1}">
                <li><a href="dashboard?action=home"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                <li><a href="setting?action=all"><i class="uil uil-cog me-2 d-inline-block"></i>Setting</a></li>
                <li><a href="account?action=all"><i class="uil uil-user me-2 d-inline-block"></i>Account</a></li>
                <li><a href="doctormanage?action=all"><i class="uil uil-apps me-2 d-inline-block"></i>Blogs</a></li>
                <li><a href="newclub"><i class="uil uil-users-alt me-2 d-inline-block"></i>Clubs</a></li>
                <li><a href="servicemanage?action=all"><i class="uil uil-social-distancing me-2 d-inline-block"></i>Clubs Member</a></li>
                <li><a href="regisclub?action=all"><i class="uil uil-envelope me-2 d-inline-block"></i>Club Register</a></li>
                <li><a href="reservationmanage?action=all"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Event</a></li>
                <li><a href="reservationmanage?action=all"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Admin Contact</a></li>
                </c:if>

            <c:if test="${sessionScope.account.status == 2}">
                <li><a href="dashboard?action=home"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                <li><a href="setting?action=all"><i class="uil uil-cog me-2 d-inline-block"></i>Setting</a></li>
                <li><a href="doctormanage?action=all"><i class="uil uil-apps me-2 d-inline-block"></i>Blogs</a></li>

                <li><a href="clubmanager?club_id=${userClubId}"><i class="uil uil-users-alt me-2 d-inline-block"></i>Clubs</a></li>

                <li><a href="ViewRegistrationsServlet"><i class="uil uil-envelope me-2 d-inline-block"></i>Register Club</a></li>
                <li><a href="reservationmanage?action=all"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Event</a></li>
                <li><a href="reservationmanage?action=all"><i class="uil uil-calendar-alt me-2 d-inline-block"></i>Task</a></li>
            </c:if>

            <c:if test="${sessionScope.user.role.role_id == 0}">
                <li><a href="appointmentmanage?action=all"><i class="uil uil-stethoscope me-2 d-inline-block"></i>Club</a></li>
                <li><a href="reservationmanage?action=all"><i class="uil uil-stethoscope me-2 d-inline-block"></i>Task</a></li>
                <li><a href="reservationmanage?action=all"><i class="uil uil-stethoscope me-2 d-inline-block"></i>Admin Contact</a></li>
                </c:if>
        </ul>
    </div>
</nav>
