<%-- 
    Document   : dashboard
    Created on : June 23, 2024, 10:29:15 PM
    Author     : sodok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="admin/layout/adminhead.jsp"/>
    <body>
        <jsp:include page="layout/preloader.jsp"/>
        <div class="page-wrapper doctris-theme toggled">
            <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#sidebar" aria-expanded="false" aria-controls="sidebar">
                ☰
            </button>
            <jsp:include page="admin/layout/menu.jsp"/>      

            <main class="page-content bg-light">
                <jsp:include page="admin/layout/headmenu.jsp"/>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <h5 class="mb-0">Dashboard</h5>
                        <div class="row">
                            <div class="col-xl-6 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-user h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2"> 
                                            <h5 class="mb-0">${accountCount}</h5>
                                            <p class="text-muted mb-0">Account</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-users-alt h3 mb-0"></i>
                                        </div>  
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${clubCount}</h5>
                                            <p class="text-muted mb-0">Clubs</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-4 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-apps h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${blogCount}</h5>
                                            <p class="text-muted mb-0">Blogs</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-4 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-calendar-alt h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0"></h5>
                                            <p class="text-muted mb-0">Events</p>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="col-xl-4 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-envelope h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${appointment}</h5>
                                            <p class="text-muted mb-0">Club Register</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xl-12 col-lg-12 mt-4">
                                <div class="card shadow border-0 p-4">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h6 class="align-items-center mb-0">Statistics of new events</h6>
                                        <div class="mb-0 position-relative">
                                            <select onchange="Astatistic(this.value)" class="form-select form-control" id="yearchart">
                                                <option <c:if test="${sessionScope.atype == '3day'}"> selected </c:if> value="3day">Last 3 days</option>
                                                <option <c:if test="${sessionScope.atype == '7day'}"> selected </c:if> value="7day">Last 7 days</option>
                                                <option <c:if test="${sessionScope.atype == '14day'}"> selected </c:if> value="14day">Last 14 days</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="dashboard" class="apex-chart"></div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <jsp:include page="admin/layout/footer.jsp"/>
            </main>
        </div>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/simplebar.min.js"></script>
        <script src="assets/js/apexcharts.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script>
                                                    var options1 = {
                                                        series: [{
                                                                name: 'Appointment',
                                                                data: [<c:forEach items="${appointment7day}" var="a">${a.count},</c:forEach>]
                                                            }, {
                                                                name: 'Reservation',
                                                                data: [<c:forEach items="${reservation7day}" var="r">${r.count},</c:forEach>]
                                                            }],
                                                        chart: {
                                                            type: 'bar',
                                                            height: 350,
                                                            stacked: true,
                                                            toolbar: {
                                                                show: true
                                                            },
                                                            zoom: {
                                                                enabled: true
                                                            }
                                                        },
                                                        responsive: [{
                                                                breakpoint: 480,
                                                                options: {
                                                                    legend: {
                                                                        position: 'bottom',
                                                                        offsetX: -10,
                                                                        offsetY: 0
                                                                    }
                                                                }
                                                            }],
                                                        plotOptions: {
                                                            bar: {
                                                                horizontal: false,
                                                                borderRadius: 10
                                                            },
                                                        },
                                                        xaxis: {
                                                            type: 'text',
                                                                    categories: [<c:forEach items="${appointment7day}" var="a">'<fmt:formatDate pattern="dd/MM/yyyy" value="${a.date}"/>',</c:forEach>
                                                                    ],
                                                        },
                                                        legend: {
                                                            position: 'right',
                                                            offsetY: 40
                                                        },
                                                        fill: {
                                                            opacity: 1
                                                        }
                                                    };
                                                    var chart1 = new ApexCharts(document.querySelector("#dashboard"), options1);
                                                    chart1.render();
            </script>

            <script type="text/javascript">
                function Astatistic(type) {
                    window.location.href = "dashboard?action=statistic&atype=" + type + "&rtype=${sessionScope.rtype}";
                }
        </script>

        <script type="text/javascript">
            function Rstatistic(type) {
                window.location.href = "dashboard?action=statistic&rtype=" + type + "&atype=${sessionScope.atype}";
            }
        </script>

        <script>
            var options2 = {
                series: [${Revenueappointment}, ${Revenuereservation}],
                chart: {
                    width: 450,
                    type: 'pie',
                },

                labels: ['Appointment', 'Reservation'],
                responsive: [{
                        breakpoint: 600,
                        options: {
                            chart: {
                                width: 500
                            },
                            legend: {
                                position: 'bottom'
                            },
                        }
                    }]
            };
            var chart2 = new ApexCharts(document.querySelector("#department"), options2);
            chart2.render();
        </script>
    </body>

</html>
