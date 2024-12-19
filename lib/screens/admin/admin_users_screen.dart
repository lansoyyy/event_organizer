import 'package:attendance_checker/screens/auth/login_page.dart';
import 'package:attendance_checker/widgets/admin_drawer_widget.dart';
import 'package:attendance_checker/widgets/logout_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminusersScreen extends StatelessWidget {
  const AdminusersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: TextWidget(
          text: 'ADMIN',
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              logout(context, const LoginPage());
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Users',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('type', isNotEqualTo: 'Organizer')
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
                    return Center(
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: [
                            DataColumn(
                              label: TextWidget(
                                text: 'ID',
                                fontSize: 18,
                              ),
                            ),
                            DataColumn(
                              label: TextWidget(
                                text: 'Name',
                                fontSize: 18,
                              ),
                            ),
                            DataColumn(
                              label: TextWidget(
                                text: 'Email',
                                fontSize: 18,
                              ),
                            ),
                            DataColumn(
                              label: TextWidget(
                                text: '',
                                fontSize: 18,
                              ),
                            ),
                          ], rows: [
                            for (int i = 0; i < data.docs.length; i++)
                              DataRow(cells: [
                                DataCell(
                                  TextWidget(
                                    text: data.docs[i].id,
                                    fontSize: 14,
                                  ),
                                ),
                                DataCell(
                                  TextWidget(
                                    text: data.docs[i]['name'],
                                    fontSize: 14,
                                  ),
                                ),
                                DataCell(
                                  TextWidget(
                                    text: data.docs[i]['email'],
                                    fontSize: 14,
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      Visibility(
                                        visible: !data.docs[i]['isVerified'],
                                        child: IconButton(
                                          onPressed: () async {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: const Text(
                                                        'Verification Confirmation',
                                                        style: TextStyle(
                                                            fontFamily: 'QBold',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      content: const Text(
                                                        'Are you sure you want to verify this user?',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'QRegular'),
                                                      ),
                                                      actions: <Widget>[
                                                        MaterialButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(true),
                                                          child: const Text(
                                                            'Close',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'QRegular',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        MaterialButton(
                                                          onPressed: () async {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Users')
                                                                .doc(data
                                                                    .docs[i].id)
                                                                .update({
                                                              'isVerified': true
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                            'Continue',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'QRegular',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ));
                                          },
                                          icon: const Icon(
                                            Icons.check_circle_outlined,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(data.docs[i].id)
                                              .delete();
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ])
                          ]),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
