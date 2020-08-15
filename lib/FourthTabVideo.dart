import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//class AssetsVideo extends StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
    //return //DefaultTabController(
      //length: 3,
      //child: Scaffold(
        //key: const ValueKey<String>('home_page'),
        //appBar: AppBar(
          //title: const Text('Video player example'),
          //actions: <Widget>[
            //IconButton(
              //key: const ValueKey<String>('push_tab'),
              //icon: const Icon(Icons.navigation),
              //onPressed: () {
                //Navigator.push<_PlayerVideoAndPopPage>(
                  //context,
                  //MaterialPageRoute<_PlayerVideoAndPopPage>(
                    //builder: (BuildContext context) => _PlayerVideoAndPopPage(),
                  //),
                //);
              //},
            //)
          //],
          //bottom: const TabBar(
            //isScrollable: true,
            //tabs: <Widget>[
              //Tab(
                //icon: Icon(Icons.cloud),
                //text: "Remote",
              //),
              //Tab(icon: Icon(Icons.insert_drive_file), text: "Asset"),
              //Tab(icon: Icon(Icons.list), text: "List example"),
            //],
          //),
        //),
        //body: TabBarView(
          //children: <Widget>[
            //_BumbleBeeRemoteVideo(),
            //_ButterFlyAssetVideo(),
            //_ButterFlyAssetVideoInList(),
          //],
        //),
      //),
    
  //;}
//}

/*class _ButterFlyAssetVideoInList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _ExampleCard(title: "Item a"),
        _ExampleCard(title: "Item b"),
        _ExampleCard(title: "Item c"),
        _ExampleCard(title: "Item d"),
        _ExampleCard(title: "Item e"),
        _ExampleCard(title: "Item f"),
        _ExampleCard(title: "Item g"),
        Card(
            child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.cake),
                title: Text("Video video"),
              ),
              Stack(
                  alignment: FractionalOffset.bottomRight +
                      const FractionalOffset(-0.1, -0.1),
                  children: <Widget>[
                    _ButterFlyAssetVideo(),
                    Image.asset('images/Alan Walker Spectre.jfif'),
                  ]),
            ],
          ),
        ])),
        _ExampleCard(title: "Item h"),
        _ExampleCard(title: "Item i"),
        _ExampleCard(title: "Item j"),
        _ExampleCard(title: "Item k"),
        _ExampleCard(title: "Item l"),
      ],
    );
  }
}*/

/// A filler card to show the video in a list of scrolling contents.
/*class _ExampleCard extends StatelessWidget {
  const _ExampleCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.airline_seat_flat_angled),
            title: Text(title),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
              FlatButton(
                child: const Text('SELL TICKETS'),
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/

/*class NetworkVideo extends StatefulWidget {
  @override
  NetworkVideoState createState() => NetworkVideoState();
}

class NetworkVideoState extends State<NetworkVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/_Large.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _PlayPauseOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

class NetworkVideo extends StatefulWidget {
  @override
  NetworkVideoState createState() => NetworkVideoState();
}

class NetworkVideoState extends State<NetworkVideo> {
  VideoPlayerController _controller;

 /* Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('assets/bumble_bee_captions.srt');
    return SubRipCaptionFile(fileContents);
  }*/

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://github.com/NeeleshKumarSaini8/flutter-task1-videos/blob/master/videoplayback.mp4?raw=true',
     // closedCaptionFile: _loadCaptions(),
    );

    _controller.addListener(() {
      setState(() {});
    });
    //_controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //Container(padding: const EdgeInsets.only(top: 20.0)),
         // const Text('With remote mp4'),
          Container(
            color: Colors.green.shade50,
            padding: const EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
                  _PlayPauseOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
