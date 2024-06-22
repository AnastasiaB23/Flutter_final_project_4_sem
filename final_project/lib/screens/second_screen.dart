import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';



String URLs(int number){
  switch(number){
    case 1:
      return "https://sun6-20.userapi.com/impg/aEtrl6oaHvvb16HUjpbBrWNlrt9H-QiMrT5WMw/Sd_F1ubrL_8.jpg?size=1052x565&quality=96&sign=2c9bb1a846c30f661d2fb530e802d3f0&c_uniq_tag=d-mCXEMW7egjG6JKRGVOyV3X8TPgUrAVqZmcmTeLUlk&type=album";
    case 2:
      return "https://sun9-60.userapi.com/impg/c854224/v854224786/1d36c3/CJgztsL8zLg.jpg?size=1015x984&quality=96&sign=eeb5c8aec8f9e68cd540f7e69b5e4265&c_uniq_tag=xJQoXQRCFbOuaDu9g4fYOJta8MsMpDn3CsWsgHMujrA&type=album";
    case 3:
      return "http://images.squarespace-cdn.com/content/v1/61217ce8fdf93f3b96d940ac/42616478-c4ad-40d6-b454-67b55d390b50/amanda-sandlin-10508.jpg";
    case 4:
      return "https://sun9-25.userapi.com/impf/c856024/v856024255/fa364/rQoqEhj_Ktc.jpg?size=900x550&quality=96&sign=6d668e9d49782bcf91c6559d2c9f8b3e&c_uniq_tag=Vh6Cc-8CzGWrfkzVRFO_3D2Mv4_2QaRAY9d1sQu9xHM&type=album";
    case 5:
      return "https://pic.rutubelist.ru/video/01/e4/01e493e4a718dc7a61e5a52fab23d3f3.jpg";
    default:
      return "URL didn't found(";
  }
}


CachedNetworkImage _cachedNetworkImage(int number){
 return CachedNetworkImage(imageUrl: URLs(number),
    errorWidget: (context, url, error)=>const Center(
      child: Icon(
        Icons.error,
        color: Colors.red,
      ),
    ),

 );

}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _cachedNetworkImage(1),
          _cachedNetworkImage(2),
          _cachedNetworkImage(3),
          _cachedNetworkImage(4),
          _cachedNetworkImage(5),
        ],
      ),
    );
  }
}

