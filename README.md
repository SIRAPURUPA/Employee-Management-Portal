# Employee Management Portal

The **Employee Management Portal** is a Java-based web application built using Servlets, JSP, and MySQL.  
It provides secure authentication for Admins and Employees, allows employee management, report handling, and enables clean role-based workflows for organizations.

---

## 📁 Project Structure

This README file follows the **exact folder structure** of your Eclipse project:
```bash
Employee-Management-Portal/
│
├── JRE System Library [JavaSE-17]
├── Server Runtime [Apache Tomcat v9.0]
├── Web App Libraries
│
├── src/main/java/
│ ├── com.dataBase/
│ └── com.empManagement/
│ (Contains Servlets, Models, DAO classes & Utilities)
│
├── src/
│ └── main/
│ ├── java/
│ └── webapp/
│ ├── META-INF/
│ ├── WEB-INF/
│ │ └── web.xml
│ │
│ ├── add_employee.jsp
│ ├── admin_dashboard.jsp
│ ├── admin_login.jsp
│ ├── admin_navbar.jsp
│ ├── admin_signup.jsp
│ ├── admin_view_reports.jsp
│ ├── edit_employee.jsp
│ ├── emp_add_report.jsp
│ ├── emp_dashboard.jsp
│ ├── emp_edit_report.jsp
│ ├── emp_profile.jsp
│ ├── emp_view_reports.jsp
│ ├── employee_login.jsp
│ ├── employee_navbar.jsp
│ └── view_employees.jsp
│
└── build/
```

---

## ✨ Features

### 🔐 Authentication
- Admin login  
- Employee login  
- Role-based redirection  
- Secure session handling  

### 👨‍💼 Admin Features
- Add new employees  
- Edit employee information  
- Delete employees  
- View all employees  
- View reports submitted by employees  
- Admin signup and profile management  

### 👨‍🔧 Employee Features
- Employee dashboard  
- Update personal profile  
- Submit new reports  
- Edit submitted reports  
- View personal reports  

### 📊 Reports Management
- Employees submit work-related reports  
- Admins can read and manage these reports  
- Editable report entries for corrections  

---

## 🛠️ Tech Stack

### Frontend
- HTML5  
- CSS3  
- JavaScript  
- JSP  

### Backend
- Java  
- Servlets  
- JDBC  

### Database
- MySQL  

### Server
- Apache Tomcat 9.0

---

## ⚙️ Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/Employee-Management-Portal.git
```
### 2. Import the Project into Eclipse

Go to File → Import → Existing Java Project

Select the project folder

Ensure JDK 17 and Tomcat 9.0 are configured

### 3. Configure MySQL Database

Open MySQL

Create a database:

CREATE DATABASE employee_portal;


Import your project's SQL schema (if provided)

Open your DB connection file (inside com.dataBase)

Update:

Database URL

Username

Password

### 4. Configure Apache Tomcat

Add Tomcat v9.0 to Eclipse

Right-click the server → Add/Remove → Add project

Start the server

### 5. Run the Application

Open your browser and visit:

http://localhost:8080/Employee-Management-Portal/

### 🧪 Testing the Workflow
#### Admin

Admin logs in

Accesses dashboard

Adds/edits/deletes employees

Views employee reports

#### Employee

Logs in

Views dashboard

Updates profile

Submits and edits reports

### 📸 Screenshots

#### Login Page
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/4e6fe487-5992-4b9c-a06d-cb13209b23ad" />
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/26d0a719-da0b-4524-ab20-2786a6186c7f" />

#### Admin Dashboard
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/83ca1c9d-e644-4f1c-b9e3-9ddc490ce91a" />

#### Employee Dashboard
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/effbe64d-bfd6-4101-9893-3eef8c6c2bd5" />

#### Add Employee
<img width="1918" height="1079" alt="image" src="https://github.com/user-attachments/assets/088b5d38-7a5a-4b8f-87be-aa3d2bcc8cee" />

#### View Employees
<img width="1913" height="1079" alt="image" src="https://github.com/user-attachments/assets/166581ac-a6c2-404f-b5df-1fdeb99ce531" />

#### Report Submission Page
<img width="1912" height="1079" alt="image" src="https://github.com/user-attachments/assets/0aaa9414-1a37-4748-9f74-bffab91619aa" />

#### View Reports in Employee Module
<img width="1918" height="1079" alt="image" src="https://github.com/user-attachments/assets/e26abbea-d537-4846-80f7-1036e010ea1b" />

#### View Reports in Admin Module
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/b0a6e096-125e-4a6c-b480-25a5597e0865" />


### 🧩 Future Enhancements (Optional)

1. Password reset via email

2. File attachment for reports

3. Analytics dashboard

4. Dark mode UI

---

## 🧪 API Testing (Postman)

The Employee Management Portal includes multiple backend APIs built using **Java Servlets**.  
All APIs were thoroughly tested using **Postman** to ensure correct request handling, validation, and responses.

### ✔ What Was Tested?
- Admin login API  
- Employee login API  
- Add employee API  
- Update employee details  
- Delete employee  
- Add report API  
- Update report API  
- Fetch all employees  
- Fetch employee reports  

### 🧵 API Request/Response Format


## Admin Login

**Endpoint:** `POST /adminLogin`

**Request Body:**
```json
{
  "email": "admin@gmail.com",
  "password": "admin123"
}
```
**Successful Response:**
```
json
{
  "status": "success",
  "message": "Admin authenticated successfully"
}
```
## Add Employee API
**Endpoint:** POST /addEmployee

**Request Body:**

```json
{
  "name": "John Doe",
  "email": "john@company.com",
  "department": "Development",
  "salary": 45000
}
```
**Successful Response:**

```json
{
  "status": "success",
  "message": "Employee added successfully"
}
```

## Postman Collection

A complete Postman collection was created for easier testing, which includes:

1. Authentication APIs
2. Employee CRUD operations
3. Report APIs
4. Admin operations

You can import the collection into Postman for quick testing.

## API Testing Results

✔ All API endpoints returned correct responses

✔ Backend validations passed

✔ Unauthorized access attempts handled correctly

✔ Error responses verified

✔ Database operations confirmed

## Postman testing ensured that:

✔ All APIs work independently

✔ All endpoints follow the correct HTTP methods

✔ JSON input/output is consistent

✔ Database insert/update/delete operations work correctly
