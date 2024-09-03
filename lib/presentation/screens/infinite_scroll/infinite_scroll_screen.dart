import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

      List<int> imagesIds = [1,2,3,4,5];
      ScrollController scrollcontroller = ScrollController();
      bool isLoadingPage =false;
      bool isMounted =  true;


      @override
  void initState() {
    super.initState();

    scrollcontroller.addListener( (){

        if(scrollcontroller.position.pixels+500 >=   //posicion actual
        scrollcontroller.position.maxScrollExtent){ //hasta donde puede llegar
          loadNextPage();
        }
    });
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    isMounted = false;
    super.dispose();
  }


  Future loadNextPage()async{
    if(isLoadingPage) return;
    setState(() {
      isLoadingPage= true;
    });

    await Future.delayed(const Duration(seconds: 1));
    addFiveImages();

    // Revisar si el componente esta montado
    if(!isMounted) return;
    setState(() {
      isLoadingPage= false;
    });

    //Se valida porque la animacion de Scroll propensa a error al ejecutar Pull con onRefresh 
    if(!isMounted) return;
    moverScrollAAbajo();
  }


  Future<void> onRefresh()async{
    if(isLoadingPage) return;
    isLoadingPage=true;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 2));

    isLoadingPage = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    if(!isMounted) return;
    setState(() {});

    imagesIds.add(lastId+1);
    addFiveImages();
    if(!isMounted) return;
    setState(() {});

  }

  void moverScrollAAbajo(){
    if(scrollcontroller.position.pixels +150 <= scrollcontroller.position.maxScrollExtent) return;

    scrollcontroller.animateTo(
      scrollcontroller.position.pixels+120, 
      duration: const Duration(milliseconds: 600), 
      curve: Curves.fastOutSlowIn);
  }

  void addFiveImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map( (e) => lastId+e)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        //removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          displacement: 60,
          strokeWidth: 2,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: scrollcontroller,
            itemCount: imagesIds.length,
            itemBuilder: (context, index){
              return FadeInImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: const AssetImage( 'assets/images/jar-loading.gif'), 
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300'
                )
              );
            }
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.pop(),
        child: isLoadingPage
          ? SpinPerfect( infinite: true, child: const Icon( Icons.refresh_rounded))
          : FadeIn( child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}