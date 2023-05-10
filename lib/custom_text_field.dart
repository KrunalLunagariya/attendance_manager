import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.controller, this.errorText, this.prefixIcon, this.hintText, this.obscureText, this.onChanged}) : super(key: key);
  final Widget? prefixIcon;
  final String? hintText;
  final bool? obscureText;
  final String? errorText;
  final TextEditingController? controller;
final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) => SizedBox(
     child: TextFormField(
      //*** Password hide ***//
      obscureText: obscureText ?? false,
      controller: controller,
       validator: (value){
         if(value!.isEmpty){
           return '* Required';
         }else{
           return null;
         }
       },
       onChanged:onChanged,
      decoration: InputDecoration(
        filled: true, //<-- SEE HERE
        fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.all(8),
        prefixIcon: prefixIcon,
      errorText: errorText,
      ),
    ));

}
