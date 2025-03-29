//package hkmu.wadd.service.impl;
//
//import hkmu.wadd.model.*;
//import hkmu.wadd.repository.*;
//import hkmu.wadd.service.MaterialService;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.multipart.MultipartFile;
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.time.LocalDateTime;
//import java.util.List;
//import java.util.UUID;
//
//@Service
//@Transactional
//public class MaterialServiceImpl implements MaterialService {
//    private final MaterialRepository materialRepository;
//    private final ClassCommentRepository commentRepository;
//    private final UserRepository userRepository;
//    private final String uploadDir = "uploads/";
//
//    public MaterialServiceImpl(MaterialRepository materialRepository,
//                               ClassCommentRepository commentRepository,
//                               UserRepository userRepository) {
//        this.materialRepository = materialRepository;
//        this.commentRepository = commentRepository;
//        this.userRepository = userRepository;
//        createUploadDirectory();
//    }
//
//    private void createUploadDirectory() {
//        try {
//            Files.createDirectories(Paths.get(uploadDir));
//        } catch (IOException e) {
//            throw new RuntimeException("Could not create upload directory", e);
//        }
//    }
//
//    @Override
//    public Material createMaterial(String classNum, MultipartFile file) {
//        try {
//            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
//            Path filePath = Paths.get(uploadDir + fileName);
//            Files.write(filePath, file.getBytes());
//
//            Material material = new Material();
//            material.setClassNum(classNum);
//            material.setFileLink(fileName);
//
//            return materialRepository.save(material);
//        } catch (IOException e) {
//            throw new RuntimeException("Failed to store file", e);
//        }
//    }
//
//    @Override
//    public Material getMaterial(String classNum) {
//        return materialRepository.findByClassNum(classNum)
//                .orElseThrow(() -> new RuntimeException("Material not found"));
//    }
//
//    @Override
//    public List<Material> getAllMaterials() {
//        return materialRepository.findAll();
//    }
//
//    @Override
//    public void deleteMaterial(Long id) {
//        Material material = materialRepository.findById(id)
//                .orElseThrow(() -> new RuntimeException("Material not found"));
//
//        try {
//            Files.deleteIfExists(Paths.get(uploadDir + material.getFileLink()));
//        } catch (IOException e) {
//            throw new RuntimeException("Failed to delete file", e);
//        }
//
//        materialRepository.deleteById(id);
//    }
//
//    @Override
//    public ClassComment addComment(Long userId, String classNum, String content) {
//        UserInfo user = userRepository.findById(userId)
//                .orElseThrow(() -> new RuntimeException("User not found"));
//
//        Material material = materialRepository.findByClassNum(classNum)
//                .orElseThrow(() -> new RuntimeException("Material not found"));
//
//        ClassComment comment = new ClassComment();
//        comment.setUser(user);
//        comment.setMaterial(material);
//        comment.setContent(content);
//        comment.setCreatedAt(LocalDateTime.now());
//
//        return commentRepository.save(comment);
//    }
//
//    @Override
//    public List<ClassComment> getComments(String classNum) {
//        return commentRepository.findByMaterialClassNumOrderByCreatedAtDesc(classNum);
//    }
//
//    @Override
//    public List<ClassComment> getUserCommentHistory(Long userId) {
//        return commentRepository.findByUserIdOrderByCreatedAtDesc(userId);
//    }
//}