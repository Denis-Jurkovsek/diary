import 'package:diary_app/pages/home_page.dart';
import 'package:diary_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  Widget _title() {
    return const Text(
      'Diary',
      style: TextStyle(
          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget _imageCard() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 350),
      child: Card(
        color: Palette.primaryColor.shade500,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: const [
                Image(
                  image: AssetImage('lib/assets/img/1.png'),
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _contuineButton(context) {
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
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text(
                  'Hey @username, erzähl mir wie dein Tag war.',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    _imageCard(),
                    _imageCard(),
                  ],
                ),
                Row(
                  children: [
                    _imageCard(),
                    _imageCard(),
                  ],
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(width: 0),
            ),
            _contuineButton(context),
          ],
        ),
      ),
    );
  }
}
