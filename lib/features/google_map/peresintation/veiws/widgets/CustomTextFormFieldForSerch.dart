import 'package:flutter/material.dart';

import 'ListviewforListtileBlocBiulder.dart';


class CustomtextformfieldForSearchAndList extends StatelessWidget {
  const CustomtextformfieldForSearchAndList({super.key, required this.hinttext,  required this.textEditingController,});
  final String hinttext;
  final TextEditingController textEditingController;


  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Column(
        children: [
          TextFormField(
           controller: textEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:const EdgeInsets.symmetric(horizontal: 16) ,
              filled: true,
              fillColor: Colors.white,
              border: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              hintText: hinttext,
              //helperStyle: AppStyle.bold13.copyWith(color: const Color(0xFF949D9E)),
            ),
          ),
          const ListviewforListtileBlocBiulder()
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
