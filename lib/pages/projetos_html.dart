import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class PageHtml extends StatefulWidget {
  const PageHtml({
    Key? key,
    this.title = 'HTML',
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _PageHtmlState();
  }
}

class _PageHtmlState extends State<PageHtml> {
 
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.asset('assets/videos/cinema.MP4');
    _videoPlayerController2 =
        VideoPlayerController.asset('assets/videos/cinema.MP4');
    await Future.wait([
      _videoPlayerController1.initialize(),
      _videoPlayerController2.initialize()
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
        title: Text('Projeto HTML'),
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
                '''Acima o primeiro trabalho realizados em HTML, aplicando conteúdo aprendido em curso.
Nota-se que começamos do básico empregando o uso do html apenas.''',style: TextStyle(fontSize: 16, fontFamily:'Abril', color: Colors.white  ), textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }
}
