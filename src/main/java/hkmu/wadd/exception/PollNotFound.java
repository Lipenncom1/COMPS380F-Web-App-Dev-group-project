package hkmu.wadd.exception;

public class PollNotFound extends Exception {
    public PollNotFound(long id) {
        super("Poll " + id + " does not exist.");
    }
}