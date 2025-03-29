package hkmu.wadd.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "POLL")
public class Poll {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String question;

    @ManyToOne
    @JoinColumn(name = "created_by", nullable = false)
    private UserInfo createdBy;

    @OneToMany(mappedBy = "poll", cascade = CascadeType.ALL)
    private List<PollOption> options;

    @OneToMany(mappedBy = "poll", cascade = CascadeType.ALL)
    private List<PollComment> comments;

    // Constructors, Getters and Setters
    public Poll() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }

    public UserInfo getCreatedBy() { return createdBy; }
    public void setCreatedBy(UserInfo createdBy) { this.createdBy = createdBy; }

    public List<PollOption> getOptions() { return options; }
    public void setOptions(List<PollOption> options) { this.options = options; }

    public List<PollComment> getComments() { return comments; }
    public void setComments(List<PollComment> comments) { this.comments = comments; }
}