package hkmu.wadd.dao;

import hkmu.wadd.Model.Poll;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PollRepository extends JpaRepository<Poll, Long> {
}