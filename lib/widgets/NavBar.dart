import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wheather_app/util/Routing.dart';
import 'package:wheather_app/widgets/PageView.dart';
import 'package:flutter/material.dart';

import 'Draweritem.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff123456),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 20, 24, 0),
          child: Column(children: [
            headerWidget(),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 40,
            ),
            DrawerItem(
              name: 'Home',
              icon: Icons.home_outlined,
              onPressed: () => onItemPressed(context, index: 0),
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
                name: 'Weather',
                icon: Icons.calendar_view_month,
                onPressed: () => onItemPressed(context, index: 1)),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
                name: 'Information',
                icon: Icons.info_outlined,
                onPressed: () => onItemPressed(context, index: 2)),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
                name: 'Setting',
                icon: Icons.settings,
                onPressed: () => onItemPressed(context, index: 4)),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
                name: 'Exit',
                icon: Icons.exit_to_app_outlined,
                onPressed: () => onItemPressed(context, index: 5)),
            //  onPressed: () => onItemPressed(context, index: 5)),
          ]),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        //  Navigator.pushNamed(context, Routing.home);
        break;
      case 1:
        Navigator.pushNamed(context, Routing.table_calender);
        break;
      case 2:
        Navigator.pushNamed(context, Routing.information);
        break;
      case 5:
        _bottomSheet(context);
        break;
      default:
        Navigator.pushNamed(context, Routing.home);
    }
  }

  Widget headerWidget() {
    const url = 'https://source.unsplash.com/random?sig=1';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Person name',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('person@email.com',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }

  _bottomSheet(BuildContext context) async {
    print('_bottomSheet');
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);

                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff123456),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text(
                    'Gallery',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff123456),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  child: const Text(
                    'Camera',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
