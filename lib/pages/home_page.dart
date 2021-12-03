import 'package:flutter/material.dart';
import 'package:projetoflutter1/pages/galeria-page.dart';
import 'package:projetoflutter1/pages/projetos_css.dart';
import 'package:projetoflutter1/pages/projetos_html.dart';
import 'package:projetoflutter1/pages/projetos_java.dart';
import 'package:projetoflutter1/pages/projetos_react.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ionicons/ionicons.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  circleImage() {
    return Center(
      child: new Container(
        width: 190.0,
        height: 190.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("rsantos.jpeg"))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'monospace',
                      color: Colors.white)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('portfolio.jpg'), fit: BoxFit.cover)),
            ),
            ListTile(
              leading: Icon(Ionicons.logo_html5),
              title: Text('Html'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageHtml(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Ionicons.logo_css3),
              title: Text('Html + CSS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageCss(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Ionicons.logo_javascript),
              title: Text('Html + CSS + JS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageJava(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Ionicons.logo_react),
              title: Text('React Native'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageReact(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Ionicons.image_outline),
              title: Text('Galeria de Fotos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageGaleria(),
                  ),
                );
              },
            ),
            
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(15, 15, 60, 100),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Meu Portifólio',
                style: TextStyle(
                    fontFamily: 'Abril', fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
              circleImage(),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                     
                      child: Text(
                        ' Rodrigo Santos ',
                        style: TextStyle(fontSize: 35, fontFamily: 'Abril'),
                      )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                       child: Text(
                      'Desenvolvedor Front End',
                      style: TextStyle(fontSize: 15, fontFamily: 'Abril'),
                    )),
                  ]),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(Ionicons.logo_linkedin,size: 35,),
                      onPressed: () async {
          const url = 'https://www.linkedin.com/in/rodrigosoaressantos/';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'O endereço não pode ser exibido';
          }
        },
                    ),
                  ),
                  SizedBox(width: 14),
                  Container(
                    child: IconButton(
                      icon: Icon(Ionicons.logo_github,size: 35,),
                      onPressed: () async {
          const url = 'https://github.com/rssantos07';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'O endereço não pode ser exibido';
          }
        },
                    ),
                  ),
                  SizedBox(width: 14),
                 Container(
                    child: IconButton(
                      icon: Icon(Ionicons.logo_whatsapp,size: 35,),
                      onPressed: () async {
          const url = 'https://wa.me/5511xxxxxxxxx';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'O endereço não pode ser exibido';
          }
        },
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
