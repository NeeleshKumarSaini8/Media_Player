import 'package:Media_Player/FourthTabVideo.dart';
import 'package:Media_Player/SecondTabAudio.dart';
import 'package:Media_Player/ThirdTabVideo.dart';
import 'package:flutter/material.dart';

import 'FirstTabAudio.dart';
//import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child:
         Scaffold(
         // resizeToAvoidBottomInset: false,
          appBar: AppBar(
           bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.library_music),),
                Tab(icon: Icon(Icons.library_music)),
                Tab(icon: Icon(Icons.video_library)),
                Tab(icon: Icon(Icons.video_library)),
                ],          
            ),
            title: Text('Media Player'),
            leading: Icon(Icons.dehaze),
            actions: <Widget>[
              Icon(Icons.search),
            ],
          backgroundColor: Colors.orange.shade900,
          ),
          body: TabBarView(
            children: [
              //Icon(Icons.directions_car),
              AssetsAudio(),
              //Icon(Icons.directions_transit),
              NetworkAudio(),
              //Icon(Icons.directions_bike),
              AssetsVideo(),
              //Icon(Icons.directions_bike),
              NetworkVideo(),           
            ],
          ),
        
        ),
        
        ),
        
      debugShowCheckedModeBanner: false,
      );
  }
}