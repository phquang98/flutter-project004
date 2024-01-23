import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_project004/widgets/state_by_parent.dart';
import 'package:flutter_project004/widgets/state_mix.dart';
import 'package:flutter_project004/widgets/favorite.dart';

void main() {
  runApp(const MainApp());
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: Row(children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold))),
              Text(location, style: TextStyle(color: Colors.grey[500]))
            ],
          )),
          const FavoriteWidget()
        ]));
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return SizedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
      ButtonWithText(color: color, icon: Icons.route, label: 'ROUTE'),
      ButtonWithText(color: color, icon: Icons.share, label: 'SHARE')
    ]));
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText(
      {super.key,
      required this.color,
      required this.icon,
      required this.label});

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: color)))
        ]);
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          description,
          softWrap: true,
        ));
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 640, height: 240, fit: BoxFit.cover);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const SingleChildScrollView(
            child: Column(children: <Widget>[
              ImageSection(image: 'assets/images/lake.jpg'),
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
              ),
              ButtonSection(),
              TextSection(
                description:
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
              ),
              // ParentWidget(),
              ParentCWidget()
            ]),
          ),
        ));
  }
}