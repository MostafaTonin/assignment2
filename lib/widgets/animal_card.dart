import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/animal.dart';

class AnimalCard extends StatefulWidget {
  final Animal animal;

  AnimalCard({required this.animal});

  @override
  State<AnimalCard> createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  void playSound() async {
    if (isPlaying) return; // يمنع تشغيل الصوت أكثر من مرة
    try {
      setState(() => isPlaying = true);
      await _player.stop();
      await Future.delayed(Duration(milliseconds: 50)); // تأخير صغير لتجنب التعليق
      await _player.play(
        AssetSource(widget.animal.soundPath.replaceFirst('assets/', '')),
      );
    } catch (e) {
      print("Error playing sound: $e");
    } finally {
      setState(() => isPlaying = false);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPlaying ? 1.05 : 1.0,
      duration: Duration(milliseconds: 200),
      child: InkWell(
        onTap: playSound,
        splashColor: Colors.orange.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade100, Colors.orange.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.animal.imagePath,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.animal.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(color: Colors.black26, offset: Offset(1,1), blurRadius: 2)
                    ]
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle_fill,
                    size: 32,
                    color: isPlaying ? Colors.red : Colors.green,
                  ),
                  onPressed: playSound,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
