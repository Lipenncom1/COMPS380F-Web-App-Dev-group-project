package hkmu.wadd.repository;

import hkmu.wadd.model.Material;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MaterialRepository extends JpaRepository<Material, Long> {
    Material findByClassNum(String classNum);
}