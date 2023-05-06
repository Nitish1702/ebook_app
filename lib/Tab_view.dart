import 'package:flutter/material.dart';

class Tab_View extends StatelessWidget {
  final List images;
  const Tab_View( this.images,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length==0?0:images.length,
        itemBuilder: (_,i){
          return Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white38,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color:Colors.white10,
                    offset: Offset(0,0),
                  )
                ],
              ),
              child:Row(
                children:[
                  Container(
                    width:90,
                    height: 120,
                    margin: EdgeInsets.all(8),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white10,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          // color:Colors.white10,
                          offset: Offset(0,0),
                        )
                      ],
                      image: DecorationImage(
                          image: AssetImage(images[i]['image']),
                          fit:BoxFit.fill
                      ),
                    ) ,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(

                            children:[Icon(Icons.star,color: Colors.amber,),
                              Text(images[i]['rating'],style:TextStyle(color: Colors.amber,))
                            ]
                        ),
                        Text(images[i]['title'],style:TextStyle(fontSize: 16,fontFamily: "Avenir",fontWeight: FontWeight.bold)),
                        Text(images[i]['Author'],style:TextStyle(fontSize: 16,fontFamily: "Avenir",color: Colors.grey)),
                        Container(
                          width:60 ,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.blue
                          ),
                          child:
                          Text(images[i]['genre'],style:TextStyle(fontSize: 16,fontFamily: "Avenir",color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )

                ] ,
              )
          );
        });
  }
}
