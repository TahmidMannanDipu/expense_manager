import 'package:flutter/material.dart';

class AddCategoryDailog extends StatefulWidget {
  const AddCategoryDailog({super.key});

  @override
  State<AddCategoryDailog> createState() => _AddCategoryDailogState();
}

class _AddCategoryDailogState extends State<AddCategoryDailog> {

  //* CONTROLLER
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add category"),
      content: TextField(
        controller: _nameController,
        decoration: InputDecoration(labelText: 'Category Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),

        
        ElevatedButton(
          onPressed: () {
            final categoryName = _nameController.text;
            if (categoryName.isNotEmpty) {
              Navigator.of(context).pop(categoryName);
            }
          },
          child: const Text('Add'),
        )
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
