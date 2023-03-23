import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
typedef OnChanged = void Function(String?);

class LoginTextForm extends StatelessWidget {
  const LoginTextForm(
      {super.key,
      required this.validator,
      this.inputLabel,
      this.icon,
      this.onHintPressed,
      this.hintIcon = Icons.help_outline,
      this.hintEnabled = false,
      required this.onChanged})
      : assert((!hintEnabled && onHintPressed == null) ||
            (hintEnabled && onHintPressed != null));

  final Validator validator;
  final String? inputLabel;
  final IconData? icon;
  final IconData hintIcon;
  final bool hintEnabled;
  final VoidCallback? onHintPressed;
  final OnChanged onChanged;

  @override
  Widget build(BuildContext context) {
    final hintSuffix = hintEnabled
        ? IconButton(
            icon: Icon(hintIcon),
            onPressed: onHintPressed,
          )
        : null;

    final inputPrefix = icon != null ? Icon(icon) : null;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.background,
          filled: true,
            border: const OutlineInputBorder(),
            labelText: inputLabel,
            prefixIcon: inputPrefix,
            suffixIcon: hintSuffix),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
