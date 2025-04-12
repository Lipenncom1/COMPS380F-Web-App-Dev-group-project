package hkmu.wadd.dao;

import hkmu.wadd.Model.PollComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
public interface PollCommentRepository extends JpaRepository<PollComment, Long> {
    List<PollComment> findByPollId(long pollId);
    List<PollComment> findByUsername(String username);
}
