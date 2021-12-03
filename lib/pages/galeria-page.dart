import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PageGaleria extends StatefulWidget {
  @override
  _PageGaleriaState createState() => _PageGaleriaState();
}

class _PageGaleriaState extends State<PageGaleria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.amber,
        title: Container(
          child: Text("Galeria de Fotos"),
        
      ),),
      backgroundColor: Colors.black,
      body: GridView.builder(
          
          padding: EdgeInsets.all(5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: fotos.length,
          itemBuilder: (BuildContext context, int index) {
            final foto = fotos[index];
            return Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ImagePage(foto.image);
                  }));
                },
                child: Image.asset(foto.image),
              ),
            );
          }),
    );
  }
}

class ImagePage extends StatelessWidget {
  final String id;
  ImagePage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.blue,
      
      body: Center(child: Image.asset(id)),
    );
  }
}

class Galeria {
  String image;

  Galeria({
    required this.image,
  });
}

final fotos = [
  Galeria(
    image: "1.jpg",
  ),
  Galeria(
    image: "2.jpg",
  ),
  Galeria(
    image: "3.jpg",
  ),
  Galeria(
    image: "4.jpg",
  ),
  Galeria(
    image: "6.jpg",
  ),
  Galeria(
    image: "7.jpg",
  ),
  Galeria(
    image: "8.gif",
  ),
  Galeria(
    image: "9.jpg",
  ),
  Galeria(
    image: "10.gif",
  ),
  Galeria(
    image: "11.png",
  ),
  Galeria(
    image: "12.jpg",
  ),
  Galeria(
    image: "13.jpg",
  ),
  Galeria(
    image: "14.jpg",
  ),
  Galeria(
    image: "15.jpg",
  ),
  Galeria(
    image: "16.jpg",
  ),
  Galeria(
    image: "17.jpg",
  ),
  Galeria(
    image: "18.jpg",
  ),
  Galeria(
    image: "19.gif",
  ),
  Galeria(
    image: "20.jpg",
  ),
  Galeria(
    image: "21.jpg",
  ),
  Galeria(
    image: "22.gif",
  ),
    Galeria(
    image: "23.gif",
  ),
  Galeria(
    image: "24.jpg",
  ),
  Galeria(
    image: "25.gif",
  )
  
];
