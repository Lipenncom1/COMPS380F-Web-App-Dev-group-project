package hkmu.wadd.Model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.util.UUID;

@Entity
@Table(name = "attachment")
public class Attachment {
    @Id
    @GeneratedValue
    @ColumnDefault("random_uuid()")
    private UUID id;

    @Column(name = "filename")
    private String name;

    @Column(name = "content_type")
    private String mimeContentType;

    @Column(name = "content")
    @Basic(fetch = FetchType.LAZY)
    @Lob
    private byte[] contents;

    @Column(name = "lecture_id", insertable=false, updatable=false)
    private long lectureId;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Index lecture;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMimeContentType() {
        return mimeContentType;
    }

    public void setMimeContentType(String mimeContentType) {
        this.mimeContentType = mimeContentType;
    }

    public byte[] getContents() {
        return contents;
    }

    public void setContents(byte[] contents) {
        this.contents = contents;
    }

    public long getLectureId() {
        return lectureId;
    }

    public void setLectureId(long lectureId) {
        this.lectureId = lectureId;
    }

    public Index getLecture() {
        return lecture;
    }

    public void setLecture(Index lecture) {
        this.lecture = lecture;
    }
}