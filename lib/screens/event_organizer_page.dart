import 'package:attendance_checker/screens/add_event_screen.dart';
import 'package:attendance_checker/screens/pages/view_event_page.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class EventOrganizerPage extends StatefulWidget {
  String type;
  String id;

  EventOrganizerPage({super.key, required this.type, required this.id});

  @override
  State<EventOrganizerPage> createState() => _EventOrganizerPageState();
}

class _EventOrganizerPageState extends State<EventOrganizerPage> {
  final searchController = TextEditingController();
  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: widget.type == 'Organizer',
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Regular',
                        fontSize: 14),
                    onChanged: (value) {
                      setState(() {
                        nameSearched = value;
                      });
                    },
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: 'Search Event',
                        hintStyle: TextStyle(
                            fontFamily: 'Regular',
                            fontSize: 18,
                            color: Colors.white),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    controller: searchController,
                  ),
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Events')
                    .where('uid', isEqualTo: widget.id)
                    .where('name',
                        isGreaterThanOrEqualTo:
                            toBeginningOfSentenceCase(nameSearched))
                    .where('name',
                        isLessThan:
                            '${toBeginningOfSentenceCase(nameSearched)}z')
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
                  return SizedBox(
                    height: 650,
                    child: GridView.builder(
                      itemCount: data.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ViewEventPage(
                                          type: widget.type,
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
                                        image: NetworkImage(
                                            data.docs[index]['img']),
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
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
