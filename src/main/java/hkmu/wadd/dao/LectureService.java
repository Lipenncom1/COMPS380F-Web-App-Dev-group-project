package hkmu.wadd.dao;

//Service layer: Services encapsulate the business logic of the application and consume other
//services and repositories but do not consume resources in higher application layers like
//controllers. In Spring, services are annotated with @Service. From a transactional point of
//view, the execution of a service method from a higher layer (such as a controller) can be
//thought of as a transactional unit of work. A service may perform several operations on
//multiple repositories.

import jakarta.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import hkmu.wadd.Model.Attachment;
import hkmu.wadd.Model.Lecture;
import hkmu.wadd.exception.AttachmentNotFound;
import hkmu.wadd.exception.LectureNotFound;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class LectureService {
    @Resource
    private LectureRepository lectureRepository;

    @Resource
    private AttachmentRepository attachmentRepository;

    @Transactional
    public List<Lecture> getLectures() {
        return lectureRepository.findAll();
    }

    @Transactional
    public Lecture getLecture(long id) throws LectureNotFound {
        Lecture lecture = lectureRepository.findById(id).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(id);
        }
        return lecture;
    }

    @Transactional
    public Attachment getAttachment(long lectureId, UUID attachmentId) throws LectureNotFound, AttachmentNotFound {
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
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
        Lecture deletedLecture = lectureRepository.findById(id).orElse(null);
        if (deletedLecture == null) {
            throw new LectureNotFound(id);
        }
        lectureRepository.delete(deletedLecture);
    }

    @Transactional(rollbackFor = AttachmentNotFound.class)
    public void deleteAttachment(long lectureId, UUID attachmentId) throws LectureNotFound, AttachmentNotFound{
        Lecture lecture = lectureRepository.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        for (Attachment attachment:lecture.getAttachments()) {
            if (attachment.getId().equals(attachmentId)) {
                lecture.deleteAttachment(attachment);
                lectureRepository.save(lecture);
                return;
            }
        }
        throw new AttachmentNotFound(attachmentId);
    }
    @Transactional
    public long addLecture(String lectureTitle, List<MultipartFile> attachments) throws IOException {
        Lecture lecture = new Lecture();
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
        Lecture savedLecture = lectureRepository.save(lecture);
        return savedLecture.getId();
    }
    @Transactional(rollbackFor = LectureNotFound.class)
    public void updateLecture(long id, String lectureTitle, List<MultipartFile> attachments)
            throws IOException, LectureNotFound {
        Lecture updatedLecture = lectureRepository.findById(id).orElse(null);
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
        lectureRepository.save(updatedLecture);
    }
}
