import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: heading(20),
        ),
      ),
      backgroundColor: maincolor,
      body: Column(
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  tileColor: secondColor,
                  title: Row(
                    children: [
                      Text(
                        "Red Velvet Cake",
                        style: normalstyling(15),
                      ),
                      SizedBox(
                        width: sizeof.size.width * 0.5,
                      ),
                      Container(
                        height: 10,
                        width: 4,
                        color: Colors.red,
                      )
                    ],
                  ) // Example text for demonstration
                  ,
                  subtitle: Row(
                    children: [
                     Container(height: 4,width: 5,color: Colors.grey,),
                     SizedBox(width: 5,),
                     Text("₹ 2999",style:normalstyling(15) ,),
                     
                    ],
                  ),
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.all(1),
            alignment: Alignment.center,
            child: Text(
              'Additional Content Below List',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
