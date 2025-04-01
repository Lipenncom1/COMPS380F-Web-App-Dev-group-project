package hkmu.wadd.exception;

public class LectureNotFound extends Exception {
    public LectureNotFound(long id) {
        super("Ticket " + id + " does not exist.");
    }
}