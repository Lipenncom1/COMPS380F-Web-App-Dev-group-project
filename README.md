## Online Course Website - COMPS380F Web Application Development

# Online Course Website

A full-stack web application for delivering interactive online courses with real-time engagement features. Built with modern Java technologies and a responsive design.

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)
![H2](https://img.shields.io/badge/H2-Database-1?style=for-the-badge&logo=h2&logoColor=white&labelColor=blue&color=gray)

## 🌟 Features

### Core Platform Capabilities
- **Dynamic Course Content** - Interactive lectures with downloadable materials and discussion threads
- **Real-time Polling System** - Multiple-choice polls with live vote tracking and editable responses
- **User Management** - Secure registration and role-based access control
- **Comment System** - Community discussions on both lectures and polls

### User Experience
- **Responsive Design** - Optimized for all devices using Bootstrap
- **Intuitive Navigation** - Clear hierarchy from course overview to detailed content
- **Personal Dashboard** - Individual voting and comment history
- **Profile Management** - Self-service account updates

### Administrative Features
- **Content Management** - Full CRUD operations for lectures, polls, and materials
- **User Administration** - Comprehensive user management system
- **Batch Operations** - Efficient multi-file uploads for course materials
- **Multi-language Support** - Built-in internationalization capabilities

## 🚀 Quick Start

### Prerequisites
- Java JDK 17 or later
- Gradle 7.0+

### Installation & Running

1. **Clone and Setup**
   ```bash
   git clone https://github.com/5itspj/School-Web-Application.git
   ```
   ```
   cd School-Web-Application
   ```
   ```
   ./gradlew clean build
   ```

2. **Run the Application**
   ```bash
   ./gradlew bootRun
   ```

3. **Access the Platform**
   Navigate to: http://localhost:8081/S380Project/

### Default Accounts
**Instructor Account:**
- Username: `stan`
- Password: `stanpw`

- Username: `joe` 
- Password: `joepw`

**Student Account:**
- Username: `peter` 
- Password: `peterpw`

- Username: `tony` 
- Password: `tonypw`

- Username: `thor` 
- Password: `thorpw`
## 🛠️ Technology Stack

**Backend:**
- Spring Boot 3.x with Spring MVC
- Spring Security for authentication & authorization
- Jakarta EE compliant server
- H2 Database Engine

**Frontend:**
- JSP with JSTL and Expression Language
- Bootstrap 5 for responsive UI
- Custom CSS styling

**Development:**
- Gradle Build Tool
- Embedded Tomcat Server
- In-memory H2 database for development

## 💡 Key Functionality

### For Students
- Browse course catalog and access all learning materials
- Participate in interactive polls and view real-time results
- Engage in community discussions through comments
- Manage personal profile and preferences
- Track personal activity history

### For Instructors
- Full course content management (create, edit, delete)
- User administration and role management
- Poll creation and moderation
- Community management and comment moderation
- Bulk file uploads for course materials

### Public Access
- View course overview and available content
- Access registration system
- Browse public course information

## 🗃️ Database Configuration

The application uses H2 database with the following settings:
- **Database URL**: `jdbc:h2:mem:testdb`
- **Console**: http://localhost:8081/S380Project/h2-console
- **Database Name**: `myDB`
- **Username**: `sa`
- **Password**: `password`

Database schema and initial data are automatically initialized on application startup.

## 🎯 API Endpoints

| Method | Endpoint | Description | Access |
|--------|----------|-------------|---------|
| GET | `/` | Course homepage | Public |
| GET | `/lecture/{id}` | Lecture details | Authenticated |
| GET | `/poll/{id}` | Poll page | Authenticated |
| POST | `/comment/add` | Add comment | Authenticated |
| POST | `/poll/vote` | Submit vote | Authenticated |
| GET | `/user/profile` | User profile | Authenticated |
| GET | `/admin/users` | User management | Instructor |
...and more

### Running Tests
```bash
./gradlew test
```

## 📞 Contributors
- ANTHONY JESU ASHOK SAVITHA Maria Dharshini
- KE Yankai
- LI Xilin
- SHAH Pooja Zenit
