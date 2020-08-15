import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
typedef void OnError(Exception exception);

class NetworkAudio extends StatefulWidget {
  @override
  _NetworkAudioState createState() => _NetworkAudioState();
}

class _NetworkAudioState extends State<NetworkAudio> {

  AudioPlayer audioPlayer = new AudioPlayer();
  Duration _duration = new Duration();
  Duration _position = new Duration();

  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    audioPlayer = new AudioPlayer();

    audioPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    audioPlayer.positionHandler = (p) => setState(() {
    _position = p;
    });
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });});
  }

  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade100,      
      child: Column(
            children: <Widget>[
              Card(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                          Image.network(
                            'https://github.com/NeeleshKumarSaini8/flutter-task1-images/blob/master/raw.jpg?raw=true',
                             fit: BoxFit.fill,)
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Raw',style: TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = Colors.blue[800],
      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {audioPlayer.play(
                                    'https://raw.githubusercontent.com/NeeleshKumarSaini8/flutter_audios/master/rawtrim.mp3');
                                                                                  }),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () { audioPlayer.pause();}),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () { audioPlayer.stop();}),
                                ],
                              ),
                                ],
                            ),


                            ),
                            
                          ],

                        ),
                      ),
                        
                        ],
                        
                  )
                ),
              ),

              Card(
                child: Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: 
                          Image.network(
                            'https://github.com/NeeleshKumarSaini8/flutter-task1-images/blob/master/Brock-Lesnar-Suplex-City-Welcomes-You-Authentic-WWE-T-.jpg?raw=true',
                             fit: BoxFit.fill,)
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Brocklesnar',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {audioPlayer.play(
                                    'https://raw.githubusercontent.com/NeeleshKumarSaini8/flutter_audios/master/Brock-Lesnar-Theme-Song-_Next-Big-Thing-Ringtone%20(0).mp3');
                                                                                  }),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () { audioPlayer.pause();}),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () { audioPlayer.stop();}),
                                ],
                              ),
                                ],
                            ),

                            ),
                            
                          ],

                        ),
                      ),

                        ],  
                  )
                ),
              ),

              Card(
                child: Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: 
                          Image.network(
                            'https://github.com/NeeleshKumarSaini8/flutter-task1-images/blob/master/roman%20reigns.jfif?raw=true',
                             fit: BoxFit.fill,)
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Roman Reigns',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {audioPlayer.play(
                                    'https://raw.githubusercontent.com/NeeleshKumarSaini8/flutter_audios/master/Roman-Reigns-WWE-The-Truth-Reigns-3rd-Theme-Song.mp3');
                                                                                  }),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () { audioPlayer.pause();}),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () { audioPlayer.stop();}),
                                ],
                              ),
                                ],
                            ),

                            ),
                            
                          ],

                        ),
                      ),

                        ],  
                  )
                ),
              ),

              Card(
                child: Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                          Image.network(
                            'https://github.com/NeeleshKumarSaini8/flutter-task1-images/blob/master/dean%20ambrose.jfif?raw=true',
                             fit: BoxFit.fill,)                                    
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Dean Ambrose',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {audioPlayer.play(
                                    'https://raw.githubusercontent.com/NeeleshKumarSaini8/flutter_audios/master/Dean-Ambrose-Ringtone%20(0).mp3');
                                                                                  }),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () { audioPlayer.pause();}),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () { audioPlayer.stop();}),
                                ],
                              ),
                                ],
                            ),

                            ),
                            
                          ],

                        ),
                      ),

                        ],  
                  )
                ),
              ),

              Card(
                child: Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: 
                          Image.network(
                            'https://github.com/NeeleshKumarSaini8/flutter-task1-images/blob/master/undertaker.jpg?raw=true',
                             fit: BoxFit.fill,)
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Undertaker',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {audioPlayer.play(
                                    'https://raw.githubusercontent.com/NeeleshKumarSaini8/flutter_audios/master/The-Undertaker-WWE-Theme-Song.mp3');
                                                                                  }),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () { audioPlayer.pause();}),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () { audioPlayer.stop();}),
                                ],
                              ),
                                ],
                            ),

                            ),
                            
                          ],

                        ),
                      ),

                        ],  
                  )
                ),
              ),

              Card(
                child: Container(
                color: Colors.green.shade100,
                width: 400,
                height: 34,
                child: slider(),
                ),
              )
            ],
 
      ),
    
    );
  }
}
