import 'package:attendance_checker/screens/event_organizer_page.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrganizerListPage extends StatelessWidget {
  String type;
  OrganizerListPage({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Event Organizer',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
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
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .where('type', isEqualTo: 'Organizer')
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
                return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EventOrganizerPage(
                                        type: type,
                                        id: data.docs[index].id,
                                      )),
                            );
                          },
                          leading: SizedBox(
                            width: 300,
                            height: 150,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_circle,
                                  size: 50,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                TextWidget(
                                  text: data.docs[index]['name'],
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              })),
    );
  }
}
