import 'package:flutter/material.dart';

// This widget demonstrates state handled by parents
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapBoxB(
        active: _active,
        onCustomTab: _handleTapboxChanged,
      ),
    );
  }
}

// ------------------------- TapboxB -------------------------

class TapBoxB extends StatelessWidget {
  const TapBoxB({super.key, this.active = false, required this.onCustomTab});

  final bool active;
  final ValueChanged<bool> onCustomTab;

  void _handleTap() {
    onCustomTab(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600]),
          child: Center(
              child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ))),
    );
  }
}
