<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../admin/layout/adminhead.jsp"/>
    <head>
        <style>
            .card {
                height: 300px; /* Set a fixed height for the card */
                overflow: hidden; /* Hide any overflow */
            }

            .card img {
                height: 100%; /* Make the image take the full height of the card */
                object-fit: cover; /* Ensure the image covers the area without distortion */
            }

            .card-text {
                max-height: 150px; /* Adjust this as needed */
                overflow: hidden; /* Hide overflowing content */
                white-space: pre-wrap; /* Preserve whitespace and line breaks */
                overflow-wrap: break-word; /* Break long words */
            }

            .read-more {
                cursor: pointer;
                color: blue;
            }

            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../admin/layout/menu.jsp"/>
            <main class="page-content bg-light">
                <jsp:include page="../admin/layout/headmenu.jsp"/>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <!-- New Post Button -->
                        <div class="row mb-4">
                            <div class="col-12">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newPostModal">
                                    Đăng bài mới
                                </button>
                            </div>
                        </div>
                      

                        <!-- Modal for New Post Form -->
                        <div class="modal fade" id="newPostModal" tabindex="-1" aria-labelledby="newPostModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="newPostModalLabel">Đăng bài mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="post?action=create" method="POST" enctype="multipart/form-data">
                                            <div class="mb-3">
                                                <input type="text" class="form-control" name="title" placeholder="Tiêu đề bài viết" value="${param.title}" required>
                                                <c:if test="${not empty titleError}">
                                                    <div class="error">${titleError}</div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <textarea class="form-control" name="content" rows="3" placeholder="Bạn đang nghĩ gì?" required>${param.content}</textarea>
                                                <c:if test="${not empty contentError}">
                                                    <div class="error">${contentError}</div>
                                                </c:if>
                                            </div>
                                            <div class="mb-3">
                                                <input type="file" class="form-control" name="image" accept="image/*">
                                            </div>
                                            <input type="hidden" name="author_id" value="${currentUserId}">
                                            <button type="submit" class="btn btn-primary">Đăng bài</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Existing Posts -->
                        <div class="row">
                            <div class="col-12">
                                <h5 class="mb-3">Bài viết gần đây</h5>
                            </div>
                            <c:forEach var="post" items="${posts}">
                                <div class="col-12 mb-4 post">
                                    <a href="post?action=view&id=${post.postId}" class="card text-decoration-none">
                                        <div class="row g-0">
                                            <div class="col-md-4">
                                                <c:if test="${not empty post.thumnailUrl}">
                                                    <img src="${post.thumnailUrl}" class="img-fluid rounded-start" alt="Post Image">
                                                </c:if>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <h5 class="card-title">${post.title}</h5>
                                                    <small class="text-muted">
                                                        <fmt:formatDate value="${post.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                                    </small>
                                                    <pre class="card-text" style="color: black;">${post.content}</pre> <!-- Initially collapsed -->
                                                    <span class="read-more">Read More</span> <!-- Read More link -->
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Pagination Controls -->
                        <div class="row text-center">
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="page-item ${i==page?"active":""}">
                                                <a class="page-link" href="post?action=list&page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <jsp:include page="../admin/layout/footer.jsp"/>
            </main>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/app.js"></script>

    </body>
</html>
