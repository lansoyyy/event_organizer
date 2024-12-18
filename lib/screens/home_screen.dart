import 'package:attendance_checker/screens/clients_screen.dart';
import 'package:attendance_checker/screens/organizer_list_page.dart';
import 'package:attendance_checker/screens/profile_screen.dart';
import 'package:attendance_checker/utils/const.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/drawer_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String type;

  HomeScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: TextWidget(
          text: 'HOME',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
        actions: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Notifs')
                  .where('id', isEqualTo: userId)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return PopupMenuButton(
                  icon: const Icon(Icons.notifications),
                  itemBuilder: (context) {
                    return [
                      for (int i = 0; i < data.docs.length; i++)
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(
                              Icons.notifications,
                              color: Colors.red,
                            ),
                            title: TextWidget(
                              text: 'Someone has sent you a message!',
                              fontSize: 14,
                            ),
                          ),
                        ),
                    ];
                  },
                );
              })
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 75,
            ),
            Center(
              child: Image.asset(
                'assets/images/Rectangle 53.png',
                width: 250,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: type != 'Organizer',
              child: Center(
                child: ButtonWidget(
                  label: 'Event Organizer',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => OrganizerListPage(
                                type: type,
                              )),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: type == 'Organizer',
              child: Center(
                child: ButtonWidget(
                  label: 'Client Users',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ClientsPage()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonWidget(
                label: 'My Profile',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              type: type,
                            )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
