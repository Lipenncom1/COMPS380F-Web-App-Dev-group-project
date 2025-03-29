package hkmu.wadd.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "CLASS_COMMENTS")
public class ClassComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserInfo user;

    @ManyToOne
    @JoinColumn(name = "class_num", nullable = false)
    private Material material;

    @Column(nullable = false)
    private String content;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    // Constructors, Getters and Setters
}