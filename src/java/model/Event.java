/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FANCY
 */
public class Event {
       private int eventId;
    private int ClubId;
    private int UserId;
    private String title;
    private String content;
    private String thumbnailUrl;
    private String startDate;
    private String endDate;
    private String clubName;

    public Event(int eventId, int ClubId, int UserId, String title, String content, String thumbnailUrl, String startDate, String endDate, String clubName) {
        this.eventId = eventId;
        this.ClubId = ClubId;
        this.UserId = UserId;
        this.title = title;
        this.content = content;
        this.thumbnailUrl = thumbnailUrl;
        this.startDate = startDate;
        this.endDate = endDate;
        this.clubName = clubName;
    }

    

    public Event() {
       
    }

    public int getClubId() {
        return ClubId;
    }

    public void setClubId(int ClubId) {
        this.ClubId = ClubId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int UserId) {
        this.UserId = UserId;
    }

    
    
    
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    
    
    
    
}
