package hkmu.wadd.model;
import jakarta.persistence.*;

@Entity
@Table(name = "POLL_COMMENTS")
public class PollComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "poll_id")
    private Poll poll;

    // 其他字段和方法...
}