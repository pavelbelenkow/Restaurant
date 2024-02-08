
## Restaurant

Restaurant - is a simple app for ordering dishes in restaurant's menu.

# Purpose and Goals of the App

The app helps users search for and browse dishes for delivery from a restaurant.

App goals:

- Viewing dishes from the menu of the selected restaurant;
- Viewing detailed information about a selected dish and the ability to order it (simulated);
- Viewing and updating user profile information.

# Brief Description of the App

- The app displays the menu of dishes from the selected restaurant, structured as a vertical list;
- Users can search for dishes by name, filter the display of dishes using category buttons;
- Users can view detailed information about a selected dish from the list and order it for delivery (ordering is simulated);
- Users can view profile information, update their image from the iPhone photos library, and change account details.

# Functional Requirements

## Onboarding

Upon first entering the application, users are directed to the onboarding screen.

**Onboarding Screen Contains:**

- Custom PageTabView consisting of 3 pages;
- Animated PageControl;
- Heading;
- App interface image;
- Description of the image;
- «Next» button, and if it's the last page of onboarding, «Done» button;
- «Skip» button.

**Algorithms and Available Actions:**

- Users navigate forward through the onboarding pages by pressing the «Next» button. Upon navigation, there is an animation of a bouncing ball and a change in the background of the page;
- Pressing the «Done» or «Skip» button directs the user to the registration screen.

## Registration

Upon first entry into the app, users will be prompted to register to browse and order dishes from the restaurant.

**Registration Screen Contains:**

- Text fields for entering account data;
- Alert with information about errors in the entered account data;
- «Register» button to proceed to the main menu screen.

**Algorithms and Available Actions:**

- Upon pressing the «Register» button, validation of the entered account data occurs. Upon successful validation, the user is directed to the main screen; in case of an error, an alert with error information is displayed.

## Menu

On the main screen, users can search, filter, and view detailed information about a selected dish to place an order for its delivery.

**Menu Screen Contains:**

- Header view with the restaurant's logo and user profile image;
- Hero section with the restaurant's name, image, description, city location, and a field for searching dishes;
- Horizontal presentation of dish categories and a call-to-action text for ordering;
- Vertical list of dish cards, each containing the name, description, price, and image of the dish;
- Popup with detailed information about the selected dish.

**Algorithms and Available Actions:**

- Users can vertically scroll through the menu screen to view all dishes;
- Search field allows users to search by name, among all dishes in the restaurant or within the selected category from the horizontal presentation of dish categories;
- Users can horizontally scroll through dish categories and filter dishes by the selected category(-ies);
- Upon tapping on a dish card, a popup with detailed information about the selected dish appears;
- Popup contains an image of the dish, which can be zoomed using pinch gestures and double-tap;
- Popup presents a horizontal list of dishes, between which users can switch like pages;
- Popup can be collapsed by tapping outside of it or swiping it down;
- Pressing the «Add To Order» button simulates adding the dish to the order for delivery from the restaurant.

## Profile

On the profile screen, users can view the account data entered during registration, change them, and log out.

**Profile Screen Contains:**

- Section title;
- Profile image;
- Text fields with the account data entered during registration;
- «Logout» button;
- «Confirm» and «Discard» buttons for changing account data.

**Algorithms and Available Actions:**

- Tapping on the profile image opens the iPhone photos library, allowing users to select a new profile photo, which is then saved in the profile;
- When changing account data, if they differ from the original data, the "Confirm" and "Cancel" buttons are displayed to the user;
- Pressing the «Confirm» button saves the new account data in Keychain, and they will be displayed upon subsequent login to the application;
- Pressing the «Discard» button restores the account data to their original state;
- Pressing the «Logout» button directs the user to the registration screen, and their old data are deleted.

# Non-Functional Requirements

- The application must support iPhone X and above and be adapted for iPhone SE, with a minimum supported iOS version of 17.0;
- Custom fonts Karla and Markazi Text are used in the app;
- Information about dishes is loaded using an API provided by Meta Mobile Developer;
- Core Data is used to store data about loaded dishes;
- Keychain is used to store account data.
