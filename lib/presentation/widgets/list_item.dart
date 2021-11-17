import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.year,
    required this.index,
  }) : super(key: key);

  // final int id;
  // final String brand;
  final String name;
  final String imageUrl;
  final int year;
  final int index;
  // final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FadeInImage(
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage(
                'assets/images/car_placeholder.png',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              year.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
