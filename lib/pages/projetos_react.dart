import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class PageReact extends StatefulWidget {
  const PageReact({
    Key? key,
    this.title = 'Chewie Demo',
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _PageReactState();
  }
}

class _PageReactState extends State<PageReact> {
 
  late VideoPlayerController _videoPlayerController1;
  
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.asset('assets/videos/mercadinho.MP4');
    
    await Future.wait([
      _videoPlayerController1.initialize(),
      
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projeto React Native'),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Ionicons.logo_whatsapp,
          size: 37,
        ),
        onPressed: () async {
          const url = 'https://wa.me/5511982255485';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'O endereço não pode ser exibido';
          }
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Carregando'),
                      ],
                    ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(
                '''Acima o Projeto React Native realizado para um mercadinho do nordeste.
Tivemos como objetivo demonstrar todos produtos do mercado e proporcionar ao cliente que ele
pudesse adicionar e remover os produtos, além de possibilitar realização de login e utlização
 de banco de dados utilizando Firebase. ''',style: TextStyle(fontSize: 16, fontFamily:'Abril', color: Colors.white   ), textAlign: TextAlign.left, ),
          ),
        ],
      ),
    );
  }
}
