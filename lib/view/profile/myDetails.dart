import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/profile/edit_button.dart';
import 'package:flutter/material.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        centerTitle: true,
        title: Center(
          child: Text(
            "My Details",
            style: heading(
              20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: sizeof.size.height * 0.07),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: sizeof.size.height * 0.27,
                width: 20,
                color: Colors.amber,
              ),
            ),
          ),
          SizedBox(height: sizeof.size.height*0.03,),
          ListTile(
            leading: Icon(Icons.person),
            title: Center(
              child: Text(
                "name ",
                style: normalstyling(20),
              ),
            ),
          ),
          Divider(
            height: 15,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.mobile_friendly),
            title: Center(
              child: Text(
                "Mobile Number ",
                style: normalstyling(20),
              ),
            ),
          ),
          Divider(
            height: 15,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Center(
              child: Text(
                "Location ",
                style: normalstyling(20),
              ),
            ),
          ),
          Divider(
            height: 15,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Center(
              child: Text(
                "Date of birth ",
                style: normalstyling(20),
              ),
            ),
          ),
          SizedBox(height: sizeof.size.height*0.05,),
         editbutton(sizeof)
        ],
      ),
    );
  }
}
