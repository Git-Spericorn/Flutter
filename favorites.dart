import 'package:flutter/material.dart';

void main(){

  runApp(FavoritesClass());
}

class FavoritesClass extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final makeList = ListTile(

      contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),

      leading: Container(

        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
          border: new Border(right: new BorderSide(color: Colors.grey,width: 1.0))
        ),
        child: Icon(Icons.favorite,color: Colors.redAccent,size: 45.0,),
      ),

      title: Text("Anuraganu Punalur",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
      subtitle: Row(

        children: <Widget>[

          Icon(Icons.people),
          Text("Tap to visit profile"),
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right,size: 30.0,),

    );


    final makeCardView = Card(

      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
      child: Container(decoration: BoxDecoration(color: Colors.white),
        child: makeList,),
    );

    final makeBodyForCard = Container(

      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context,int index){

          return makeCardView;
        },),
    );

    return new Scaffold(

      body: Center(

        child: makeBodyForCard,
        //child: Text('Favorites',style: TextStyle(color: Colors.amber,fontSize: 20.0,fontStyle: FontStyle.italic),),
      ),
    );
  }


}