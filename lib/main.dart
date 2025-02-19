import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(BarberApp());

class BarberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarberHomePage(),
    );
  }
}

class BarberHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(CupertinoIcons.location, color: Colors.grey[600]),
            SizedBox(width: 8),
            Text(
              "Yogyakarta",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/photop.jpg"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              "Joe Samanta",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // Banner section
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Booking Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(CupertinoIcons.shopping_cart, size: 24, color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        "assets/photo1.png",
                        scale: 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Search section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search barber's, haircut services...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(CupertinoIcons.folder, color: Colors.grey[600]),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Nearest Barbershop title
            Text(
              "Nearest Babershop",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            // List of barbershops
            Expanded(
              child: ListView(
                children: [
                  barbershopCard(
                    context: context,
                    title: "Alana Barbershop – Haircut massage & Spa",
                    distance: "Banguntapan (5km)",
                    rating: 4.5,
                    imageUrl: "assets/foto3.jpeg",
                  ),
                  barbershopCard(
                    context: context,
                    title: "Hercha Barbershop – Haircut & Styling",
                    distance: "Jalan Kaliurang (8km)",
                    rating: 5.0,
                    imageUrl: "assets/foto4.jpeg",
                  ),
                  barbershopCard(
                    context: context,
                    title: "Barberking – Haircut styling & massage",
                    distance: "Jogia Expo Centre (12km)",
                    rating: 4.5,
                    imageUrl: "assets/foto5.jpeg",
                  ),


                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most recommended",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("See All"),
                            Icon(CupertinoIcons.arrow_right, color: Colors.orange),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  recommendedBarbershopCard(
                    context: context,
                    title: "Master piece Barbershop – Haircut styling",
                    distance: "Joga Expo Centre (2km)",
                    rating: 5.0,
                    imageUrl: "assets/foto2.png",
                    isHighlighted: true,
                  ),
                  barbershopCard(
                    context: context,
                    title: "Varcity Barbershop Jogja ex The Varcher",
                    distance: "Condongcatur (10km)",
                    rating: 4.5,
                    imageUrl: "assets/foto6.jpeg",
                  ),
                  barbershopCard(
                    context: context,
                    title: "Twinsky Monkey Barber & Men Stuff",
                    distance: "Jl Taman Siswa (8km)",
                    rating: 5.0,
                    imageUrl: "assets/foto7.jpeg",
                  ),
                  barbershopCard(
                    context: context,
                    title: "Barberman – Haircut styling & massage",
                    distance: "J-Walk Centre (17km)",
                    rating: 4.5,
                    imageUrl: "assets/foto9.jpeg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget barbershopCard({
    required BuildContext context,
    required String title,
    required String distance,
    required double rating,
    required String imageUrl,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
          radius: 30,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(distance),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.star, color: Colors.amber), // Modified
            Text(rating.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }


  Widget recommendedBarbershopCard({
    required BuildContext context,
    required String title,
    required String distance,
    required double rating,
    required String imageUrl,
    bool isHighlighted = false,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                ),
              ),
              if (isHighlighted)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.orange,
                    child: Text(
                      "Most Recommended",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(distance),
                Row(
                  children: [
                    Icon(CupertinoIcons.star, color: Colors.amber),
                    Text(rating.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Book Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
