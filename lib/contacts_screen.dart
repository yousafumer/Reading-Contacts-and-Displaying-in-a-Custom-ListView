// contacts_screen.dart
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    requestContactPermission();
  }

  Future<void> requestContactPermission() async {
    if (await Permission.contacts.request().isGranted) {
      fetchContacts();
    } else {
      // Handle permission denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Contact permission is required to display contacts")),
      );
    }
  }

  Future<void> fetchContacts() async {
    setState(() => isLoading = true);
    Iterable<Contact> contactsList = await ContactsService.getContacts();
    setState(() {
      contacts = contactsList.toList();
      filteredContacts = contacts;
      isLoading = false;
    });
  }

  void filterContacts(String query) {
    List<Contact> filtered = contacts.where((contact) {
      return contact.displayName != null &&
             contact.displayName!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() => filteredContacts = filtered);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Contacts",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: filterContacts,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = filteredContacts[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(contact.initials()),
                        ),
                        title: Text(contact.displayName ?? ""),
                        subtitle: Text(
                          contact.phones!.isNotEmpty
                              ? contact.phones!.first.value ?? ""
                              : "No phone number",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
