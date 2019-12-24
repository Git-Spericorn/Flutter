import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/NotificationModel.dart';
import 'api/ApiEndPoints.dart';

class NotificationClass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NotificationStateClass();
  }

}

class NotificationStateClass extends State<NotificationClass>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Future<List<NotificationModel>> _getNotifications() async{

      final response = await http.get(BASE_URL);
      print(response.body);
      return getNotificationList(response.body);
    }


    Card _makeCardForList(String title,String body){

      return new Card(

        elevation: 4,
        color: Colors.white,
        margin: EdgeInsets.all(10.0),
        child: new Container(

          padding: EdgeInsets.all(10.0),

          child: new ListTile(

              title: Text(title,style: TextStyle(fontStyle: FontStyle.italic),),
              subtitle: Text(body,style: TextStyle(fontStyle: FontStyle.normal),),

            ),

          ),
        );
    }

    return Scaffold(

      body: FutureBuilder<List<NotificationModel>>(

        future: _getNotifications(),
        builder: (context,snapshot){

          if(snapshot.connectionState == ConnectionState.done){

            if(snapshot.hasError){

              return Center(

                child: Text("Error Occured"),
              );

            }else{


             return ListView.builder(

             shrinkWrap: true,
             itemCount: snapshot.data.length,
             scrollDirection: Axis.vertical,
             padding: EdgeInsets.all(10.0),

             itemBuilder: (BuildContext context, int index){

               return new Container(

                 child: _makeCardForList(snapshot.data[index].title,snapshot.data[index].body),
               );
             }

             );

            }
          }else{

            return Center(

              child: CircularProgressIndicator(),
            );
          }
        },

      )
    );
  }


}



