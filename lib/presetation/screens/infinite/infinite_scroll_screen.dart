import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  //static const name = "infinte_scroll_screen";
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [1,2,3,4,5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;


  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      
      // con esto se obtiene el maximo scroll del scrollController es decir el length
      if((scrollController.position.pixels +500) >= scrollController.position.maxScrollExtent){
        //Load next page
        loadNextPage();
      }
      
    });

  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async{
    
    if(isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if(!isMounted) return;

    setState(() {});
    
    moveScrollToBotton();
  }

  Future<void> onRefreshPage() async{
    
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;
 
    final lastId = imagesIds.last;
    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() { });

  }
  
  void moveScrollToBotton(){
    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 120,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );
  }

  void addFiveImages(){
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e)=> lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    //Los permisossss bro los permisossss 
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, //remueve el padding del status bar
        removeBottom: true, //remueve el padding del navigation bar
        child: RefreshIndicator( //widget que permite hacer un refresh en la pantalla
          onRefresh: onRefreshPage,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index){
              return FadeInImage(
                fit: BoxFit.cover, //para que la imagen se ajuste al tamaño del contenedor
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage("assets/images/jar-loading.gif"), //con AssetImage se obtiene la imagen de la carpeta assets
                image: NetworkImage("https://picsum.photos/id/${imagesIds[index]}/500/300"),
              );
            } 
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:( ){ if (!isLoading) context.pop();}, 
        child:  isLoading ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded)
          
        ): FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),  
      ),
    );
  }
}