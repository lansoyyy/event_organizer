import 'package:attendance_checker/screens/add_event_screen.dart';
import 'package:attendance_checker/screens/pages/view_event_page.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventOrganizerPage extends StatelessWidget {
  String type;
  String id;

  EventOrganizerPage({super.key, required this.type, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: type == 'Organizer',
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddEventScreen()),
            );
          },
        ),
      ),
      appBar: AppBar(
        title: TextWidget(
          text: 'ORGANIZER',
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
                .collection('Events')
                .where('uid', isEqualTo: id)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              return GridView.builder(
                itemCount: data.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ViewEventPage(
                                    type: type,
                                    data: data.docs[index],
                                  )),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(data.docs[index]['img']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text: data.docs[index]['name'],
                              fontSize: 18,
                              fontFamily: 'Bold',
                            ),
                            TextWidget(
                              text: data.docs[index]['date'],
                              fontSize: 12,
                              fontFamily: 'Regular',
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
