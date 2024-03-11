import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Configuration extends StatefulWidget {
  static const String route = "/configuration";

  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class _BuildTopNavBar extends StatelessWidget {
  const _BuildTopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('lib/assets/svgs/back'),
        const Text(
          "Configurações",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
