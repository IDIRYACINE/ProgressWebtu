import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProgresOldButton extends StatelessWidget {
  const ProgresOldButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MaterialButton(
        onPressed: onPressed,
        child: Container(
          color: theme.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon),
              Text(text),
            ],
          ),
        ));
  }
}

class ConnectButton extends StatelessWidget {
  const ConnectButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MaterialButton(
        onPressed: onPressed,
        color: theme.primaryColor,
        child: Text(AppLocalizations.of(context)!.login));
  }
}

typedef OnIndexChanged = void Function(int index);

class TabSwitcherButton extends StatefulWidget {
  const TabSwitcherButton(
      {super.key, required this.tabTitles, required this.onIndexChanged});

  final List<String> tabTitles;
  final OnIndexChanged onIndexChanged;

  @override
  State<TabSwitcherButton> createState() => _TabSwitcherButtonState();
}

class _TabSwitcherButtonState extends State<TabSwitcherButton> {
  int index = 0;

  void _handleSwipe(DragEndDetails? detaills) {
    if (detaills!.velocity.pixelsPerSecond.dx > 0) {
      if (index + 1 < widget.tabTitles.length) {
        setState(() {
          index++;
          widget.onIndexChanged(index);
        });
      }
    } else {
      if (index - 1 >= 0) {
        setState(() {
          index--;
          widget.onIndexChanged(index);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: _handleSwipe,
      child: Text(widget.tabTitles[index]),
    );
  }
}
