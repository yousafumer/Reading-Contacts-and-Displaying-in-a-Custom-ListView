# Contacts List App
This Flutter app allows users to view and search through their contacts from their device. The app fetches contacts using the contacts_service package and manages contact permissions using the permission_handler package. It also allows searching and filtering contacts by name.

# Features
Request permissions to access contacts.
Display a list of contacts with names and phone numbers.
Search contacts by name.
Handle situations where permissions are denied.
Show loading indicator while fetching contacts.
Getting Started
# Prerequisites
Flutter SDK
contacts_service package to fetch contacts.
permission_handler package to handle permissions.
Installation
Clone or download the project:

Download the project as a zip file and extract it.
Or, clone the repository (if hosted on GitHub) using:
bash
# Copy code
git clone https://github.com/your-username/repository-name.git
Navigate to the project folder:

bash
# Copy code
cd your-project-folder
Install dependencies: Run the following command in the terminal to get all required packages:

bash
# Copy code
flutter pub get
Running the App
To run the app on an emulator or connected device, use the following command:

bash
# Copy code
flutter run
File Structure
main.dart: The main entry point of the app that sets up the home screen with ContactsScreen.
contacts_screen.dart: The screen that displays the list of contacts. It handles permission requests, fetching contacts, and filtering the contacts based on the search query.
# Dependencies
contacts_service: A package to fetch contacts from the user's device.
permission_handler: A package to handle permissions for accessing contacts.
Usage
Request permission: When the app starts, it will request permission to access the user's contacts. If permission is granted, the contacts are loaded. If denied, a message will be shown.
View contacts: Once permission is granted, a list of contacts (name and phone number) will be displayed.
Search contacts: You can search for contacts by typing in the search bar. The list will filter as you type.
# Additional Notes
The app uses the contacts_service package to get contacts from the device. It will ask for permissions upon first use.
The permission_handler package is used to manage the permission request and handle denied permissions appropriately.
