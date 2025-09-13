import 'package:flutter/material.dart';
import 'package:lotto/page/checkReward.dart';
import 'package:lotto/page/homeFram.dart';
import 'package:lotto/page/profileFram.dart';

class CheckRewardHistoryPage extends StatefulWidget {
  const CheckRewardHistoryPage({super.key});

  @override
  State<CheckRewardHistoryPage> createState() => _CheckRewardHistoryPageState();
}

class _CheckRewardHistoryPageState extends State<CheckRewardHistoryPage> {
  // ข้อมูลจำลอง (dummy data) ไว้แสดงใน ListView
  final List<Map<String, String>> history = [
    {"reward": "ถูกรางวัลที่ 1","date": "12 ก.ย. 2565", "number": "123456", "result": "ถูกรางวัลเลขท้าย 2 ตัว"},
    {"reward": "ไม่ถูกรางวัล","date": "16 ส.ค. 2565", "number": "987654", "result": "ไม่ถูกรางวัล"},
    {"reward": "ไม่ถูกรางวัล","date": "1 ส.ค. 2565", "number": "555555", "result": "ถูกรางวัลที่ 5"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.network(
          'https://raw.githubusercontent.com/FarmHouse2263/lotto/refs/heads/main/image%202.png',
          height: 30,
          width: 80,
          fit: BoxFit.cover,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 60),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(100, 40),
                    ),
                    onPressed: () {},
                    child: const Text('ทั้งหมด'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: const Size(100, 40),
                    ),
                    onPressed: () {},
                    child: const Text('ที่ถูกรางวัล'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(158, 158, 158, 100),
                height: 16,
              ),
              const SizedBox(height: 20),

              // สร้าง Container ของหวยแบบ dynamic
              ...history.map((item) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' ${item["reward"]}',
                            style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Text('เลขหวย: ${item["number"]}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text('ราคา: ${item["price"]}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text('สถานะ: ${item["status"]}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('งวดที่: ${item["round"]}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple[300],
        unselectedItemColor: Colors.grey[600],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckRewardPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CheckRewardHistoryPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'สินค้า'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'ประวัติ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
