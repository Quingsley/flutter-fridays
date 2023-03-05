import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  const Tile({
    super.key,
    required this.date,
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
  });
  final String date;
  final int day;
  final int hour;
  final int minute;
  final int second;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  String text = '0';

  @override
  Widget build(BuildContext context) {
    if (widget.day > 0) {
      text = '${widget.day} days ';
    } else if (widget.day == 1) {
      text = '${widget.day} day ';
    } else if (widget.hour > 0) {
      text = '${widget.hour} hour(s) ';
    } else if (widget.minute > 0) {
      text = '${widget.minute} minute(s) ';
    } else if (widget.second > 0) {
      text = '${widget.second} second(s) ';
    }
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: ListTile(
        leading: Icon(
          Icons.star,
          color: Colors.amberAccent.shade700,
          size: 48,
        ),
        title: RichText(
          text: TextSpan(
            text: 'You won a ',
            style: const TextStyle(
              fontSize: 16,
            ),
            children: [
              TextSpan(
                text: text,
                style: TextStyle(
                  color: Colors.amberAccent.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: 'Challenge')
            ],
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: 'You finished on ',
            style: const TextStyle(
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: widget.date,
                style: TextStyle(
                  color: Colors.amberAccent.shade700,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
