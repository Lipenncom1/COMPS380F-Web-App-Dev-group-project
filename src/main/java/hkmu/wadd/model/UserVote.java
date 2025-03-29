package hkmu.wadd.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "USER_VOTE")
public class UserVote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserInfo user;

    @ManyToOne
    @JoinColumn(name = "poll_id", nullable = false)
    private Poll poll;

    @ManyToOne
    @JoinColumn(name = "option_id", nullable = false)
    private PollOption option;

    @Column(name = "voted_at")
    private LocalDateTime votedAt;

    // Constructors, Getters and Setters
}