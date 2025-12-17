import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final AudioPlayer player = AudioPlayer();

  void playSound(String path) async {
    await player.stop();
    await player.play(AssetSource(path));
  }

  final List<Map<String, String>> animals = [
    {
      "name": "Lion",
     // "sound": "audio/lion.png",
      "image": "assets/images/lion.png",
    },
    {
      "name": "Cat",
      //"sound": "audio/cat.png",
      "image": "assets/images/cat.png",
    },
    {
      "name": "Dog",
      //"sound": "audio/dog.png",
      "image": "assets/images/dog.png",
    },
    {
      "name": "Tiger",
     // "sound": "audio/tiger.png",
      "image": "assets/images/tiger.png",
    },
  ];

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Animal Sounds',
            style: GoogleFonts.lobster(fontSize: 24),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                playSound(animals[index]["sound"]!);
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.only(bottom: 15),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage(animals[index]["image"]!),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            animals[index]["name"]!,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Tap to play sound",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.volume_up, color: Colors.teal),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
