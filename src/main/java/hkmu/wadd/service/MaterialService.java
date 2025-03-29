package hkmu.wadd.service;

import hkmu.wadd.model.Material;
import hkmu.wadd.model.ClassComment;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

public interface MaterialService {
    Material createMaterial(String classNum, MultipartFile file);
    Material getMaterial(String classNum);
    List<Material> getAllMaterials();
    void deleteMaterial(Long id);
    ClassComment addComment(Long userId, String classNum, String content);
    List<ClassComment> getComments(String classNum);
    List<ClassComment> getUserCommentHistory(Long userId);
}