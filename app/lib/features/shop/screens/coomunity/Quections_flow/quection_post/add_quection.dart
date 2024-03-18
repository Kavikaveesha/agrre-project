import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String selectedCategory = 'Select Category';
  bool askQuestion = false;

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final Brightness brightness = Theme.of(context).brightness;

    Color backgroundColor;
    if (brightness == Brightness.light) {
      backgroundColor = Colors.white; // Light mode background color
    } else {
      backgroundColor = Colors.black54; // Dark mode background color
    }

    return InkWell(
      onTap: () {
        setState(() {
          askQuestion = !askQuestion;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: backgroundColor, // Set the background color here
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Click to ask a Question',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: mediaQueryHeight * .005,
                ),

                // Content to display when asking a question
                if (askQuestion)
                  Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          hintText: 'Question Title',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: mediaQueryHeight * .01,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(),
                        ),
                        value: selectedCategory,
                        items: [
                          'Select Category', // Ensure this matches the default value
                          'Category1',
                          'Category2',
                          'Category3',
                          // Add more categories as needed
                        ].map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // Update the selected category when the dropdown value changes
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: mediaQueryHeight * .01,
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                          hintText: 'Ask Question....',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: mediaQueryHeight * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Submit',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
