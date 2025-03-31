package hkmu.wadd.dao;

import hkmu.wadd.Model.Lecture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.swing.*;

public interface LectureRepository extends JpaRepository<Lecture, Long> {
}
//Spring Data JPA will automatically implement a set of CRUD methods, e.g., count, exists,
//save, delete, deleteById, deleteAll, findById, findAll, etc.

// Repositories provide the persistence logic, i.e., it is responsible for all logic
//related to saving data to a data store and retrieving saved data from the data store. Typically,
//each repository is responsible for a single entity class. In Spring, we use @Repository to
//define a repository class. Yet when using Spring Data JPA, we only need to define the interface
//and the repository objects will be generated accordingly.


//Spring Data JPA 将自动实现一组 CRUD 方法，例如 count、exists、
//save、delete、deleteById、deleteAll、findById、findAll 等。
//
// 存储库提供持久性逻辑，即它负责与将数据保存到数据存储和从数据存储中检索已保存数据相关的所有逻辑。通常，
//每个存储库负责一个实体类。在 Spring 中，我们使用 @Repository 来
//定义存储库类。然而，当使用 Spring Data JPA 时，我们只需要定义接口
//存储库对象将相应地生成。