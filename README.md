# JointBurger Ordering System

**Youtube Proposal Link :** https://youtu.be/dJep1TAvHks

Mobile Application Development Group Prject

<table><center>
  <tr>
    <th>Full Name</th>
    <th>Matric No</th>
    <th>Tasks</th>
  </tr>
  <tr>
    <td>Muhammad Ilham Hakimi Bin Mohamad Nizam</td>
    <td>1914359</td>
    <td><ol> <li> Write "Introductions" and "Objecticves" 
      <li> Design Login page and Home page</ol>
    </td>
  </tr>
  <tr>
    <td>Amirul Afiq Bin Shahdan</td>
    <td>1916491</td>
    <td><ol> <li> Design the application mock-up and pages description
      <li> Design Select Table page and Select Menu (New Order page)</ol></td>
  </tr>
    <tr>
    <td>Muhammad Akmal Bin Anuar</td>
    <td>1911967</td>
    <td><ol> <li>  Write for the 'Features and Functionalities'
      <li> Design Order Progress page</ol></td>
  </tr>
    <tr>
    <td>Ahmad Ammar Arif Bin Abdul Aziz</td>
    <td>1919933</td>
    <td><ol> <li> Design the application mock-up and pages description
      <li> Design Order Summary (New Order page)</ol></td>
  </tr>
   <tr>
    <td>Muhammad Ersyad Ghifari</td>
    <td>1623143</td>
    <td><ol> <li> Design sequence diagram for the application
      <li> Design Order List page</ol></td>
  </tr>
</table>

<ins>**Introduction**</ins>
  
  <p>The BurgerJoint system is a mobile appliction for automating the ordering management process. This application will be able to help the workflow of waiters or service employees in restaurants. The features that are offered by this application are recording order by tapping, storing order history, calculating total prices, and tracking the progress of the orders. The application include authentication feature to increase the security of the application. </p>
  
<ins>**Objective**</ins>

  This objective of this application is :
  1. To reduce the usage of paper
  2. To prevent any mistakes in orders due to human error
  3. To efficiently get orders from customers

<ins>**Features and Functionalities**</ins>

  This system should have functions and features such as:
  1. Homescreen page that includes buttons that navigates to 'New Order', 'Order History', 'Order Progress' and 'Staff Login' pages.
  2. New Order page that streamlines the process for customer's order creation, showing food catalogs and incorporating the Point-of-Sale system.
  3. Order Progress page that shows the status of the orders in cooking and enables employees to click 'complete' if the orders have done cooking.
  4. Order History page that shows all previously made orders and their details.
  5. Staff Login page that enables the restaurant staffs to login inside the app and see their appropriate tasks and interfaces.

<ins>**Interface**</ins>
  
  <h4>1. Authentication Screen</h4><p align="center">
  <img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide1.JPG" width="230" height="400" />
  <p>When user first enter the application, an authorization page will show up. Only staff who has the legit username and password can log into the ordering system. </p></p>
  
  <h4>2. Home Screen</h4><p align="center">
  <img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide2.JPG" width="230" height="400" />
  <p>This is the main menu of the application. It display the three main function which is "New Order", "Order List", and "Order Progress".  </p></p>
  
  <h4>3.1 New Order - Select Table</h4><p align="center">
  <img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide3.JPG" width="230" height="400" />
  <p>If staff enter the "New Order" page, they will be prompted the number of table that want to order.</p></p>
  
  <h4>3.2 New Order - Input Order from Customer</h4>
   <table align="center">
  <tr>
    <td><img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide4.JPG" width=270 height=480></td>
    <td><img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide5.JPG" width=270 height=480></td>
    <td><img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide6.JPG" width=270 height=480></td>
  </tr>
 </table>
  <p>After selecting the number of table, staff can input the order of customer. Generally, in this ordering system, there are 3 tab bar which is "Main Dishes", "Side Dishes" and "Drinks". Staff can easily navigate through the tab bar and press the plus button for each of customer order. At the bottom-right of the screen, there is "Order Summary" icon where staff can click to navigate to the order summary page.  </p>
  
  <h4>3.3 New Order - Order Summary</h4><p align="center">
  <img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide7.JPG" width="230" height="400" />
  <p>Upon adding the customer orders, staff can see the order summary whereby it show all the order that have been added. Order summary will display the total price of the order. Other than that, staff can edit the quantity of the order.   </p>   </p>
  
  <h4>4 Order List</h4><p align="center">
  <img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide8.JPG" width="230" height="400" />
  <p>User will redirected to this page upon pressing the "Order List" button in the main menu. Staff can see the list of orders including completed orders and in progress orders in this page. It will show completed orders in minimized state as default meanwhile, for ongoing orders it will be showed in expanded state. The order list will be in the form of accordion so that it can ease user to see the essential information (details of ongoing orders). In the ongoing orders section, it will show what are the specific order like French Fries that is not completed yet. Other details such as order no., table number and total price will also be shown. </p></p>

  <h4>5 Order Progress</h4><p align="center">
  <img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/Burger%20mockup/Slide9.JPG" width="230" height="400" />
  <p>The last function of this application which is Order Progress allowed staff especially chef or cook to update the status of the order. It will also apply the accordion concept. The cook or chef can update the order status and notify waiters that are monitoring the order list to once the food are ready to be served.  </p>
 </p>
 
<ins>**Interaction**</ins>
<h4>Login</h4>
<p>
This diagram is about staff login. Typical login screen done by staff in order to access the app and start inputing orders and viewing orders
</p>
<p>
<img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/sequence%20diagram/SequenceDiagram01.jpg"/>
</p>
<br>
<h4>Order Processing</h4>
<p>
This diagram revolves on order prcessing, mostly about table inquiries, order input, order queue and update order prgress (cooking and ready to serve).
</p>
<p>
<img src="https://github.com/ilhamhakimi21/BurgerJoint-Ordering-System/blob/main/sequence%20diagram/SequenceDiagram02.jpg"/>
</p>
