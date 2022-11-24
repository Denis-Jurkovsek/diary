import 'package:diary_app/auth.dart';
import 'package:diary_app/pages/create_page.dart';
import 'package:diary_app/pages/detail_page.dart';
import 'package:diary_app/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _signOutButton() {
    MainAxisSize.min;
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white54,
        ),
        child: IconButton(
          icon: const Icon(Icons.logout),
          color: Colors.black,
          tooltip: 'Abmelden',
          onPressed: () {
            signOut();
          },
        ));
  }

  Widget _title() {
    return const Text(
      'Diary',
      style: TextStyle(
          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget _firebaseWriteTest() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({'uuid': 'YIH1EQHU2lP0ohnQY3B6e4eu2VH2', 'quantity': 1})
          // ignore: avoid_print
          .then((value) => print("User Added"))
          // ignore: avoid_print
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: () => {
        addUser(),
      },
      child: const Text(
        "Add User",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  Widget _firebaseReadTest() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseFirestore db = FirebaseFirestore.instance;

    var docRef = db.collection("users");
    var query = docRef.where('uuid', isEqualTo: user?.uid);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('Ax37CacsgU9hNhQixxpR').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("UUID: ${data['uuid']} \nQuantity: ${data['quantity']}");
        }

        return const Text("loading");
      },
    );
  }

  Widget _smallCard(context) {
    return Expanded(
      child: Card(
        color: Palette.primaryColor.shade500,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailPage()),
                      )
                    },
                child: const ListTile(
                  textColor: Colors.white70,
                  title: Text(
                    'Title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    'Lorem ipsum sit amet, dolor consectetur ...',
                    style: TextStyle(fontSize: 15),
                  ),
                )),
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
      ),
    );
  }

  Widget _createNewEntry(context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreatePage()),
        )
      },
      child: const Text('Neuen Eintrag erstellen'),
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
                const SizedBox(width: 160),
                _signOutButton(),
              ],
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: [
                    _smallCard(context),
                    _smallCard(context),
                  ],
                ),
                _firebaseReadTest(),
              ],
            ),
            const Expanded(
              child: SizedBox(width: 0),
            ),
            _createNewEntry(context),
          ],
        ),
      ),
    );
  }
}
