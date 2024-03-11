import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sd_task/presentation/components/loading_skeleton.component.dart';

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
      children: [
        _BuildTopNavBar(),
      ],
    );
  }
}

class _BuildTopNavBar extends StatelessWidget {
  const _BuildTopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('lib/assets/svg/back_icon.asset.svg'),
          const Text(
            "Configurações",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingConfiguration extends StatelessWidget {
  const _LoadingConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          const Gap(15),
          LoadingSkeleton(width: 170, height: 25),
          const Gap(15),
          LoadingSkeleton(width: 170, height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  LoadingSkeleton(width: 40, height: 13),
                  LoadingSkeleton(width: 200, height: 30),
                ],
              ),
              LoadingSkeleton(width: 130, height: 55),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
