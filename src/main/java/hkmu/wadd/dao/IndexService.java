package hkmu.wadd.dao;

//Service layer: Services encapsulate the business logic of the application and consume other
//services and repositories but do not consume resources in higher application layers like
//controllers. In Spring, services are annotated with @Service. From a transactional point of
//view, the execution of a service method from a higher layer (such as a controller) can be
//thought of as a transactional unit of work. A service may perform several operations on
//multiple repositories.

import hkmu.wadd.Model.Attachment;
import hkmu.wadd.Model.Index;
import hkmu.wadd.Model.IndexUser;
import hkmu.wadd.exception.AttachmentNotFound;
import hkmu.wadd.exception.LectureNotFound;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class IndexService {
    @Resource
    private IndexRepository indexRepository;

    @Resource
    private AttachmentRepository attachmentRepository;
    @Autowired
    private IndexUserRepository indexUserRepository;

    @Transactional
    public List<Index> getLectures() {
        return indexRepository.findAll();
    }

    @Transactional
    public Index getLecture(long id) throws LectureNotFound {
        Index lecture = indexRepository.findById(id).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(id);
        }
        return lecture;
    }

    @Transactional
    public Attachment getAttachment(long lectureId, UUID attachmentId) throws LectureNotFound, AttachmentNotFound {
        Index lecture = indexRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        Attachment attachment = attachmentRepository.findById(attachmentId).orElse(null);
        if (attachment == null) {
            throw new AttachmentNotFound(attachmentId);
        }
        return attachment;
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void delete(long id) throws LectureNotFound{
        Index deletedLecture = indexRepository.findById(id).orElse(null);
        if (deletedLecture == null) {
            throw new LectureNotFound(id);
        }
        indexRepository.delete(deletedLecture);
    }

    @Transactional(rollbackFor = AttachmentNotFound.class)
    public void deleteAttachment(long lectureId, UUID attachmentId) throws LectureNotFound, AttachmentNotFound{
        Index lecture = indexRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        for (Attachment attachment:lecture.getAttachments()) {
            if (attachment.getId().equals(attachmentId)) {
                lecture.deleteAttachment(attachment);
                indexRepository.save(lecture);
                return;
            }
        }
        throw new AttachmentNotFound(attachmentId);
    }
    @Transactional
    public long addLecture(String lectureTitle, List<MultipartFile> attachments) throws IOException {
        Index lecture = new Index();
        lecture.setLectureTitle(lectureTitle);

        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setLecture(lecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                lecture.getAttachments().add(attachment);
            }
        }
        Index savedLecture = indexRepository.save(lecture);
        return savedLecture.getId();
    }
    @Transactional(rollbackFor = LectureNotFound.class)
    public void updateLecture(long id, String lectureTitle, List<MultipartFile> attachments)
            throws IOException, LectureNotFound {
        Index updatedLecture = indexRepository.findById(id).orElse(null);
        if (updatedLecture == null) {
            throw new LectureNotFound(id);
        }
        updatedLecture.setLectureTitle(lectureTitle);
        for (MultipartFile filePart : attachments) {
            Attachment attachment = new Attachment();
            attachment.setName(filePart.getOriginalFilename());
            attachment.setMimeContentType(filePart.getContentType());
            attachment.setContents(filePart.getBytes());
            attachment.setLecture(updatedLecture);
            if (attachment.getName() != null && attachment.getName().length() > 0
                    && attachment.getContents() != null
                    && attachment.getContents().length > 0) {
                updatedLecture.getAttachments().add(attachment);
            }
        }
        indexRepository.save(updatedLecture);
    }

    @Transactional
    public void updateUserProfile(String username, String password,String fullName, String email, String phone){
        IndexUser user = indexUserRepository.findById(username).orElseThrow( () -> new UsernameNotFoundException("User not found"));

        //UPDATE-ABLE FIELDS
        if (password != null) user.setPassword(password);
        if (fullName != null) user.setFullName(fullName);
        if (email != null) user.setEmail(email);
        if (phone != null) user.setPhone(phone);

        indexUserRepository.save(user);
    }
}
