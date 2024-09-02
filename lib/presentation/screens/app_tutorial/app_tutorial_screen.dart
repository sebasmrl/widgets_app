
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title, caption, imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}


final slides =  <SlideInfo>[
  SlideInfo(title: "Busca la comida", caption: 'Anim dolore sit ex officia ex laboris enim eiusmod occaecat incididunt non officia.', imageUrl: 'assets/images/1.png'),
  SlideInfo(title: "Entrega rapida", caption: 'Ea aliquip est non exercitation ullamco aliquip ipsum id ex deserunt amet.', imageUrl: 'assets/images/2.png'),
  SlideInfo(title: "Disfruta la comida", caption: 'Consectetur laborum ex fugiat magna et Lorem et excepteur culpa et non.', imageUrl: 'assets/images/3.png'),
];


class AppTutorialScreen extends StatefulWidget {

  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageViewController; 
  bool endReached = false;
  int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();

    pageViewController.addListener( (){
      final page = pageViewController.page ?? 0;
      //print('$page');
      if( !endReached && page >= (slides.length-1.5)){ //el boton empezar aparezca media pagina antes de la ultima
        setState(() {
          endReached = true;
        });
      }

      // Actualizar pageNumber para render de radioButton seleccionado
      if(page % 1 ==0){
        setState(() {
          pageNumber = page.round().toInt();  
        });
      }

    });
  }


  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map( 
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
              ).toList(),
          ),

          Positioned(
            top: 50,
            right: 10,
            child: TextButton(
              onPressed: ()=>context.pop(), 
              child: const Text('Salir')
            ),
          ),

          endReached 
            ? Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from:15,
                delay: const Duration(milliseconds: 500),
                child: FilledButton(
                  onPressed: ()=> context.pop(),
                  child: const Text('Empezar'),
                ),
              )
            ): const SizedBox(),

  
            
            Column(
              children: [
                const SizedBox(height: 700,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: slides.map( (data){
                    return Radio(
                      value: slides.indexOf(data),
                      groupValue: pageNumber, 
                      onChanged: (value){
                        setState(() {
                          pageNumber = value ?? 0;
                          pageViewController.animateToPage(
                            pageNumber, 
                            duration:const Duration(milliseconds: 500), 
                            curve: Curves.ease
                          );
                        });
                      } 
                    );
                  }).toList()
                  ),
              ],
            ),
            
        ],
      )
    );
  }
}






class _Slide extends StatelessWidget {

  final String title, caption, imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20,),
          Text( title, style: titleStyle,),
          const SizedBox( height: 10),
          Text(caption, style: captionStyle,),
        ],
      ),
    );  
  }
}