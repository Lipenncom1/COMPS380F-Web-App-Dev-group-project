package hkmu.wadd.dao;

import hkmu.wadd.Model.UserVote;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserVoteRepository extends JpaRepository<UserVote, Long> {
    Optional<UserVote> findByUsernameAndPollId(String username, long pollId);
    List<UserVote> findByPollId(long pollId);
    void deleteByPollId(long pollId);

}