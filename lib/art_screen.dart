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
        backgroundColor: const Color.fromARGB(255, 15, 13, 13),
        indicatorColor: const Color.fromARGB(60, 129, 129, 129),
        selectedIndex: _selectedIndex, // ตำแหน่งปุ่มที่เลือกอยู่ตอนนี้
        onDestinationSelected: (int index) {
          // เมื่อกดปุ่มเมนู → เปลี่ยน index
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.search, color: Colors.white),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite, color: Colors.white),
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

  // ฟังก์ชันสร้างแถวแสดงงานศิลปะ (เลื่อนในแนวนอน)
  Widget _artRow(List<Art> arts, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // เลื่อนแนวนอนได้
      child: Row(
        // วนลูป art แต่ละชิ้นใน arts แล้วสร้าง widget
        children: arts.map((art) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              // ใช้ซ้อน widget (รูป + ปุ่มหัวใจ)
              children: [
                // คลิกได้ → ไปหน้า DetailPage
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          artId: art.id,
                        ), // ส่ง id งานศิลป์ไปหน้า Detail
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ), // กรอบสีขาว
                          borderRadius: BorderRadius.circular(12), // มุมโค้ง
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            art.imagePath,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 160,
                        child: Text(
                          art.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  // ปุ่มหัวใจมุมขวาบน (กดชอบ/ยกเลิก)
                  top: 8,
                  right: 8,
                  child: ValueListenableBuilder<List<Art>>(
                    valueListenable: favoriteNotifier, // ตัวแปรเก็บงานที่กดชอบ
                    builder: (context, favs, _) {
                      final isFavorite = favs.contains(
                        art,
                      ); // เช็คว่า art นี้ถูกกดชอบหรือยัง
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
                        child: Icon(
                          isFavorite
                              ? Icons
                                    .favorite // ถ้าถูกกดชอบ → หัวใจเต็ม
                              : Icons
                                    .favorite_border, // ถ้ายังไม่ถูกกดชอบ → หัวใจขอบ
                          color: Colors.red,
                          size: 28,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Art Gallery",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "Explore unique collection of artwork",
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(height: 25),
            const Text(
              "แนะนำสำหรับคุณ",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),

            const Text(
              "ภาพเสมือน",
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),

            const SizedBox(height: 5),

            _artRow(firstRow, context),

            const SizedBox(height: 20),

            const Text(
              "Popular Artist",
              style: const TextStyle(fontSize: 15, color: Colors.white),
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
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),

            const SizedBox(height: 5),

            _artRow(secondRow, context),

            const SizedBox(height: 20),

            const Text(
              "ฉากประวัติศาสตร์/เทพนิยาย",
              style: const TextStyle(fontSize: 15, color: Colors.white),
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
            style: const TextStyle(color: Colors.white, fontSize: 12),
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

  // ฟังก์ชันสร้างแถวศิลปิน (ชื่อหมวด + ภาพผลงาน)
  Widget _artistRow(String title, List<Art> arts, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 7),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: arts.map((art) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(artId: art.id),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ), // กรอบสีขาว
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // มุมโค้ง
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                art.imagePath,
                                width: 160,
                                height: 160,
                                fit: BoxFit.cover, // ครอบรูปเต็มกรอบ
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 160,
                            child: Text(
                              art.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // ถ้าชื่อยาวเกินตัดด้วย "..."
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: ValueListenableBuilder<List<Art>>(
                        valueListenable: favoriteNotifier,
                        builder: (context, Art, _) {
                          final isFavorite = Art.contains(art);
                          return GestureDetector(
                            onTap: () {
                              if (isFavorite) {
                                favoriteNotifier.value = Art.where(
                                  (a) => a != art,
                                ).toList();
                              } else {
                                favoriteNotifier.value = [...Art, art];
                              }
                            },
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 28,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            // ใช้ scroll แนวตั้ง
            children: [
              const Text(
                "Find your Art",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 5),
                    Text("search"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

               // แถวผลงานของศิลปินแต่ละคน
              _artistRow("ศิลปิน Leonardo da Vinci", leonardoArts, context),
              const SizedBox(height: 20),
              _artistRow("ศิลปิน Michelangelo Buonarroti",michelangeloArts, context,),
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Favorites", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: ValueListenableBuilder<List<Art>>(  // ฟังค่าจาก favoriteNotifier → รีเฟรช UI อัตโนมัติเมื่อเปลี่ยนค่า
        valueListenable: favoriteNotifier,
        builder: (context, favs, _) {
          if (favs.isEmpty) {// ถ้าไม่มี favorite เลย → แสดงข้อความ 
            return const Center(
              child: Text(
                "No favorites yet",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return GridView.builder(// ถ้ามี favorite → แสดงเป็น GridView
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,       // 2 คอลัมน์
              mainAxisSpacing: 16,     // ระยะแนวตั้งระหว่าง item
              crossAxisSpacing: 16,    // ระยะแนวนอนระหว่าง item
              childAspectRatio: 160 / 120, // อัตราส่วนของรูป
            ),
            itemCount: favs.length,
            itemBuilder: (context, index) {
              final art = favs[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(artId: art.id),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        art.imagePath,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(// ปุ่มหัวใจลบออกจาก favorite
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        favoriteNotifier.value = favs
                            .where((a) => a != art)
                            .toList();
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
