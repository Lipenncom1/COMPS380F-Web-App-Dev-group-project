package hkmu.wadd.dao;

import hkmu.wadd.Model.LectureComments;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LectureCommentsRepository extends JpaRepository<LectureComments, Long>{
    List<LectureComments> findByUsername(String username);
    void deleteByIdAndLectureId(Long commentId, Long lectureId);
}
