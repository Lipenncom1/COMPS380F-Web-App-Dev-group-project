package hkmu.wadd.dao;

import hkmu.wadd.Model.LectureComments;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LectureCommentsRepository extends JpaRepository<LectureComments, Long>{
    List<LectureComments> findByLectureIdOrderByCreatedAtDesc(Long lectureId);
    void deleteByIdAndLectureId(Long commentId, Long lectureId);
}
