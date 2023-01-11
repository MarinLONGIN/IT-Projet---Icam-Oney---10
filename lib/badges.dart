import 'package:flutter/material.dart';



class Badges extends StatelessWidget {
  const Badges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Badges"),
        elevation: 0.0,
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Image(
              image: AssetImage('assets/Essence.png'),
            ),
            Image(
              image: AssetImage('assets/alcool.png'),
            ),
            Image(
              image: AssetImage('assets/non-fumeur.png'),
            ),
            Image(
              image: AssetImage('assets/restaurant.png'),
            ),
            Image(
              image: AssetImage('assets/supermarché.png'),
            ),
          ],
        ),
      ),
    );
  }
}