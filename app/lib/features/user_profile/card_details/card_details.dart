import 'package:app/common/custom_shape/containers/circular_design_container.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CircularDesignContainer(
            backText: 'Back',
            child: Center(
              child: Text('Card Details page should develop'),
            )));
  }
}
