package hkmu.wadd.exception;

public class LectureCommentsNotFound extends RuntimeException {
    public LectureCommentsNotFound(long commentId) {
        super("Comment " + commentId + " does not exist.");
    }
}
