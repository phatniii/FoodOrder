import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Example'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.readawrite.com/articles/12607/12606739/thumbnail/large.gif",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(),
              ),
              const SizedBox(height: 20),

              // Firstname, Lastname, and Nickname
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Phattanison",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Kaison",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Pakbung",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Personal Information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _InfoContainer(text: "Hobby: อ่านหนังสือ"),
                  _InfoContainer(text: "Food: ชาบู, หมูกระทะ"),
                  _InfoContainer(text: "Birthplace: พิจิตร"),
                ],
              ),
              const SizedBox(height: 20),

              // Education
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Education:  ", style: TextStyle(fontSize: 16)),
                  _InfoContainer(text: "elementary: Wat kao sai school (ปี: 55)"),
                  _InfoContainer(text: "primary: Wat kao sai school (ปี: 57)"),
                  _InfoContainer(text: "high school: Kao sai tap kao School (ปี: 59)"),
                  _InfoContainer(text: "Undergrad: Naresuan University (ปี: 65)"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget to style the information with a rounded border and light purple background
class _InfoContainer extends StatelessWidget {
  final String text;
  const _InfoContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,  // Light purple background color
        borderRadius: BorderRadius.circular(12),  // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, 
            blurRadius: 4, 
            spreadRadius: 1, 
            offset: Offset(2, 2), 
          )
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
