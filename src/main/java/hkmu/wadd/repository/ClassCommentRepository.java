package hkmu.wadd.repository;

import hkmu.wadd.model.ClassComment;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ClassCommentRepository extends JpaRepository<ClassComment, Long> {
    List<ClassComment> findByMaterialClassNumOrderByCreatedAtDesc(String classNum);
    List<ClassComment> findByUserIdOrderByCreatedAtDesc(Long userId);
}