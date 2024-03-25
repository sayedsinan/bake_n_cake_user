
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String messeage;
  const ChatBubble({super.key, required this.messeage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50,
        ),
        color: Colors.blue,
      ),
      child: Text(messeage,style: normalstyling(15),),
    );
  }
}
