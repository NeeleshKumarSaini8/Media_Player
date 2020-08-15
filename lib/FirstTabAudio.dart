import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

void main() {
  runApp(new MaterialApp(home: new AssetsAudio()));
}

class AssetsAudio extends StatefulWidget {
  @override
  _AssetsAudioState createState() => new _AssetsAudioState();
}

class _AssetsAudioState extends State<AssetsAudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer ;
  AudioCache audioCache;

  @override
  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
    _position = p;
    });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
        minWidth: 48.0,
        child: RaisedButton(child: Text(txt), onPressed: onPressed));
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

  Widget localAsset() {
    return _tab([
      Text('Play Local Asset \'audio.mp3\':'),
      _btn('Play', () => audioCache.play('audio.mp3')),
      _btn('Pause',() => advancedPlayer.pause()),
      _btn('Stop', () => advancedPlayer.stop()),
      slider()
    ]);
  }

  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Colors.green.shade100,      
      child: Column(
            children: <Widget>[
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
                          Image.asset('images/jai ho A.R Rehman.jfif',fit: BoxFit.fill,),
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
                                  Text('Jai Ho A.R. Rahman',style: TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = Colors.blue[800],
      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
                                  									audioCache.play('Jai Ho A.R. Rahman.mp3');},),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () {
                                                                        advancedPlayer.pause();
                                                                },),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () {
                                                                        advancedPlayer.stop();
                                                                }),
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
                          Image.asset('images/MS Dhoni Besabriyan.jpg',fit: BoxFit.fill,)
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
                                  Text('Besabriyaan',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
                                  									audioCache.play('Besabriyaan.mp3');},),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () {
                                                                        advancedPlayer.pause();
                                                                },),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () {
                                                                        advancedPlayer.stop();
                                                                }),
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
                          Image.asset('images/Alan Walker Spectre.jfif',fit: BoxFit.fill,)
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
                                  Text('Alan Walker Spectre',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
                                  									audioCache.play('Alan-Walker-Spectre.mp3');},),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () {
                                                                        advancedPlayer.pause();
                                                                },),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () {
                                                                        advancedPlayer.stop();
                                                                }),
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
                                Image.asset('images/Believer Imagine Dragons.jpg',fit: BoxFit.fill,)                                    
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
                                  Text('Believer Imagine Dragons',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
                                  									audioCache.play('Believer Mp3 Imagine Dragons.mp3');},),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () {
                                                                        advancedPlayer.pause();
                                                                },),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () {
                                                                        advancedPlayer.stop();
                                                                }),
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
                          Image.asset('images/Bharat Manikarnika.jfif',fit: BoxFit.fill,)
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
                                  Text('Bharat Manikarnika Prasoon Joshi',style: TextStyle(
                                                  foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.blue[800],
                                      ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
                                  									audioCache.play('Bharat _ Manikarnika _ Kangana Ranaut _ Shankar Ehsaan Loy _Recited By -Prasoon Joshi.mp3');},),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () {
                                                                        advancedPlayer.pause();
                                                                },),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () {
                                                                        advancedPlayer.stop();
                                                                }),
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
