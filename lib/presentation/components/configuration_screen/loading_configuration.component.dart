import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:sd_task/presentation/components/loading_skeleton.component.dart';

class LoadingConfiguration extends StatelessWidget {
  const LoadingConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(15),
                  LoadingSkeleton(width: 170, height: 25),
                  Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoadingSkeleton(width: 40, height: 13),
                          Gap(5),
                          LoadingSkeleton(width: 200, height: 30),
                        ],
                      ),
                      Gap(10),
                      LoadingSkeleton(width: 130, height: 55),
                    ],
                  ),
                  Gap(20),
                  LoadingSkeleton(width: double.maxFinite, height: 2),
                  Gap(16),
                  LoadingSkeleton(width: 60, height: 17),
                  Gap(17),
                  LoadingSkeleton(width: double.maxFinite, height: 345),
                  Gap(12),
                  Align(
                    alignment: Alignment.topRight,
                    child: LoadingSkeleton(width: 100, height: 25),
                  ),
                  Gap(50),
                  LoadingSkeleton(width: 105, height: 50)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
