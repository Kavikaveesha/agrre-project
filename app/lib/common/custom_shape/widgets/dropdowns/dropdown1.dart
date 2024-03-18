import 'package:flutter/material.dart';

class Dropdown1 extends StatefulWidget {
  const Dropdown1({
    Key? key,
    required this.listName,
    required this.selectedItem,
    required this.onItemSelected, // Add a callback for item selection
  }) : super(key: key);

  final List<String> listName;
  final String selectedItem;
  final Function(String)
      onItemSelected; // Callback function to handle item selection

  @override
  _Dropdown1State createState() => _Dropdown1State();
}

class _Dropdown1State extends State<Dropdown1> {
  late String _selectedItem; // New variable to hold the selected item

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem; // Initialize the new variable
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      value: _selectedItem,
      items: widget.listName.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        // Call the callback function provided in the widget with the selected value
        widget.onItemSelected(value!);
        // Update the selected category within the widget
        setState(() {
          _selectedItem = value;
        });
      },
    );
  }
}
