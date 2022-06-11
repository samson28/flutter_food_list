import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
            Theme.of(context).primaryColor, Icons.comment, "COMMENT"),
        _buildButtonColumn(Theme.of(context).primaryColor, Icons.share, "SHARE")
      ],
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: color,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        label,
        style:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
      )
    ],
  );
}
