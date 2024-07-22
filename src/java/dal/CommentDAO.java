package dal;

import context.DBContext;
import model.Comment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CommentDAO extends DBContext {

    public void insertComment(int postId, int authorId, String content) {
        String sql = "INSERT INTO comment (post_id, user_id, content, created_at, is_edited) VALUES (?, ?, ?, ?, 0)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            stmt.setInt(2, authorId);
            stmt.setString(3, content);
            stmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, "Error inserting comment", ex);
        }
    }

    public Comment getCommentById(int commentId) {
        Comment comment = null;
        String sql = "SELECT c.comment_id, c.post_id, c.user_id, c.content, c.created_at, c.is_edited, u.user_name "
                + "FROM comment c "
                + "JOIN [user] u ON c.user_id = u.user_id "
                + "WHERE c.comment_id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, commentId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    comment = new Comment();
                    comment.setCommentId(rs.getInt("comment_id"));
                    comment.setPostId(rs.getInt("post_id"));
                    comment.setAuthorId(rs.getInt("user_id"));
                    comment.setContent(rs.getString("content"));
                    comment.setCreatedAt(rs.getTimestamp("created_at"));
                    comment.setEdited(rs.getBoolean("is_edited"));
                    comment.setUserName(rs.getString("user_name"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, "Error retrieving comment", ex);
        }
        return comment;
    }

    public List<Comment> getCommentsByPostId(int postId) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT c.comment_id, c.post_id, c.user_id, c.content, c.created_at, c.is_edited, u.user_name "
                + "FROM comment c "
                + "JOIN [user] u ON c.user_id = u.user_id "
                + "WHERE c.post_id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment comment = new Comment();
                    comment.setCommentId(rs.getInt("comment_id"));
                    comment.setPostId(rs.getInt("post_id"));
                    comment.setAuthorId(rs.getInt("user_id"));
                    comment.setContent(rs.getString("content"));
                    comment.setCreatedAt(rs.getTimestamp("created_at"));
                    comment.setEdited(rs.getBoolean("is_edited"));
                    comment.setUserName(rs.getString("user_name"));
                    comments.add(comment);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, "Error retrieving comments", ex);
        }
        return comments;
    }

    public void updateComment(int commentId, String content) {
        String sql = "UPDATE comment SET content = ?, is_edited = 1 WHERE comment_id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, content);
            stmt.setInt(2, commentId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, "Error updating comment", ex);
        }
    }

    public void deleteComment(int commentId) {
        String sql = "DELETE FROM comment WHERE comment_id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, commentId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, "Error deleting comment", ex);
        }
    }

    public static void main(String[] args) {
        CommentDAO dao = new CommentDAO();
        
    }
}