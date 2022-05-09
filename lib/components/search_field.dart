import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  SearchFieldState createState() {
    return SearchFieldState();
  }
}

class SearchFieldState extends State<SearchField> {
  final TextEditingController queryTextController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: queryTextController,
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      onSubmitted: (String _) {
        //TODO: showResults(context);
      },
      decoration: InputDecoration(
        labelText: 'Search',
        labelStyle:
            TextStyle(color: focusNode.hasFocus ? Colors.blue : Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
