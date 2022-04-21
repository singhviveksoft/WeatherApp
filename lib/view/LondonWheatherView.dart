import 'package:flutter/cupertino.dart';

import '../Palette.dart';

class LondonWheatherView extends StatefulWidget {
  const LondonWheatherView({Key? key}) : super(key: key);

  @override
  _LondonWheatherViewState createState() => _LondonWheatherViewState();
}

class _LondonWheatherViewState extends State<LondonWheatherView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',),
            fit: BoxFit.cover),
      ),
        child: Column(
          children:  [
           const Text('LONDON',style: TextStyle(
                fontSize: 25.0,
             color: Palette.white
            ),),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(0.0,0.0,20.0,100.0),
                  child: Text('LONDON',
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Palette.white[100]
                  ),),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
