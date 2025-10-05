import 'package:flutter/material.dart';
import 'art_detail.dart';
import 'package:project1/models/art.dart';
import 'package:project1/data/art_data.dart';

ValueNotifier<List<Art>> favoriteNotifier = ValueNotifier<List<Art>>(
  [],
); // ตัวแปรที่ใช้เก็บ "รายการงานศิลป์ที่ถูกกดชอบ (Favorite)"
// ใช้ ValueNotifier เพื่อให้ UI อัปเดตอัตโนมัติเมื่อข้อมูลเปลี่ยน

// แถวตัวอย่าง
final List<Art> firstRow = artList.sublist(0, 3);
final List<Art> secondRow = artList.sublist(3, 6);
final List<Art> lastRow = artList.sublist(6, 9);

// งานของศิลปิน (กรองจาก artList ตามชื่อศิลปิน)
final List<Art> leonardoArts = artList
    .where((art) => art.artist == "ศิลปิน Leonardo da Vinci")
    .take(3)
    .toList();
final List<Art> michelangeloArts = artList
    .where((art) => art.artist == "ศิลปิน Michelangelo Buonarroti")
    .take(3)
    .toList();
final List<Art> raphaelArts = artList
    .where((art) => art.artist == "ศิลปิน Raphael Sanzio")
    .take(3)
    .toList();

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectedIndex = 0;

  // เก็บหน้าทั้งหมดของแอป → ใช้สลับเมื่อเปลี่ยน tab
  final List<Widget> _pages = const [HomePage(), SearchPage(), FavoritesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _pages[_selectedIndex], // แสดงหน้าที่เลือกอยู่ปัจจุบัน (จาก list _pages)
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.brown,
        indicatorColor: const Color(0xFF8B5E3C),
        selectedIndex: _selectedIndex, // ตำแหน่งปุ่มที่เลือกอยู่ตอนนี้
        onDestinationSelected: (int index) {
          // เมื่อกดปุ่มเมนู → เปลี่ยน index
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: const Color(0xFFF9F6F1)),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.search, color: const Color(0xFFF9F6F1)),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite, color: const Color(0xFFF9F6F1)),
            label: "",
          ),
        ],
      ),
    );
  }
}

/// ----------------- HOME PAGE -----------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ฟังก์ชันสร้าง "แถวผลงานศิลปะ" แบบเลื่อนแนวนอน
  // ปรับให้เหมือนหน้า Favorite: มีกรอบ Card, เงา, ปุ่มหัวใจ, และชื่อทับพื้นหลังดำโปร่ง
  Widget _artRow(List<Art> arts, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // ให้เลื่อนได้แนวนอน
      child: Row(
        children: arts.map((art) {
          return Padding(
            padding: const EdgeInsets.all(8), // เว้นระยะระหว่างแต่ละภาพ
            child: GestureDetector(
              onTap: () {
                // 👉 เมื่อกดภาพ → ไปหน้าแสดงรายละเอียด (DetailPage)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(artId: art.id),
                  ),
                );
              },
              child: Card(
                // กรอบภาพแบบมุมโค้ง + เงา
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4, // เงาเบาๆ เหมือนกรอบรูป
                clipBehavior: Clip.antiAlias, // ตัดขอบภาพให้อยู่ในมุมโค้ง
                child: Stack(
                  children: [
                    // ---------- รูปผลงาน ----------
                    Image.network(
                      art.imagePath,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover, // ครอบเต็มกรอบ
                    ),

                    // ---------- ปุ่มหัวใจ ----------
                    Positioned(
                      top: 8,
                      right: 8,
                      child: ValueListenableBuilder<List<Art>>(
                        valueListenable:
                            favoriteNotifier, // ฟังค่ารายการ favorite
                        builder: (context, favs, _) {
                          final isFavorite = favs.contains(
                            art,
                          ); // เช็คว่าถูกกดชอบหรือยัง
                          return GestureDetector(
                            onTap: () {
                              // 👉 ถ้าถูกกดชอบแล้ว → เอาออก
                              // 👉 ถ้ายัง → เพิ่มเข้า favorites
                              if (isFavorite) {
                                favoriteNotifier.value = favs
                                    .where((a) => a != art)
                                    .toList();
                              } else {
                                favoriteNotifier.value = [...favs, art];
                              }
                            },
                            child: Container(
                              // วงกลมพื้นหลังขาวโปร่งบางๆ รองหัวใจ
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Icon(
                                isFavorite
                                    ? Icons
                                          .favorite // หัวใจเต็ม
                                    : Icons.favorite_border, // หัวใจขอบ
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // ---------- ชื่อผลงาน ----------
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        color: Colors.black.withOpacity(
                          0.5,
                        ), // พื้นหลังดำโปร่งบางๆ
                        child: Text(
                          art.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // ถ้าชื่อยาวเกิน → ...
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F6F1),
        elevation: 0,
        title: const Text(
          "Art Gallery",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://georgemillerart.com/cdn/shop/products/il_fullxfull.3861285802_7foq.jpg?v=1674919614&width=1946",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),
            const Text(
              "A Brush for Your Luxury",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "Explore unique collection of artwork",
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "แนะนำสำหรับคุณ",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 15),

            const Text(
              "ภาพเสมือน",
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 5),

            _artRow(firstRow, context),

            const SizedBox(height: 20),

            const Text(
              "Popular Artist",
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 90,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // เรียกใช้ _artistCircle เพื่อสร้างวงกลมศิลปิน + ชื่อ
                    _artistCircle(
                      "https://www.leonardodavinci.net/assets/img/leonardo-da-vinci.jpg",
                      "Leonardo da Vinci",
                    ),
                    _artistCircle(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project_%28454045%29.jpg/250px-Vincent_van_Gogh_-_Self-Portrait_-_Google_Art_Project_%28454045%29.jpg",
                      "Vincent Willem van Gogh",
                    ),
                    _artistCircle(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Michelangelo_Daniele_da_Volterra_%28dettaglio%29.jpg/1036px-Michelangelo_Daniele_da_Volterra_%28dettaglio%29.jpg",
                      "Michelangelo Buonarroti",
                    ),
                    _artistCircle(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Raffaello_Sanzio.jpg/250px-Raffaello_Sanzio.jpg",
                      "Raphael Sanzio",
                    ),
                    _artistCircle(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Cropped_version_of_Jan_Vermeer_van_Delft_002.jpg/960px-Cropped_version_of_Jan_Vermeer_van_Delft_002.jpg",
                      "Johannes Reynierszoon Vermeer",
                    ),
                    _artistCircle(
                      "https://upload.wikimedia.org/wikipedia/commons/c/c7/Gustav_Klimt.jpg",
                      "Gustav Klimt",
                    ),
                    // เพิ่มคนอื่น ๆ ตามต้องการ
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "ศาสนา",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 5),

            _artRow(secondRow, context),

            const SizedBox(height: 20),

            const Text(
              "ฉากประวัติศาสตร์/เทพนิยาย",
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 5),

            _artRow(lastRow, context),
            const SizedBox(height: 15),

            SizedBox(
              height: 200,
              child: PageView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://media.istockphoto.com/id/465579815/photo/romantic-venice.jpg?s=612x612&w=0&k=20&c=-PXOyIin6LQbO6t1LfmkUAtiCSlfqz2SmvusjnGcRNI=",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ฟังก์ชันสร้าง widget ศิลปิน 1 คน (รูปวงกลม + ชื่อ)
Widget _artistCircle(String imageUrl, String name) {
  return Padding(
    padding: const EdgeInsets.only(right: 24),
    child: Column(
      children: [
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4),

        SizedBox(
          width: 70,
          child: Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

/// ----------------- SEARCH PAGE -----------------
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  // ฟังก์ชันสร้าง "แถวผลงานของศิลปินแต่ละคน"
  // ปรับให้เหมือนหน้า Favorite เช่นกัน
  Widget _artistRow(String title, List<Art> arts, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- หัวข้อชื่อศิลปิน ----------
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const SizedBox(height: 7),

        // ---------- แถวภาพผลงาน ----------
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: arts.map((art) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    // 👉 คลิกที่ภาพ → เปิดหน้า DetailPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(artId: art.id),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4, // เงาเหมือนกรอบภาพ
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        // ---------- รูปผลงาน ----------
                        Image.network(
                          art.imagePath,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),

                        // ---------- ปุ่มหัวใจ ----------
                        Positioned(
                          top: 8,
                          right: 8,
                          child: ValueListenableBuilder<List<Art>>(
                            valueListenable: favoriteNotifier,
                            builder: (context, favs, _) {
                              final isFavorite = favs.contains(art);
                              return GestureDetector(
                                onTap: () {
                                  if (isFavorite) {
                                    favoriteNotifier.value = favs
                                        .where((a) => a != art)
                                        .toList();
                                  } else {
                                    favoriteNotifier.value = [...favs, art];
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                    size: 22,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // ---------- ชื่อผลงาน ----------
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            color: Colors.black.withOpacity(0.5),
                            child: Text(
                              art.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            // ใช้ scroll แนวตั้ง
            children: [
              const Text(
                "Find your Art",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 198, 198),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 5),
                    Text("search", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // แถวผลงานของศิลปินแต่ละคน
              _artistRow("ศิลปิน Leonardo da Vinci", leonardoArts, context),
              const SizedBox(height: 20),
              _artistRow(
                "ศิลปิน Michelangelo Buonarroti",
                michelangeloArts,
                context,
              ),
              const SizedBox(height: 20),
              _artistRow("ศิลปิน Raphael Sanzio", raphaelArts, context),
            ],
          ),
        ),
      ),
    );
  }
}

/// ----------------- FAVORITE PAGE -----------------
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF9F6F1,
      ), // พื้นหลังโทนสีอ่อนแนว Art Gallery
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF9F6F1),
        elevation: 0, // เอาเงาออก ให้เรียบหรู
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List<Art>>(
        // ฟังค่าจาก favoriteNotifier → รีเฟรช UI อัตโนมัติเมื่อเปลี่ยนค่า
        valueListenable: favoriteNotifier,
        builder: (context, favs, _) {
          if (favs.isEmpty) {
            // ถ้าไม่มี favorite เลย → แสดงข้อความ
            return const Center(
              child: Text(
                "No favorites yet",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          }

          return GridView.builder(
            // ถ้ามี favorite → แสดงเป็น GridView
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 คอลัมน์
              mainAxisSpacing: 20, // ระยะแนวตั้งระหว่าง item
              crossAxisSpacing: 20, // ระยะแนวนอนระหว่าง item
              childAspectRatio: 3 / 4, // สัดส่วนแนวตั้งมากขึ้นให้เหมือนกรอบภาพ
            ),
            itemCount: favs.length,
            itemBuilder: (context, index) {
              final art = favs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(artId: art.id),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4, // เงาเบาๆ ให้ดูเหมือนกรอบภาพ
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      // ---------------- รูปผลงาน ----------------
                      Positioned.fill(
                        child: Image.network(art.imagePath, fit: BoxFit.cover),
                      ),

                      // ---------------- ปุ่มหัวใจ ----------------
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            favoriteNotifier.value = favs
                                .where((a) => a != art)
                                .toList();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                0.7,
                              ), // พื้นหลังโปร่ง
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ),
                      ),

                      // ---------------- ชื่อผลงาน ----------------
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.black.withOpacity(
                            0.5,
                          ), // พื้นหลังดำโปร่ง
                          child: Text(
                            art.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
