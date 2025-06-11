# Shopping-Cart-Management-System-JSP

# ShoppingCarJSPMiniProject

## Overview

This project is a simple shopping cart web application built using **Java Servlets** and **JSP**. It demonstrates functionalities like user login, product management, cart operations, and order processing. The application uses **JDBC** for database interaction and follows a modular MVC architecture.

---

## Project Structure

### 1. **Java Resources**
   - **`src/main/java`**:
     - **`cn.example.DBConnection`**:  
       - `DBcon.java`: Manages the database connection using JDBC.

     - **`cn.example.modal`** (Models):  
       - `Cart.java`: Represents a shopping cart object.  
       - `Order.java`: Represents an order.  
       - `Product.java`: Represents a product entity.  
       - `User.java`: Represents a user entity.

     - **`cn.example.servlets`** (Controllers):  
       - `CancelOrderServlet.java`: Handles order cancellation.  
       - `CheckOutServlet.java`: Manages the checkout process.  
       - `IncrementDecrement.java`: Handles increasing or decreasing the quantity of items in the cart.  
       - `OrderNowServlet.java`: Processes order placements.  
       - `RemoveFromCartServlet.java`: Removes items from the cart.

     - **`cn.example.UserDao`** (Data Access Objects):  
       - `OrderDao.java`: Handles CRUD operations for orders.  
       - `ProductDao.java`: Handles CRUD operations for products.  
       - `UserDao.java`: Manages user-related database operations.

---

### 2. **Web Content**
   - **`src/main/webapp`**:
     - **Includes**:  
       - `footer.jsp`: Footer layout for the pages.  
       - `header.jsp`: Header layout for the pages.  
       - `navbar.jsp`: Navigation bar.

     - **Main Pages**:  
       - `cart.jsp`: Displays the shopping cart.  
       - `index.jsp`: Homepage displaying product listings.  
       - `login.jsp`: User login page.  
       - `logout.jsp`: Logout functionality.

     - **Other**:  
       - **`META-INF`**: Configuration metadata.  
       - **`product_Images`**: Stores product images.  
       - **`WEB-INF`**: Contains web.xml and other configuration files.

---

## Features

- **User Authentication**: Login and logout functionality.
- **Product Browsing**: Displays product listings with details.
- **Shopping Cart**: Add, remove, increment, or decrement item quantities.
- **Order Management**: Place orders, view, or cancel them.
- **Responsive Layout**: JSP pages with reusable components (header, footer, and navbar).

---

## Setup

### Prerequisites
- Java 8 or higher
- Apache Tomcat Server
- MySQL Database
- IDE: Eclipse/IntelliJ IDEA

### Steps to Run
1. Clone the repository or download the project folder.
2. Set up the database:
   - Import the provided SQL file (if any) to create necessary tables.
   - Update database credentials in `DBcon.java`.
3. Deploy the project:
   - Add the project to your Apache Tomcat server in your IDE.
   - Start the server.
4. Open the application:
   - Access the web application in your browser at `http://localhost:8080/ShoppingCarJSPMiniProject`.

---

## Database Configuration

Update the following in `DBcon.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/your_database_name";
private static final String USER = "your_username";
private static final String PASSWORD = "your_password";
```

---

- Include snapshots of the admin dashboard, car listings, and purchase flow.

- <img src = "output screenshots/c1.png" alt = "1 image"> 
- <img src = "output screenshots/c2.png" alt = "2 image"> 
- <img src = "output screenshots/c3.png" alt = "3 image"> 
- <img src = "output screenshots/c4.png" alt = "4 image"> 


## Author

This project was developed as a learning exercise in **Java Web Development**. Contributions or suggestions are welcome!
