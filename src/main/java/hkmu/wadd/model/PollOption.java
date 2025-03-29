package hkmu.wadd.model;

import jakarta.persistence.*;

@Entity
@Table(name = "POLL_OPTION")
public class PollOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "poll_id", nullable = false)
    private Poll poll;

    @Column(name = "option_text", nullable = false)
    private String optionText;

    @Column(name = "vote_count")
    private Integer voteCount = 0;

    // Constructors, Getters and Setters
    public PollOption() {}

    // Getters and Setters methods
}