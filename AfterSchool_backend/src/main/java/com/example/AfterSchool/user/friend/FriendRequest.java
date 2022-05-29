package com.example.AfterSchool.user.friend;

import com.example.AfterSchool.user.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.jpa.repository.Modifying;

import javax.persistence.*;

import static com.example.AfterSchool.user.friend.RequestType.RECEIVED;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class FriendRequest {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue
    private Long id;
    @ManyToOne
    private User from;
    @ManyToOne
    private User to;

    private boolean accepted;

    private RequestType requestType;

    public void setId(Long id) {
        this.id = id;
    }

    public FriendRequest(User from, User to, RequestType requestType) {
        this.from = from;
        this.to = to;
        if(requestType == RECEIVED){
            accepted = false;
        }

    }

    @Modifying
    public void acceptRequest() {
        accepted = true;

    }
}
