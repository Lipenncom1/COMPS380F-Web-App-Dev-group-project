package hkmu.wadd.dao;

import hkmu.wadd.Model.Poll;
import hkmu.wadd.Model.PollComment;
import hkmu.wadd.Model.UserVote;
import hkmu.wadd.exception.PollNotFound;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class PollService {

    @Resource
    private PollRepository pollRepository;

    @Resource
    private UserVoteRepository userVoteRepository;

    @Resource
    private AuthenticationService authenticationService;

    @Transactional
    public List<Poll> getPolls() {
        return pollRepository.findAll();
    }

    @Transactional
    public Poll getPoll(long id) throws PollNotFound {
        Poll poll = pollRepository.findById(id).orElse(null);
        if (poll == null) {
            throw new PollNotFound(id);
        }
        return poll;
    }

    @Transactional
    public List<UserVote> getAllVotesByPollId(long pollId) {
        return userVoteRepository.findByPollId(pollId);
    }

    @Transactional
    public long addPoll(String question, String optionA, String optionB, String optionC, String optionD) {
        Poll poll = new Poll();
        poll.setQuestion(question);
        poll.setOptionA(optionA);
        poll.setOptionB(optionB);
        poll.setOptionC(optionC);
        poll.setOptionD(optionD);
        poll.setCountA(0);
        poll.setCountB(0);
        poll.setCountC(0);
        poll.setCountD(0);

        Poll savedPoll = pollRepository.save(poll);
        return savedPoll.getId();
    }

    @Transactional
    public void updatePoll(long id, String question, String optionA, String optionB, String optionC, String optionD)
            throws PollNotFound {
        Poll poll = pollRepository.findById(id).orElse(null);
        if (poll == null) {
            throw new PollNotFound(id);
        }

        poll.setQuestion(question);
        poll.setOptionA(optionA);
        poll.setOptionB(optionB);
        poll.setOptionC(optionC);
        poll.setOptionD(optionD);

        pollRepository.save(poll);
    }

    @Transactional
    public void delete(long id) throws PollNotFound {
        Poll poll = pollRepository.findById(id).orElse(null);
        if (poll == null) {
            throw new PollNotFound(id);
        }
        userVoteRepository.deleteByPollId(id);
        pollRepository.delete(poll);
    }

    @Transactional
    public void vote(long id, String option) throws PollNotFound {
        Poll poll = pollRepository.findById(id).orElse(null);
        if (poll == null) {
            throw new PollNotFound(id);
        }

        String username = authenticationService.getCurrentUsername();
        UserVote existingVote = userVoteRepository.findByUsernameAndPollId(username, id).orElse(null);

        if (existingVote != null) {
            String previousOption = existingVote.getVoteOption();
            switch (previousOption) {
                case "A": poll.setCountA(poll.getCountA() - 1); break;
                case "B": poll.setCountB(poll.getCountB() - 1); break;
                case "C": poll.setCountC(poll.getCountC() - 1); break;
                case "D": poll.setCountD(poll.getCountD() - 1); break;
            }
            existingVote.setVoteOption(option);
        } else {
            existingVote = new UserVote();
            existingVote.setUsername(username);
            existingVote.setPollId(id);
            existingVote.setVoteOption(option);
        }

        switch (option) {
            case "A": poll.setCountA(poll.getCountA() + 1); break;
            case "B": poll.setCountB(poll.getCountB() + 1); break;
            case "C": poll.setCountC(poll.getCountC() + 1); break;
            case "D": poll.setCountD(poll.getCountD() + 1); break;
        }

        pollRepository.save(poll);
        userVoteRepository.save(existingVote);
    }

    public String getUserVote(long pollId) {
        String username = authenticationService.getCurrentUsername();
        return userVoteRepository.findByUsernameAndPollId(username, pollId)
                .map(UserVote::getVoteOption)
                .orElse(null);
    }

    @Resource
    private PollCommentRepository pollCommentRepository;

    @Transactional
    public List<PollComment> getCommentsByPollId(long pollId) {
        return pollCommentRepository.findByPollId(pollId);
    }

    @Transactional
    public void addComment(long pollId, String username, String commentText) {
        PollComment comment = new PollComment();
        comment.setPollId(pollId);
        comment.setUsername(username);
        comment.setCommentText(commentText);
        comment.setCreatedAt(java.time.LocalDateTime.now().toString());
        pollCommentRepository.save(comment);
    }


    @Transactional
    public void deleteComment(long commentId) {
        pollCommentRepository.deleteById(commentId);
    }

    @Transactional
    public List<PollComment> getAllPollComments() {

        System.out.println("Poll Comments: " + pollCommentRepository.findAll());

        return pollCommentRepository.findAll();
    }

    @Transactional
    public List<PollComment> getPollCommentsByUsername(String username) {
        return pollCommentRepository.findByUsername(username);
    }

    @Transactional
    public List<UserVote> getVotesByUsername(String username) {
        return userVoteRepository.findByUsername(username);
    }

    @Transactional
    public Map<Long, Poll> getPollsByIds(Set<Long> pollIds) {
        return pollRepository.findAllById(pollIds).stream()
                .collect(Collectors.toMap(Poll::getId, Function.identity()));
    }
}