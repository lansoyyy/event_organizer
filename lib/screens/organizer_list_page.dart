import 'package:attendance_checker/screens/event_organizer_page.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class OrganizerListPage extends StatefulWidget {
  String type;
  OrganizerListPage({super.key, required this.type});

  @override
  State<OrganizerListPage> createState() => _OrganizerListPageState();
}

class _OrganizerListPageState extends State<OrganizerListPage> {
  final searchController = TextEditingController();
  String nameSearched = '';
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
                          hintText: 'Search Event Organizer',
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
                      .collection('Users')
                      .where('type', isEqualTo: 'Organizer')
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
                      child: ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventOrganizerPage(
                                              type: widget.type,
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
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}
