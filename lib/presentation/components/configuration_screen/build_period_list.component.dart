import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:sd_task/domain/period.domain.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/domain/user_account.domain.dart';
import 'package:sd_task/presentation/components/period_card.component.dart';

class BuildPeriodList extends StatefulWidget {
  const BuildPeriodList({
    super.key,
    required this.userAccount,
    required this.openNewPeriodModalCallback,
    required this.openEditModalCallback,
  });

  final UserAccount userAccount;
  final Function openNewPeriodModalCallback;
  final Function openEditModalCallback;

  @override
  State<BuildPeriodList> createState() => _BuildPeriodListState();
}

class _BuildPeriodListState extends State<BuildPeriodList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 400,
      child: Column(
        children: [
          const Gap(10),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Períodos",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Gap(18),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: CustomColors.lightGray,
              ),
              child: ListView.builder(
                itemCount: widget.userAccount.periods?.length ?? 0,
                itemBuilder: (context, index) {
                  Period currentPeriod = widget.userAccount.periods![index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: GestureDetector(
                      onDoubleTap: () {
                        widget.openEditModalCallback(currentPeriod);
                      },
                      child: PeriodCard(
                        name: currentPeriod.name,
                        start: DateTime.fromMillisecondsSinceEpoch(
                            currentPeriod.start),
                        ends: DateTime.fromMillisecondsSinceEpoch(
                          currentPeriod.ends,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Gap(12),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                widget.openNewPeriodModalCallback();
              },
              child: Container(
                width: 100,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: CustomColors.primaryBlue,
                ),
                child: const Center(
                  child: Text(
                    "Adicionar Período",
                    style: TextStyle(
                      color: CustomColors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
