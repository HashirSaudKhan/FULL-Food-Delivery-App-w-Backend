# Flutter Food App with Backend

---

## 1. Introduction
This document details the development of a food delivery app built using Flutter, Firebase, MongoDB, and Express.js. The app idea is somewhat similar to Foodpanda, aiming to provide a seamless food ordering experience. However, our Unique Selling Point (USP) is charging a lower margin of 10-15% per order compared to Foodpanda's 20-30% commission, making it more appealing to restaurants and users alike.

---

## 2. App Overview
The app allows users to browse restaurants, view food items, place orders, and track them in real-time. The process includes:

- **User Authentication:** Login/Signup via Firebase.
- **Menu Display:** Data fetched using Express.js APIs from MongoDB Atlas.
- **Order Placement:** Firebase Firestore.

### App Workflow
1. User logs in using Firebase authentication.
2. Retrieves restaurant data via Express.js GET APIs.
3. Places a menu item (e.g., burgers, salads) via POST API calls to MongoDB Atlas.
4. Order slips are generated in Firebase Firestore.

---

## 3. Frontend Overview
The app’s user interface is designed in Flutter, providing a user-friendly experience. Key features include:

- Login/Sign up screens.
- Restaurant and menu listings.
- Add orders through the cart page and select add-ons for orders.

### Design Reference
- [Figma Design](https://www.figma.com/design/r1wqyfpO49fmUQijgzgEKx/Full-Food-Delivery-App?t=khXdIm4xdgyxOfLf-1)

#### Light Mode
![Full Food Delivery App](https://github.com/user-attachments/assets/560592da-c074-49c7-8db7-fac136137a11)


#### Dark Mode
![Full Food Delivery App dark mode](https://github.com/user-attachments/assets/94757e04-3bca-42ec-a2f0-14e850f8d4bf)


---

## 4. Backend Architecture

### 4.1 Firebase Authentication
Firebase is used to manage user authentication securely. It supports email and password-based login, ensuring data security.

**Implementation Highlights:**
- Simple integration with Flutter.
- Real-time user authentication updates.

![auth users pics](https://github.com/user-attachments/assets/c681a440-8ce2-44d7-aa38-0a641ca66e6b)


### 4.2 Database for Menu Listing: MongoDB Atlas
MongoDB serves as the database for storing menu lists (e.g., burgers, salads, desserts, drinks, sides).

![mongodb atlas ](https://github.com/user-attachments/assets/316c1251-f986-4c21-bab5-49921bc1a1cb)


### 4.3 Database for Slip Generation: Firestore
Firebase Firestore is used to generate order slips and store order data.

![slip generation firestore](https://github.com/user-attachments/assets/2a10cc6b-ad58-4c34-b5aa-b18c63a6be91)


### 4.4 API Development (Express.js)
APIs built with Express.js handle data exchange between the app and the backend.
---
![api pic](https://github.com/user-attachments/assets/2f94cef8-92db-4209-a405-b9d3b2d87506)

## 5. System Flow
This section details the interaction between various components:

1. **Authentication:** User logs in using Firebase.
2. **Data Retrieval:** Express.js APIs fetch restaurant/menu data from MongoDB Atlas.
3. **Order Placement:** Order data is sent to firestore.

---


## Appendix

### Video Demonstration
[Video Link](https://drive.google.com/file/d/133Of9olV4jR2Fj5fn5GI8b6MSDA9FnJz/view?usp=sharing)
