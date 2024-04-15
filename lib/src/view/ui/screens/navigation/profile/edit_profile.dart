import 'package:MoboPex/src/view/base_stateful_widget.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/resources.dart';
import 'package:flutter/material.dart';
class EditProfilePage extends StatelessWidget {
  final GlobalKey<NavigatorState> navKey ;

  const EditProfilePage({required this.navKey});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Edit Profile' , style: BaseTextStyle(
            color: ColorConstants.primaryColor ,
            fontSize: 24  ,
            fontWeight: FontWeight.w700
        )),
        centerTitle: true,
        leading: IconButton(icon:Icon( Icons.arrow_back) , onPressed: (){
          navKey.currentState!.pop();
        },),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text('Change Profile Photo'),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Name'),
            subtitle: Text('Jane Doe'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            title: Text('Username'),
            subtitle: Text('Jane.Doe'),
            trailing: Icon(Icons.edit),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("Personal Information" , style: BaseTextStyle(
              color: Colors.black  ,
              fontWeight: FontWeight.w700 ,
              fontSize: 20
            ),),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text('jane.doe@email.com'),
          ),
          ListTile(
            title: Text('Mobile'),
            subtitle: Text('9891619371'),
          ),
          ListTile(
            title: Text('Date of Birth'),
            subtitle: Text('11 Dec 1998'),
          ),
          Divider(),
        Center(
          child: TextButton(onPressed: (){},
              child: Text("Close Account" , style:BaseTextStyle(
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20
              ) ,)),
        )

        ],
      ),
    );
  }
}
