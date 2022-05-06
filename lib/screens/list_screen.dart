import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_exam/model/staff.model.dart';
import 'package:flutter_exam/model/student.model.dart';
import 'package:flutter_exam/screens/add_new_screen.dart';
import 'package:flutter_exam/screens/info_screen.dart';
import 'package:flutter_exam/theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<Student>> list = fetchList();
  final controller = ScrollController();

  Future<List<Student>> fetchList() async {
    final res = await http.get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran'));
    if (res.statusCode == 200) {
      List<dynamic> json = jsonDecode(res.body);
      var temp = json.map((e) => Student.fromJson(e)).toList();
      // print(temp);
      return temp;
    } else {
      return [];
    }
  }

  Future<http.Response> deleteStudent(Student st) async {
    final res = await http.get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=${st.id}&tokende=lethibaotran'));
    return res;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      list = fetchList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            alignment: Alignment.topLeft,
            icon: const Icon(
              Icons.arrow_back,
              color: kColorText,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          toolbarHeight: size.height * 0.2,
          flexibleSpace: const Image(
            image: AssetImage('assets/images/bg_list.png'),
            fit: BoxFit.cover,
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: list,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return ItemList(
                                st: snapshot.data[index],
                                delete: () {
                                  print("hi");
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                          'Are You Sure Remove This Student'),
                                      actions: [
                                        TextButton(
                                            onPressed: () => {
                                                  deleteStudent(
                                                      snapshot.data[index]),
                                                  Navigator.of(context).pop()
                                                },
                                            child: const Text('OK')),
                                        TextButton(
                                            onPressed: () =>
                                                {Navigator.of(context).pop()},
                                            child: const Text('Cancel'))
                                      ],
                                    ),
                                  )
                                      // deleteStudent(snapshot.data[index])
                                      .whenComplete(() {
                                    setState(() {
                                      list = fetchList();
                                    });
                                  }).catchError((error, stackTrace) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text('Error'),
                                              content: const Text(
                                                  'Can not remove student'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: const Text('OK'))
                                              ],
                                            ));
                                  });
                                  // if(deleteStaff(snapshot.data[index]).whenComplete(() => null)){
                                  //   list = fetchList();
                                  // }
                                  // else {

                                  // }
                                },
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

class ItemList extends StatelessWidget {
  const ItemList(
      {Key? key, required this.st, required this.delete})
      : super(key: key);

  final Student st;
  final Function() delete;

  String get avt => st.gender == 'Male' ? 'male' : 'female';

  Future<http.Response> deleteStudent(Student st) async {
    final res = await http.get(Uri.parse(
        'http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=${st.id}&tokende=lethibaotran'));
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shadowColor: const Color(0xFF263238),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          // startActionPane: ActionPane(
          //   motion: const ScrollMotion(),
          //   children: [
          //     SlidableAction(
          //       onPressed: (context) {
          //         Navigator.of(context).pushNamed('/update',
          //             arguments: FormArguments(isUpdate: true, st: st));
          //       },
          //       icon: Icons.edit,
          //       label: 'Edit',
          //       backgroundColor: Colors.greenAccent,
          //       autoClose: true,
          //     ),
          //   ],
          // ),
          // endActionPane: ActionPane(
          //   motion: const ScrollMotion(),
          //   children: [
          //     SlidableAction(
          //       onPressed: delete,
          //       icon: Icons.delete,
          //       label: 'Remove',
          //       backgroundColor: Colors.redAccent,
          //       autoClose: true,
          //     )
          //   ],
          // ),
          child: TextButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(
              //   '/update',
              //   arguments: FormArguments(3, isUpdate: true)
              // );
              Navigator.of(context).pushNamed('$InfoScreen', arguments: st);
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avt_$avt.png'),
                  radius: 25,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${st.name}',
                        style: PrimaryFont.medium(20).copyWith(
                            color: const Color.fromARGB(255, 59, 59, 59)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Student ID: #${st.id}',
                        style:
                            PrimaryFont.light(14).copyWith(color: Colors.black),
                      ),
                      Text(
                        'Course: ${st.course}',
                        style:
                            PrimaryFont.light(14).copyWith(color: Colors.black),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/update',
                                  arguments:
                                      FormArguments(isUpdate: true, st: st));
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed:delete,
                            icon: const Icon(Icons.delete,color: Colors.red,),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(136, 255, 247, 15),
              padding: const EdgeInsets.all(15),
            ),
          ),
        ),
      ),
    );
  }
}
