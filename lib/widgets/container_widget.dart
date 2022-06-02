import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Map poke;

  const ContainerWidget({Key? key,required this.poke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin: const EdgeInsets.fromLTRB(5,10,5,5),
      child: Ink(
         decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(137, 203, 139, 1),
      ),
        child: InkWell(
          onTap: (){},
          child: Stack(
            children:[ 
              Positioned(
              right: 5,
              bottom: 5,
              child: Image.network(poke['img'],width: 100,height: 100,)),
              Positioned(
              left: 20,
              top: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(poke['name'], style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                for(var i in poke['type'])(Text(i, style: const TextStyle(color: Colors.white,fontSize:20),))    
                ],
              ),
            ),
            
            ],
          ),
        ),
      ),
    );
  }
}
