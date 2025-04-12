package hkmu.wadd.dao;

import hkmu.wadd.Model.Index;
import hkmu.wadd.Model.LectureComments;
import hkmu.wadd.exception.LectureCommentsNotFound;
import hkmu.wadd.exception.LectureNotFound;
import jakarta.annotation.Resource;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
@Service
public class LectureCommentsService {

    @Resource
    private LectureCommentsRepository lectureCommentsRepository;
    @Resource
    private IndexRepository indexRepository;//not sure


    @Transactional
    public LectureComments getLectureComments(long lectureId) throws LectureNotFound {
        LectureComments lectureComments = lectureCommentsRepository.findById(lectureId).orElse(null);
        if (lectureComments == null) {
            throw new LectureNotFound(lectureId);
        }
        return lectureComments;
    }

    @Transactional
    public void addComments(long lectureId, String username, String commentText) throws LectureNotFound {
        Index lecture =  indexRepository.findById(lectureId).orElse(null);
        LectureComments comments = new LectureComments();
        comments.setLecture(lecture);
        comments.setUsername(username);
        comments.setCommentText(commentText);
        lectureCommentsRepository.save(comments);
    }

    @Transactional
    public void deleteComment(Long lectureId, Long commentId) throws LectureCommentsNotFound, LectureNotFound {
        if (!lectureCommentsRepository.existsById(commentId)) {
            throw new LectureCommentsNotFound(commentId);
        }
        lectureCommentsRepository.deleteByIdAndLectureId(commentId, lectureId);
    }
    @Transactional
    public List<LectureComments> getAllLectureComments() {
        System.out.println("Lecture Comments: " + lectureCommentsRepository.findAll());
        return lectureCommentsRepository.findAll();
    }

}
