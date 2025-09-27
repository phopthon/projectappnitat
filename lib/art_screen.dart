import 'package:flutter/material.dart';
import 'art_detail.dart';
import 'data/art_data.dart';
import 'models/art.dart';

List<Art> favoriteList = [];

<<<<<<< HEAD
final List<Art> firstRow = artList.sublist(0, 3);  // แถวแรก
final List<Art> secondRow = artList.sublist(3, 6); // แถวสอง
=======
ValueNotifier<List<Art>> favoriteNotifier = ValueNotifier([]);

final List<Art> LeonardoArts = artList
    .where((art) => art.artist == "Leonardo da Vinci") // เลือกเฉพาะงาน Picasso
    .take(3) // เอาแค่ 3 ชิ้น
    .toList();
final List<Art> MichelangeloArts = artList
    .where(
      (art) => art.artist == "Michelangelo Buonarroti",
    ) // เลือกเฉพาะงาน Picasso
    .take(3) // เอาแค่ 3 ชิ้น
    .toList();
final List<Art> RaphaelArts = artList
    .where((art) => art.artist == "Raphael Sanzio") // เลือกเฉพาะงาน Picasso
    .take(3) // เอาแค่ 3 ชิ้น
    .toList();

final List<Art> firstRow = artList.sublist(0, 3); // แถวแรก
final List<Art> secondRow = artList.sublist(3, 6); // แถวสอง
final List<Art> lastRow = artList.sublist(6, 9); // แถวท้าย
>>>>>>> c3dcf9e (first commit)

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
<<<<<<< HEAD
    HomePage(),
    SearchPage(), // Profile
=======
    const HomePage(),
    const SearchPage(),
    const FavoritesPage(),
>>>>>>> c3dcf9e (first commit)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // ❌ ไม่มี AppBar ตายตัวแล้ว
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        indicatorColor: const Color.fromARGB(60, 129, 129, 129),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
<<<<<<< HEAD
              icon: Icon(Icons.home, color: Colors.white), label: ""),
          NavigationDestination(
              icon: Icon(Icons.search, color: Colors.white), label: ""),
          NavigationDestination(
              icon: Icon(Icons.favorite, color: Colors.white), label: ""),
          NavigationDestination(
              icon: Icon(Icons.person, color: Colors.white), label: ""),
=======
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
>>>>>>> c3dcf9e (first commit)
        ],
      ),
    );
  }
}

/// ----------------- HOME PAGE -----------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Art Gallery",
          style: TextStyle(
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
            // Grid ของรูปภาพ
<<<<<<< HEAD
           SizedBox(
  height: 200, // ปรับสูงตามต้องการ
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
=======
            SizedBox(
              height: 200, // ปรับสูงตามต้องการ
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
>>>>>>> c3dcf9e (first commit)

            const SizedBox(height: 13),

            const Text(
              "A Brush for Your Luxury",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 2),

            const Text(
              "Explore unique collection of artwork",
<<<<<<< HEAD
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
=======
              style: TextStyle(fontSize: 15, color: Colors.white),
>>>>>>> c3dcf9e (first commit)
            ),

            const SizedBox(height: 25),

<<<<<<< HEAD

=======
>>>>>>> c3dcf9e (first commit)
            const Text(
              "แนะนำสำหรับคุณ",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

<<<<<<< HEAD
            



            // แถวรูปภาพเลื่อนได้
           SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: firstRow.map((art) {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      art.imagePath,
                      width: 160,
                      height: 120,
                      fit: BoxFit.cover,
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
                       overflow: TextOverflow.ellipsis, // ถ้าชื่อยาวจะตัด
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  // เพิ่ม art ลง favoriteList
                  if (!favoriteList.contains(art)) {
                    favoriteList.add(art);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${art.name} added to favorites'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  ),
),

 const SizedBox(height: 20),

 SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: secondRow.map((art) {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      art.imagePath,
                      width: 160,
                      height: 120,
                      fit: BoxFit.cover,
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
                       overflow: TextOverflow.ellipsis, // ถ้าชื่อยาวจะตัด
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  // เพิ่ม art ลง favoriteList
                  if (!favoriteList.contains(art)) {
                    favoriteList.add(art);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${art.name} added to favorites'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  ),
)
=======
            const Text(
              "ภาพเหมือน",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            //แถวแรก
            // แถวรูปภาพเลื่อนได้
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: firstRow.map((art) {
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  art.imagePath,
                                  width: 160,
                                  height: 120,
                                  fit: BoxFit.cover,
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
                                  overflow:
                                      TextOverflow.ellipsis, // ถ้าชื่อยาวจะตัด
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

            const SizedBox(height: 20),

            const Text(
              "ศาสนา",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            //แถวสอง
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: secondRow.map((art) {
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  art.imagePath,
                                  width: 160,
                                  height: 120,
                                  fit: BoxFit.cover,
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
                                  overflow:
                                      TextOverflow.ellipsis, // ถ้าชื่อยาวจะตัด
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

            const SizedBox(height: 20),

            const Text(
              "ฉากประวัติศาสตร์/เทพนิยาย",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            //แถวสาม
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: lastRow.map((art) {
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  art.imagePath,
                                  width: 160,
                                  height: 120,
                                  fit: BoxFit.cover,
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
                                  overflow:
                                      TextOverflow.ellipsis, // ถ้าชื่อยาวจะตัด
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
>>>>>>> c3dcf9e (first commit)
          ],
        ),
      ),
    );
  }
}

<<<<<<< HEAD
class SearchPage extends StatelessWidget {
  const SearchPage ({super.key});
=======
/// ----------------- SEARCH PAGE -----------------
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
>>>>>>> c3dcf9e (first commit)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
<<<<<<< HEAD
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                    "Find your Art",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12
                      ),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text("search"),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  const Text(
                    "Picasco",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),

                  SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: firstRow.map((art) {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      art.imagePath,
                      width: 160,
                      height: 120,
                      fit: BoxFit.cover,
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
                       overflow: TextOverflow.ellipsis, // ถ้าชื่อยาวจะตัด
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  // เพิ่ม art ลง favoriteList
                  if (!favoriteList.contains(art)) {
                    favoriteList.add(art);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${art.name} added to favorites'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  ),
),

const SizedBox(height: 20),

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: firstRow.map((art) {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      art.imagePath,
                      width: 160,
                      height: 120,
                      fit: BoxFit.cover,
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
                       overflow: TextOverflow.ellipsis, // ถ้าชื่อยาวจะตัด
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  // เพิ่ม art ลง favoriteList
                  if (!favoriteList.contains(art)) {
                    favoriteList.add(art);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${art.name} added to favorites'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  ),
),
            ],
        ),
      ),
      ),
    );
  }
}
=======
          child: ListView(
            children: [
              Text(
                "Find your Art",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Row(children: [Icon(Icons.search), Text("search")]),
              ),

              SizedBox(height: 25),

              const Text(
                "Leonardo da Vinci",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              //แถวหนึ่ง
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: LeonardoArts.map((art) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(artId: art.id),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    art.imagePath,
                                    width: 160,
                                    height: 120,
                                    fit: BoxFit.cover,
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
                                        .ellipsis, // ถ้าชื่อยาวจะตัด
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

              const SizedBox(height: 20),

              const Text(
                "Michelangelo Buonarroti  ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              //แถวสอง
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: MichelangeloArts.map((art) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(artId: art.id),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    art.imagePath,
                                    width: 160,
                                    height: 120,
                                    fit: BoxFit.cover,
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
                                        .ellipsis, // ถ้าชื่อยาวจะตัด
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

              const SizedBox(height: 20),

              const Text(
                "Raphael Sanzio",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              //แถวสาม
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: RaphaelArts.map((art) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(artId: art.id),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    art.imagePath,
                                    width: 160,
                                    height: 120,
                                    fit: BoxFit.cover,
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
                                        .ellipsis, // ถ้าชื่อยาวจะตัด
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
      body: ValueListenableBuilder<List<Art>>(
        valueListenable: favoriteNotifier,
        builder: (context, favs, _) {
          if (favs.isEmpty) {
            return const Center(
              child: Text(
                "No favorites yet",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 รูปต่อแถว
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 160 / 120, // ปรับตามขนาดรูป
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
                  Positioned(
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
>>>>>>> c3dcf9e (first commit)
