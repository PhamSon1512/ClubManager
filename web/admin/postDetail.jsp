<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../admin/layout/adminhead.jsp"/>
    <head>
        <style>
            .main-content-padding {
                padding-top: 80px; /* Adjust according to the height of your menu */
            }
            .post-title {
                word-wrap: break-word;
                overflow-wrap: break-word;
                hyphens: auto;
            }
            .post-content {
                white-space: pre-wrap; /* Preserve whitespace and line breaks */
                overflow-wrap: break-word; /* Break long words */
                margin-top: 0; /* Remove margin from the top */
            }
        </style>
    </head>
    <script>
        function editComment(commentId, commentContent) {
            document.getElementById('commentContent').value = commentContent; // Set content to textarea
            document.getElementById('commentId').value = commentId; // Set comment ID to hidden input
            document.getElementById('message').textContent = "Comment has been edited."; // Show message
        }
    </script>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../admin/layout/menu.jsp"/>
            <main class="page-content bg-light main-content-padding">
                <jsp:include page="../admin/layout/headmenu.jsp"/>
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-lg-10 col-md-12">
                            <div class="card shadow-sm my-4">
                                <div class="card-body">
                                    <h1 class="card-title mb-3 post-title"><strong>${post.title}</strong></h1>
                                    <p class="text-muted">
                                        <i class="fas fa-calendar-alt me-2"></i>
                                        <em><fmt:formatDate value="${post.createdAt}" pattern="dd MMMM yyyy, HH:mm"/></em>
                                        <span class="ms-3"><i class="fas fa-user me-2"></i><strong>${post.userName}</strong></span>
                                    </p>

                                    <c:if test="${not empty post.thumnailUrl}">
                                        <div class="text-center my-4">
                                            <img src="${post.thumnailUrl}" class="img-fluid rounded" alt="Post Image" style="max-width: 100%; height: auto;">
                                        </div>
                                    </c:if>

                                    <div class="post-content mt-4">${post.content}</div>

                                    <div class="mt-4">
                                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editPostModal"><strong>Edit</strong></button>
                                        <a href="post?action=delete&id=${post.postId}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this post?');"><strong>Delete</strong></a>
                                    </div>

                                    <hr class="my-4">

                                    <div class="comments-section">
                                        <h3 class="mb-3"><strong>Comments</strong></h3>
                                        <c:forEach var="comment" items="${comments}">
                                            <div class="comment mb-3 p-3 bg-light rounded">
                                                <p class="mb-1"><strong>${comment.userName}</strong></p>
                                                <p class="mb-2">${comment.content}</p>
                                                <small class="text-muted">
                                                    <em><fmt:formatDate value="${comment.createdAt}" pattern="dd MMM yyyy, HH:mm"/></em>
                                                    <c:if test="${comment.edited}">
                                                        <span class="ms-2 text-info">(Đã chỉnh sửa)</span>
                                                    </c:if>
                                                </small>

                                                <div class="mt-2">
                                                    <a href="javascript:void(0);" onclick="editComment(${comment.commentId}, '${comment.content}')" class="btn btn-sm btn-warning">
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </a>
                                                    <a href="post?action=deleteComment&commentId=${comment.commentId}&postId=${post.postId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this comment?');">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <form action="post?action=createComment" method="post" class="mt-4">
                                            <input type="hidden" name="postId" value="${post.postId}" />
                                            <input type="hidden" name="commentId" id="commentId" value="" /> <!-- Hidden input for comment ID -->
                                            <div class="form-group">
                                                <label for="commentContent"><strong>Add a comment</strong></label>
                                                <textarea id="commentContent" name="content" class="form-control" rows="3" required></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary mt-2"><strong>Submit Comment</strong></button>
                                        </form>
                                    </div>
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
        <script src="https://kit.fontawesome.com/96bf6fe519.js" crossorigin="anonymous"></script>
        <div class="modal fade" id="editPostModal" tabindex="-1" aria-labelledby="editPostModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editPostModalLabel">Chỉnh sửa bài viết</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="post?action=edit" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${post.postId}">
                            <div class="mb-3">
                                <label for="editTitle" class="form-label">Tiêu đề</label>
                                <input type="text" class="form-control" id="editTitle" name="title" value="${post.title}" required>
                            </div>
                            <div class="mb-3">
                                <label for="editContent" class="form-label">Nội dung</label>
                                <textarea class="form-control" id="editContent" name="content" rows="5" required>${post.content}</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="editImage" class="form-label">Ảnh bìa</label>
                                <input type="file" class="form-control" id="editImage" name="image" accept="image/*">
                                <small class="form-text text-muted">Để trống nếu không muốn thay đổi ảnh.</small>
                            </div>
                            <div class="mb-3">
                                <img src="${post.thumnailUrl}" id="currentImage" class="img-fluid rounded" alt="Current Image" style="max-width: 200px;">
                            </div>
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
                                                        document.getElementById('editImage').addEventListener('change', function (e) {
                                                            if (e.target.files && e.target.files[0]) {
                                                                var reader = new FileReader();
                                                                reader.onload = function (e) {
                                                                    document.getElementById('currentImage').setAttribute('src', e.target.result);
                                                                }
                                                                reader.readAsDataURL(e.target.files[0]);
                                                            }
                                                        });
        </script>
    </body>
</html>
