package com.example.AfterSchool.registration.email;

public interface EmailSender {
    void send(String to, String email, String link);
}
