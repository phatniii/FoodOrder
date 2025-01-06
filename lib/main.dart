import 'dart:math';  // ใช้สำหรับการสุ่ม
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';  // สำหรับการใช้ FontAwesome Icons

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Food Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // รายการเมนูอาหาร
  final List<MenuItem> _menuItems = [
    MenuItem(
      name: "Pad Thai",
      category: "Thai Food",
      price: 120,
      description: "Fried noodles with shrimp, egg, and peanuts.",
      icon: FontAwesomeIcons.bowlFood, // ใช้ไอคอนการ์ตูนของอาหาร
    ),
    MenuItem(
      name: "Sushi",
      category: "Japanese Food",
      price: 200,
      description: "Japanese rice rolls with seafood and vegetables.",
      icon: FontAwesomeIcons.bowlFood, // ใช้ไอคอนอาหารที่ใกล้เคียง
    ),
    MenuItem(
      name: "Burger",
      category: "American Food",
      price: 150,
      description: "A beef patty with lettuce, cheese, and sauce.",
      icon: FontAwesomeIcons.hamburger, // ไอคอนการ์ตูนสำหรับ Burger
    ),
    MenuItem(
      name: "Pizza",
      category: "Italian Food",
      price: 250,
      description: "Thin crust pizza with cheese and pepperoni.",
      icon: FontAwesomeIcons.pizzaSlice, // ไอคอนการ์ตูนสำหรับ Pizza
    ),
    MenuItem(
      name: "Pho",
      category: "Vietnamese Food",
      price: 100,
      description: "Vietnamese noodle soup with beef or chicken.",
      icon: FontAwesomeIcons.bowlFood, // ไอคอนการ์ตูนสำหรับ Pho
    ),
  ];

  final Random _random = Random();  // สุ่มเลือกเมนู

  // เมนูที่แสดงผล
  List<MenuItem> _displayedMenu = [];

  @override
  void initState() {
    super.initState();
    // เริ่มต้นด้วยการแสดงเมนูแรก
    _displayedMenu.add(_menuItems[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB39DDB), // สีม่วงพาสเทล
        title: Text(
          "Total is \$${_calculateTotalPrice()}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // สีข้อความเป็นสีขาว
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _displayedMenu.length,
            itemBuilder: (context, index) {
              final item = _displayedMenu[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple[100],  // สีพื้นหลังของวงกลม
                    radius: 30,  // ขนาดของวงกลม
                    child: Icon(
                      item.icon,  // ไอคอนที่กำหนดในเมนู
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                  subtitle: Text(
                    '${item.category}\n${item.description}',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    '\$${item.price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _randomMenu(); // เมื่อกดปุ่มสุ่มเมนู
        },
        tooltip: 'Add Random Menu',
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _randomMenu() {
    // สุ่มเมนูจากรายการที่มี
    final randomIndex = _random.nextInt(_menuItems.length);
    final randomMenu = _menuItems[randomIndex];

    setState(() {
      // เพิ่มเมนูที่สุ่มได้ไปยังลิสต์แสดงผล
      _displayedMenu.add(randomMenu);  // เพิ่มเมนูที่สุ่มไปในลิสต์ที่แสดงผล
    });
  }

  // ฟังก์ชันในการคำนวณราคาทั้งหมด
  double _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _displayedMenu) {
      totalPrice += item.price;
    }
    return totalPrice;
  }
}

class MenuItem {
  final String name;
  final String category;
  final double price;
  final String description;
  final IconData icon;  // ตัวแปร icon สำหรับเก็บไอคอน

  MenuItem({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.icon,  // รับค่าไอคอน
  });
}
