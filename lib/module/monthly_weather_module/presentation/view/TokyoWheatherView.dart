import 'package:flutter/cupertino.dart';
import 'package:wheather_app/util/Palette.dart';

class TokyoWheatherView extends StatefulWidget {
  const TokyoWheatherView({Key? key}) : super(key: key);

  @override
  _TokyoWheatherViewState createState() => _TokyoWheatherViewState();
}

class _TokyoWheatherViewState extends State<TokyoWheatherView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'),
            fit: BoxFit.cover),
      ),
        child: Column(
          children:  [
           const Text('TOKYO',style: TextStyle(
                fontSize: 25.0,
              color: Palette.white,
            ),),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(0.0,0.0,20.0,100.0),
                  child: Text('TOKYO',
                    style: TextStyle(
                        fontSize: 45.0,
                        color: Palette.white[100]
                    ),),
                ),
              ),
            ),
          ],
        )
    );
  }
}
