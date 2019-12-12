import 'package:flutter/material.dart';
import 'package:flutter_app/helper/helper.dart';
import 'package:flutter_app/PostDetails.dart';

//Main Function
void main(){

  //Returning the Main class which consists of the UI & Business logic.
  runApp(MyProfile());

}

//Class (Stateless) that consists of the UI & Business logic.
class MyProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //Declaring URL for displaying image & tag for hero animation (Shared Element Transition).
    String imgURL = "https://picsum.photos/500/500/?random";
    String heroTag = "TappedImage";

    //Creating a profile picture widget in Circle shape.
    final profilePicture = CircleAvatar(

      backgroundColor: Colors.transparent,
      radius: 40.0,
      child: appLogo,
    );

    //Creating a Container widget with padding to accomodate profilePicture.
    final paddedProPic = Container(

      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 24.0),
      child: profilePicture,
    );

    //Creating a Text Widget for showing profile name.
    final profileName = Text(

      "Anuraganu Punalur",
      style: TextStyle(color: Colors.black,fontSize: 20.0,
        fontStyle: FontStyle.italic,),);

    //Creating a Container widget with padding to accomodate profileName.
    final paddedProName = Container(

      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: profileName,
    );

    //Creating a padding widget for showing the "Followers" text.
    final textFollowers = Padding(

        padding: EdgeInsets.all(8.0),

        child: Container(

          alignment: Alignment.topLeft,
          child: Text(
            "Followers",style: TextStyle(color: Colors.brown,fontSize: 18.0,fontWeight: FontWeight.bold),),
        ));

    //Creating a padding widget for showing the "Hearts" text.
    final textHeart = Padding(

        padding: EdgeInsets.all(8.0),

      child: Container(

        alignment: Alignment.topRight,
        child: Text(
         "Hearts",style: TextStyle(color: Colors.brown,fontSize: 18.0,fontWeight: FontWeight.bold),),

    ));

    //Creating a Text widget for showing the no. of followers.
    final followersNum = Text(

    "2K",style: TextStyle(color: Colors.black,fontSize: 15.0,),
    );

    //Creating a Text widget for showing the no. of hearts.
    final heartsNum = Text(

    "12K",style: TextStyle(color: Colors.black,fontSize: 15.0,),
    );

    //Creating a Container widget for accomodating followersNum.
    final followerNumContainer = Container(

    alignment: Alignment.center,
    child: followersNum,
    );

    //Creating a Container widget for accomodating heartsNum.
    final heartNumContainer = Container(

    alignment: Alignment.center,
    child: heartsNum,
    );

    //Creating a Row widget for accomodating textFollowers & textHeart.
    final profileLabelsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

          textFollowers,
            textHeart,

      ],
    );

    //Creating a Row widget for accomodating followerNumContainer & heartNumContainer.
    final profileValuesRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        followerNumContainer,
        heartNumContainer,
      ],
    );

    //Creating a Container widget for accomodating a vertical grey divider.
    final verticalDividerContainer = Container(

      child: VerticalDivider(

        width: 1.0,
        color: Colors.grey,
      ),
    );

     //Creating a Card widget for accomodating profileLabelsRow, verticalDividerContainer, profileValuesRow within a Column.
     final profileDetailsCard = Card(

       elevation: 4.0,
       margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
       child: Container(

         padding: EdgeInsets.all(15.0),
         decoration: BoxDecoration(color: Colors.white),

         child: Column(

           children: <Widget>[

              profileLabelsRow,
              verticalDividerContainer,
              profileValuesRow,
           ],
         ),
       ),
     );

     //Creating a Container function to display the given text as argument.
     Container _createText(String textToDisplay){

       return new Container(

         alignment: Alignment.center,
         padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
         child: Text(textToDisplay),
       );
     }

     //Creating a function to display given message in a SnackBar.
     void _createSnackBar(String snackMessage){

       final scaffold = Scaffold.of(context);
       scaffold.showSnackBar(new SnackBar(content : new Text(snackMessage),action: SnackBarAction(label: "OK", onPressed: (){

         scaffold.hideCurrentSnackBar();

       }),));
     }
    
    //Creating a GridView widget for displaying images from network within the CardView widget.
    final makeGridPosts = GridView.count(crossAxisCount: 3,

    shrinkWrap: true,
    physics: ScrollPhysics(),
    scrollDirection: Axis.vertical,
    children: List.generate(30, (index){

      return Card(

        elevation: 4,
        color: Colors.blueGrey,
        margin: EdgeInsets.all(5.0),

        child: InkWell(

          onTap: (){

            Navigator.push(context, MaterialPageRoute(fullscreenDialog: true,builder: (context) => PostDetails(imgURL,heroTag+String.fromCharCode(index))));

          },

          onDoubleTap: (){

            _createSnackBar("You liked this post");
          },

          child: Hero(tag: heroTag+String.fromCharCode(index),

            child: Container(

            child: Image.network(imgURL,),

          ),),

        ),

      );
    }),
    );

    //Returing Scaffold as main screen style and accomodating the above widgets within a ListView widget.
    return new Scaffold(

        body: Center(

          child: ListView(

            scrollDirection: Axis.vertical,
            children: <Widget>[

              paddedProPic,
              paddedProName,
              profileDetailsCard,
              _createText("Do what you love ;)"),
              _createText("Popular Posts"),

                makeGridPosts,
            ],
          ),
        ),
    );

  }


}
