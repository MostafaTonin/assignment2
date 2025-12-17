import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/animal.dart';
import '../widgets/animal_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;
  List<Animal> animals = [];

  @override
  void initState() {
    super.initState();
    loadAnimals();
  }

  Future<void> loadAnimals() async {
    final String response = await rootBundle.loadString('assets/animals.json');
    final data = await json.decode(response) as List;
    setState(() {
      animals = data.map((json) => Animal.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Sounds'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() => isGrid = !isGrid);
            },
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: isGrid
            ? GridView.builder(
                key: ValueKey('grid'),
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: animals.length,
                itemBuilder: (context, index) {
                  return AnimalCard(animal: animals[index]);
                },
              )
            : ListView.builder(
                key: ValueKey('list'),
                padding: EdgeInsets.all(10),
                itemCount: animals.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: AnimalCard(animal: animals[index]),
                  );
                },
              ),
      ),
    );
  }
}
