import 'package:flutter/material.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as ShadCn;

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return ShadCn.PrimaryButton(
      child: const Text('Click Here'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Select an Option'),
              content: const Text('Image Option'),
              actions: [
                ShadCn.OutlineButton(
                  child: const Text('Camera'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ShadCn.PrimaryButton(
                  child: const Text('Gallary'),
                  onPressed: () {
                    Navigator.pop(context);
                    const ShadCn.CircularProgressIndicator(
                      value: 0.5,
                      size: 50,
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
