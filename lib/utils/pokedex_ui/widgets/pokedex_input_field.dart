import 'package:flutter/material.dart';

class PokedexInputField extends StatelessWidget {
  const PokedexInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (v) {},
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        disabledBorder: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: Icon(Icons.close),
        prefixIcon: Icon(Icons.search),
        hintText: "Search",
        contentPadding: EdgeInsets.all(15.0),
      ),
    );
  }
}
