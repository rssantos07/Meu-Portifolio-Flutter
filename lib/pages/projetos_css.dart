import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class PageCss extends StatefulWidget {
  const PageCss({
    Key? key,
    this.title = 'CSS',
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _PageCssState();
  }
}

class _PageCssState extends State<PageCss> {
 
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
        VideoPlayerController.asset('assets/videos/imobiliaria.MP4');
    
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
        title: Text('Projeto CSS'),
      ),
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
      backgroundColor: Colors.black,
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
                '''Acima projeto  realizado em grupo utilizando o CSS para estilizar a pagina HTML.
O CSS é uma "folha de estilo"
composta por “camadas” e utilizada para definir a apresentação (aparência)em páginas da internet que adotam 
para o seu desenvolvimento linguagens de marcação.''',style: TextStyle(fontSize: 16, fontFamily:'Abril',color: Colors.white), textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }
}
