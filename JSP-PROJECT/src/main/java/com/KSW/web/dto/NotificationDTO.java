package com.KSW.web.dto;

public class NotificationDTO {
    private int notificationNum;
    private String userId;
    private String notificationTitle;
    private String notificationDetails;
    private String createdAt;
    private String updatedAt;


    public int getNotificationNum() {
        return notificationNum;
    }

    public void setNotificationNum(int notificationNum) {
        this.notificationNum = notificationNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNotificationTitle() {
        return notificationTitle;
    }

    public void setNotificationTitle(String notificationTitle) {
        this.notificationTitle = notificationTitle;
    }

    public String getNotificationDetails() {
        return notificationDetails;
    }

    public void setNotificationDetails(String notificationDetails) {
        this.notificationDetails = notificationDetails;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
