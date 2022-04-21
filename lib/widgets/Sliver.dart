import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverWidget extends StatelessWidget {
  const SliverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollView(context);
  }
  Widget ScrollView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Image.network(
            'https://source.unsplash.com/random?sig=1',
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          expandedHeight: 200.0,
          leading: IconButton(
              onPressed: () {
                return Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('jjjjj'),
          pinned: true,
          floating: true,

        ),

        _buildContent(),

      ],
    );
  }

  SliverGrid _buildContent() {
    return SliverGrid(
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(

        mainAxisSpacing: 10,
        crossAxisSpacing: 10, crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Card(
            color: Colors.yellow,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://source.unsplash.com/random?sig=1',
                  fit: BoxFit.cover,
                ),
              ),
              Text('ddddddddddddddddddd'),
              const Text(
                  'ddddddddddddddddddddgggggggggggggggggggggfffffffffffffffffffffffffffffffffffffffffffffffff'),
            ]),
          );
        },
        childCount: 20,
      ),
    );
  }
}
