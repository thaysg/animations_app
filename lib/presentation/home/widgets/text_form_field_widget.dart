import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final FormFieldValidator<String> validator;
  final VoidCallback onTap;
  final Function(String)? onFieldSubmitted;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.validator,
    required this.onTap,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            autofocus: true,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              fillColor: Colors.white,
              labelText: 'Participant Name',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            controller: controller,
            validator: validator,
            onChanged: onChanged,
          ),
        ),
        IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
