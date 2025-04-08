package hkmu.wadd.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "poll")
public class Poll {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "question")
    private String question;

    @Column(name = "option_a")
    private String optionA;

    @Column(name = "option_b")
    private String optionB;

    @Column(name = "option_c")
    private String optionC;

    @Column(name = "option_d")
    private String optionD;

    @Column(name = "count_a")
    private int countA;

    @Column(name = "count_b")
    private int countB;

    @Column(name = "count_c")
    private int countC;

    @Column(name = "count_d")
    private int countD;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    public int getCountA() {
        return countA;
    }

    public void setCountA(int countA) {
        this.countA = countA;
    }

    public int getCountB() {
        return countB;
    }

    public void setCountB(int countB) {
        this.countB = countB;
    }

    public int getCountC() {
        return countC;
    }

    public void setCountC(int countC) {
        this.countC = countC;
    }

    public int getCountD() {
        return countD;
    }

    public void setCountD(int countD) {
        this.countD = countD;
    }
} 