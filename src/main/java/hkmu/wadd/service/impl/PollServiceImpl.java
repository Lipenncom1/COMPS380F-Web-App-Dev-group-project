//package hkmu.wadd.service.impl;
//
//import hkmu.wadd.model.*;
//import hkmu.wadd.repository.*;
//import hkmu.wadd.service.PollService;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.List;
//
//@Service
//@Transactional
//public class PollServiceImpl implements PollService {
//    private final PollRepository pollRepository;
//    private final PollOptionRepository optionRepository;
//    private final UserVoteRepository voteRepository;
//    private final UserRepository userRepository;
//
//    public PollServiceImpl(PollRepository pollRepository,
//                           PollOptionRepository optionRepository,
//                           UserVoteRepository voteRepository,
//                           UserRepository userRepository) {
//        this.pollRepository = pollRepository;
//        this.optionRepository = optionRepository;
//        this.voteRepository = voteRepository;
//        this.userRepository = userRepository;
//    }
//
//    @Override
//    public Poll createPoll(Poll poll, List<String> options) {
//        if (options.size() != 4) {
//            throw new IllegalArgumentException("Poll must have exactly 4 options");
//        }
//
//        Poll savedPoll = pollRepository.save(poll);
//
//        List<PollOption> pollOptions = new ArrayList<>();
//        for (String optionText : options) {
//            PollOption option = new PollOption();
//            option.setPoll(savedPoll);
//            option.setOptionText(optionText);
//            option.setVoteCount(0);
//            pollOptions.add(option);
//        }
//
//        optionRepository.saveAll(pollOptions);
//        savedPoll.setOptions(pollOptions);
//
//        return savedPoll;
//    }
//
//    @Override
//    public Poll getPoll(Long id) {
//        return pollRepository.findById(id)
//                .orElseThrow(() -> new RuntimeException("Poll not found"));
//    }
//
//    @Override
//    public List<Poll> getAllPolls() {
//        return pollRepository.findAll();
//    }
//
//    @Override
//    public void deletePoll(Long id) {
//        pollRepository.deleteById(id);
//    }
//
//    @Override
//    @Transactional
//    public UserVote vote(Long userId, Long pollId, Long optionId) {
//        UserInfo user = userRepository.findById(userId)
//                .orElseThrow(() -> new RuntimeException("User not found"));
//
//        Poll poll = pollRepository.findById(pollId)
//                .orElseThrow(() -> new RuntimeException("Poll not found"));
//
//        PollOption option = optionRepository.findById(optionId)
//                .orElseThrow(() -> new RuntimeException("Option not found"));
//
//        // Check if user has already voted
//        if (voteRepository.findByUserIdAndPollId(userId, pollId).isPresent()) {
//            throw new RuntimeException("User has already voted in this poll");
//        }
//
//        UserVote vote = new UserVote();
//        vote.setUser(user);
//        vote.setPoll(poll);
//        vote.setOption(option);
//        vote.setVotedAt(LocalDateTime.now());
//
//        // Increment vote count
//        option.setVoteCount(option.getVoteCount() + 1);
//        optionRepository.save(option);
//
//        return voteRepository.save(vote);
//    }
//
//    @Override
//    @Transactional
//    public UserVote updateVote(Long userId, Long pollId, Long newOptionId) {
//        UserVote existingVote = voteRepository.findByUserIdAndPollId(userId, pollId)
//                .orElseThrow(() -> new RuntimeException("No existing vote found"));
//
//        PollOption oldOption = existingVote.getOption();
//        PollOption newOption = optionRepository.findById(newOptionId)
//                .orElseThrow(() -> new RuntimeException("Option not found"));
//
//        // Update vote counts
//        oldOption.setVoteCount(oldOption.getVoteCount() - 1);
//        newOption.setVoteCount(newOption.getVoteCount() + 1);
//
//        optionRepository.save(oldOption);
//        optionRepository.save(newOption);
//
//        // Update user's vote
//        existingVote.setOption(newOption);
//        existingVote.setVotedAt(LocalDateTime.now());
//
//        return voteRepository.save(existingVote);
//    }
//
//    @Override
//    public List<UserVote> getUserVotingHistory(Long userId) {
//        return voteRepository.findByUserId(userId);
//    }
//}