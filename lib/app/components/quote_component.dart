import 'package:flutter/material.dart';

class QuoteComponent extends StatelessWidget {
  final Color color;
  final String quote;
  final double quoteFontSize;
  final double quoteIconSize;

  const QuoteComponent(
      {super.key,
      required this.color,
      required this.quote,
      required this.quoteFontSize,
      required this.quoteIconSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/quote.png", width: quoteIconSize, color: color),
        const SizedBox(height: 10),
        Text(
          quote,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: quoteFontSize,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: color,
          ),
        )
      ],
    );
  }
}
