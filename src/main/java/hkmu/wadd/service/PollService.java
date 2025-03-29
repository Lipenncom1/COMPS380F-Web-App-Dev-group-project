package hkmu.wadd.service;

import hkmu.wadd.model.Poll;
import hkmu.wadd.model.PollOption;
import hkmu.wadd.model.UserVote;
import java.util.List;

public interface PollService {
    Poll createPoll(Poll poll, List<String> options);
    Poll getPoll(Long id);
    List<Poll> getAllPolls();
    void deletePoll(Long id);
    UserVote vote(Long userId, Long pollId, Long optionId);
    UserVote updateVote(Long userId, Long pollId, Long newOptionId);
    List<UserVote> getUserVotingHistory(Long userId);
}