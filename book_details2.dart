import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BookDetails()));
}

class BookDetails extends StatefulWidget {
  @override
  State<BookDetails> createState() => _BookDetails();
}

class _BookDetails extends State<BookDetails> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final subject = TextEditingController();
  final marks = TextEditingController();
  String? selectedOption = "TW";
  String message = "";

  void checkValid() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        message = "Accepted!";
      });
    } else {
      setState(() {
        message = "Rejected";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Book details"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return "Please enter only characters.";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: subject,
                decoration: InputDecoration(labelText: "Subject"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a subject";
                  }
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return "Please enter only characters.";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "TW",
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                        const Text("TW"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "IA",
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                        const Text("IA"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "OR",
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                        const Text("OR"),
                      ],
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: marks,
                decoration: InputDecoration(labelText: "Marks"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value == "") {
                    return "Please enter your marks";
                  }
                  final valMarks = int.tryParse(value);
                  if (valMarks == null || value == "") {
                    return "Enter marks";
                  }
                  if (valMarks < 0) {
                    return "Marks can't be negative";
                  }
                  return null;
                },
              ),
              FloatingActionButton(
                onPressed: checkValid,
                child: Text("Submit"),
              ),
              Text(
                message,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
