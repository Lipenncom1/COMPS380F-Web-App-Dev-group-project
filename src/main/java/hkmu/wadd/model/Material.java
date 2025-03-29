package hkmu.wadd.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "MATERIAL")
public class Material {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "class_num", unique = true, nullable = false)
    private String classNum;

    @Column(name = "file_link", nullable = false)
    private String fileLink;

    @OneToMany(mappedBy = "material", cascade = CascadeType.ALL)
    private List<ClassComment> comments;

    // Constructors, Getters and Setters
    public Material() {}

    // Getters and Setters methods
}