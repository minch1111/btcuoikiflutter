import 'package:flutter/material.dart';

class InputCustomWidget extends StatelessWidget {
  const InputCustomWidget({
    Key? key,
    required this.labelName,
    this.hint,
    this.validator,
    this.textController,
    this.initialValue,
    this.type,
    this.onTap,
    this.enable = true
  }) : super(key: key);

  final String labelName;
  final String? hint;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textController;
  final TextInputType? type;
  final Function()? onTap;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelName,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
      keyboardType: type,
      validator: validator,
      onTap: onTap,
      readOnly: !enable,
    );
  }
}

class CustomTextFormField {
  TextFormField getWidget({
    String? labelName,
    String? hint,
    FormFieldValidator<String>? validator,
    TextEditingController? textController,
    String? initialValue,
    TextInputType? type,
    Function()? onTap,
    bool enable = true,
  })
  => TextFormField(
      controller: textController,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelName,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
      keyboardType: type,
      validator: validator,
      onTap: onTap,
      readOnly: !enable,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
}