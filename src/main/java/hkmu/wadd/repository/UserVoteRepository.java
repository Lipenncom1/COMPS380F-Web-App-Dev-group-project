package hkmu.wadd.repository;

import hkmu.wadd.model.UserVote;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserVoteRepository extends JpaRepository<UserVote, Long> {
    Optional<UserVote> findByUserIdAndPollId(Long userId, Long pollId);
}