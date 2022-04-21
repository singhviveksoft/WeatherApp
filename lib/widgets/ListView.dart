import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 200,
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Image.network(
                        'https://source.unsplash.com/random?sig=1',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text('ddddddddddddddddddd'),
                  const Text(
                      'ddddddddddddddddddddgggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffff'),
                ]),
          ),
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 10,
        );
      },
    );;
  }
}
