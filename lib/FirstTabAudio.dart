//import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter/material.dart';

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
   //   child: Image.asset('india-background.jpg'),
      
      child: Column(
        
        //children: <Widget>[
          //Row(
            //color: Colors.green,
            children: <Widget>[
              Card(//color: Colors.green,
              
                child: Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                          //Image.network(
                            //'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcST9p6BnmYHfVDlt_z_wSe_rjl57PyzxBJOhg&usqp=CAU',
                             //fit: BoxFit.fill,)
                          Image.asset('images/jai ho A.R Rehman.jfif',fit: BoxFit.fill,),
                      ),
                      Container(
                        /*alignment: Alignment.topCenter,
                        width: 300,
                        height: 100,
                      
                        color: Colors.amber,
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Jai Ho'),*/
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              //color: Colors.orange,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Jai Ho A.R. Rahman',style: TextStyle(
        //fontSize: 40,
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
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.play_arrow), label: Text('play'),color: Colors.green,),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.pause), label: Text('pause')),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.stop), label: Text('stop')),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () {
                                                                        advancedPlayer.pause();
                                                                       // audio = AudioPlayer();
                                                                        //audio.pause();
                                                                },),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () {
                                                                        advancedPlayer.stop();
                                                                }),
                                //slider(),
                                ],
                              ),
                                ],
                            ),


                            ),
                            /*//Container(
                              //width: 300,
                              //height: 34,
                              //color: Colors.green.shade100,
                              //child: /*Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //children: <Widget>[
                                  //IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
                                  									//audioCache.play('Jai Ho A.R. Rahman.mp3');},),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.play_arrow), label: Text('play'),color: Colors.green,),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.pause), label: Text('pause')),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.stop), label: Text('stop')),
                                  //IconButton(icon: Icon(Icons.pause), onPressed: () {
                                    //                                    advancedPlayer.pause();
                                                                       // audio = AudioPlayer();
                                                                        //audio.pause();
                                                                },),
                                 // IconButton(icon: Icon(Icons.stop), onPressed: () {
                                   //                                     advancedPlayer.stop();
                                 //                               }),*/
                                //slider(),
                               // ],
                              //),
                            //)*/
                          ],

                        ),
                      ),
                        //  Container(
                          //color: Colors.orange,
                          //width: 300,
                        //height: 50,
                        //alignment: Alignment.bottomLeft,
                        //child: RaisedButton.icon(onPressed: null, icon: Icon(Icons.play_arrow), label: Text('play'))

                        //  )
                        ],
                        
                  )
                ),
              ),

              Card(
                child: Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                          //Image.network(
                            //'https://m.media-amazon.com/images/M/MV5BZjAzZjZiMmQtMDZmOC00NjVmLTkyNTItOGI2Mzg4NTBhZTA1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg',
                            // fit: BoxFit.fill,)
                          Image.asset('images/MS Dhoni Besabriyan.jpg',fit: BoxFit.fill,)
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              //color: Colors.orange,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Besabriyaan',style: TextStyle(
                                                  //fontSize: 40,
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
                            /*Container(
                              width: 300,
                              height: 34,
                              child: slider(),
                               // ],
                              //),
                            )*/
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
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                          //Image.network(
                           // 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTxjEo4nj9LGNXEosyVuYUV6mi3JzrGAmxZhg&usqp=CAU',
                            // fit: BoxFit.fill,)
                          Image.asset('images/Alan Walker Spectre.jfif',fit: BoxFit.fill,)
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              //color: Colors.orange,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Alan Walker Spectre',style: TextStyle(
                                                  //fontSize: 40,
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
                            /*Container(
                              width: 300,
                              height: 34,
                              child: slider(),
                               // ],
                              //),
                            )*/
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
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                          //Image.network(
                            //'https://s.yimg.com/ny/api/res/1.2/eGrSgD4L9YOr_ABP4qTBdg--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/http://media.zenfs.com/en-US/homerun/rollingstone.com/b5cfc47e8065ac69e01424aaf7c1d3ac',
                             //fit: BoxFit.fill,)
                                Image.asset('images/Believer Imagine Dragons.jpg',fit: BoxFit.fill,)                                    
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              //color: Colors.orange,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Believer Imagine Dragons',style: TextStyle(
                                                  //fontSize: 40,
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
                            /*Container(
                              width: 300,
                              height: 34,
                              child: slider(),
                               // ],
                              //),
                            )*/
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
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                         // Image.network(
                           // 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0N_jzHQmEQ0lD9qkwpjROPLlfuLBwPg39zw&usqp=CAU',
                             //fit: BoxFit.fill,)
                          Image.asset('images/Bharat Manikarnika.jfif',fit: BoxFit.fill,)
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 66,
                              //color: Colors.orange,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text('Bharat Manikarnika Prasoon Joshi',style: TextStyle(
                                                  //fontSize: 40,
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
                            /*Container(
                              width: 300,
                              height: 34,
                              child: slider(),
                               // ],
                              //),
                            )*/
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
            
          //)
        //],
        
      ),
    
    );
  }
}

/*typedef void OnError(Exception exception);

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
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  /*a() async {
   
    audio = await AudioCache().play('Jai Ho A.R. Rahman.mp3');                                     
    
      audio.play('Jai Ho A.R. Rahman.mp3');  
  }*/

  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

     advancedPlayer.onDurationChanged.listen((Duration d) {
    print('Max duration: $d');
    setState(() => _duration = d);
  });

    advancedPlayer.onAudioPositionChanged.listen((Duration  p) => {
    print('Current position: $p');
    setState(() => _position = p);
  });

    void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
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


  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    return Container(
      
   /* );
  }
  }


  class AssetsAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(*/
      color: Colors.amber,
      child: Column(
        //children: <Widget>[
          //Row(
            //color: Colors.green,
            children: <Widget>[
              Card(//color: Colors.green,
              
                child: Container(
                  width: 400,
                  height: 100,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: //Icon(Icons.music_note),
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcST9p6BnmYHfVDlt_z_wSe_rjl57PyzxBJOhg&usqp=CAU',
                             fit: BoxFit.fill,)
                          
                      ),
                      Container(
                        /*alignment: Alignment.topCenter,
                        width: 300,
                        height: 100,
                      
                        color: Colors.amber,
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Jai Ho'),*/
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 50,
                              //color: Colors.orange,
                              alignment: Alignment.topCenter,
                              child: Text('Jai Ho A.R. Rahman'),
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              //color: Colors.green.shade100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.play_arrow), onPressed: () {
                                  									audioCache.play('Jai Ho A.R. Rahman.mp3');},),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.play_arrow), label: Text('play'),color: Colors.green,),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.pause), label: Text('pause')),
                                  //RaisedButton.icon(onPressed: null, icon: Icon(Icons.stop), label: Text('stop')),
                                  IconButton(icon: Icon(Icons.pause), onPressed: () {
                                                                        advancedPlayer.pause();
                                                                       // audio = AudioPlayer();
                                                                        //audio.pause();
                                                                },),
                                  IconButton(icon: Icon(Icons.stop), onPressed: () {
                                                                        advancedPlayer.stop();
                                                                }),
                                slider(),
                                ],
                              ),
                            )
                          ],

                        ),
                      ),
                        //  Container(
                          //color: Colors.orange,
                          //width: 300,
                        //height: 50,
                        //alignment: Alignment.bottomLeft,
                        //child: RaisedButton.icon(onPressed: null, icon: Icon(Icons.play_arrow), label: Text('play'))

                        //  )
                        ],
                        
                  )
                ),
              ),
              Card(color: Colors.green,
              
                child: Container(
                  width: 400,
                  height: 100,
                  child: Text('data'),
                )
              ),
              Card(color: Colors.green,
              
                child: Container(
                  width: 400,
                  height: 100,
                  child: Text('data'),
                )
              )
            ],
            
          //)
        //],
      ),
    );
  }
}}*/