import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bloc_pattern_flutter_ornek/constants.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  final person = Person;

  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context)!.settings.arguments as Person;

    return Scaffold(
        appBar: AppBar(
          title: AnimatedTextKit(
              repeatForever: true,
              pause: DurationConst().sec1,
              animatedTexts: [FadeAnimatedText(Translations().detail)]),
        ),
        body: ListView(
          children: [
            Image.network(
              "https://picsum.photos/200/200",
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            ListTile(
              leading: contactIcons[0],
              title: Text(
                person.person_name.toUpperCase(),
              ),
              subtitle: Text(Translations().name),
              onTap: () {},
            ),
            ListTile(
              leading: contactIcons[1],
              title: Text(
                person.person_phone,
              ),
              subtitle: Text(Translations().phone),
              onTap: () {},
            )
          ],
        ));
  }
}
