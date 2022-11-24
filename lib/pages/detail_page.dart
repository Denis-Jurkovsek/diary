import 'package:diary_app/pages/home_page.dart';
import 'package:diary_app/theme/colors.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  Widget _title() {
    return const Text(
      'Diary',
      style: TextStyle(
          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget _bigCard() {
    return Expanded(
      child: Card(
        color: Palette.primaryColor.shade500,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: [
                const Image(
                  image: AssetImage('lib/assets/img/Banner_Image.png'),
                  height: 100,
                  width: 275,
                ),
                const ListTile(
                  textColor: Colors.white70,
                  title: Text(
                    'Title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ipsum elit auctor pellentesque tristique platea sit ut sed. Nulla aliquam pretium, nunc, lorem molestie senectus volutpat faucibus. Nulla tincidunt odio elit id faucibus eutristique bibendum diam. Mattis elit sagittis, mattis sit donec at molestie.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ipsum elit auctor pellentesque tristique platea sit ut sed. Nulla aliquam pretium, nunc, lorem molestie senectus volutpat faucibus. Nulla tincidunt odio elit id faucibus eutristique bibendum diam. Mattis elit agittis, mattis sit donec at molestie.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10, bottom: 5),
                      child: Text(
                        'Sun, 13.09',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton(context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        )
      },
      child: const Text('Zurück zur Übersicht'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple,
            Colors.deepPurple,
            Colors.blue,
          ],
        )),
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              children: [
                const SizedBox(width: 16),
                _title(),
              ],
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: [
                    _bigCard(),
                  ],
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(width: 0),
            ),
            _backButton(context),
          ],
        ),
      ),
    );
  }
}
