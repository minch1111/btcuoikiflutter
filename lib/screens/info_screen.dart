import 'package:flutter/material.dart';
import 'package:flutter_exam/model/student.model.dart';
import 'package:flutter_exam/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({ Key? key }) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late final Student st;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    st = ModalRoute.of(context)?.settings.arguments as Student;
    // staff = const Staff(
    //   id: 1,
    //   name: 'Bui Huu Tri',
    //   birth: '13/03/2000',
    //   phone: '0963386045',
    //   mail: 'staff@gmail.com',
    //   address: '155 Su Van Hanh',
    //   department: 'IT department',
    //   gender: 'Male'
    // );
  }

  String get BgImage => st.gender == 'Male' ? "ic_man" : "ic_woman";

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Student Information'),
      ),
      resizeToAvoidBottomInset: false,
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(height: 10,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/$BgImage.png'),
                  radius: 75
                ),
                ItemInfo(
                  label: st.name,
                  icon: Icons.person,
                ),
                ItemInfo(
                  label: st.gender,
                  icon: st.gender == 'Male' ? Icons.male : Icons.female,
                ),
                ItemInfo(
                  label: st.birth,
                  icon: Icons.event,
                ),
                ItemInfo(
                  label: st.phone,
                  icon: Icons.phone,
                ),
                ItemInfo(
                  label: st.mail,
                  icon: Icons.mail,
                ),
                ItemInfo(
                  label: st.course,
                  icon: Icons.school,
                ),
                ItemInfo(
                  label: st.address,
                  icon: Icons.location_city
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.amber,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.call),
            backgroundColor: Colors.lightGreen,
            label: 'Call',
            onTap: () async {
              await launch('tel:${st.phone}');
            }
          ),
          SpeedDialChild(
            child: const Icon(Icons.send),
            backgroundColor: Colors.redAccent,
            label: 'Mail',
            onTap: () async {
              await launch('mailto:${st.mail}?subject=Subject mail&body=Body mail');
            }
          ),
          SpeedDialChild(
            child: const Icon(Icons.textsms),
            backgroundColor: Colors.yellowAccent,
            label: 'SMS',
            onTap: () async {
              await launch('sms:${st.phone}?body=Body SMS example');
            }
          ),
          SpeedDialChild(
            child: const Icon(Icons.navigation),
            backgroundColor: Colors.lightBlueAccent,
            label: 'Location',
            onTap: () async {
              await launch('https://www.google.com/maps/place/${st.address}');
            }
          ),
        ],
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.amber[700],
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: const Color.fromARGB(255, 241, 248, 190),
        ),
        onPressed: (){},
        child: Row(
          children: [
            Icon(icon, size: 22,),
            const SizedBox(width: 20,),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}