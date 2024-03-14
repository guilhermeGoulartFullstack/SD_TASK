import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sd_task/domain/period.domain.dart';
import 'package:sd_task/domain/enums/category.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/utils/date_formatter.util.dart';
import 'package:sd_task/firebase/requests/period_request.firebase.dart';
import 'package:sd_task/presentation/components/configuration_screen/period_modal_button.component.dart';

class BuildPeriodModal extends StatefulWidget {
  const BuildPeriodModal({
    super.key,
    required this.isNewPeriod,
    required this.period,
    required this.addPeriodCallback,
    required this.editPeriodCallback,
    required this.deletePeriodCallback,
  });

  final bool isNewPeriod;
  final Period? period;
  final Function addPeriodCallback;
  final Function editPeriodCallback;
  final Function deletePeriodCallback;

  @override
  State<BuildPeriodModal> createState() => _BuildPeriodModalState();
}

class _BuildPeriodModalState extends State<BuildPeriodModal> {
  late TextEditingController nameController;
  late TextEditingController goalOneController;
  late TextEditingController goalTwoController;
  late int? start;
  late int? ends;
  late PeriodCategory? periodCategory;
  late int? goalOne;
  late int? goalTwo;
  late bool isEditing;

  bool hasError = false;

  @override
  void initState() {
    nameController = TextEditingController(
      text: (!widget.isNewPeriod && widget.period != null)
          ? widget.period!.name
          : null,
    );
    goalOneController = TextEditingController(
      text: (!widget.isNewPeriod && widget.period != null)
          ? widget.period!.goalOne.toString()
          : null,
    );
    goalTwoController = TextEditingController(
      text: (!widget.isNewPeriod && widget.period != null)
          ? widget.period!.goalTwo.toString()
          : null,
    );
    start = widget.period?.start;
    ends = widget.period?.ends;
    periodCategory = widget.period?.periodCategory;
    goalOne = widget.period?.goalOne;
    goalTwo = widget.period?.goalTwo;
    isEditing = widget.isNewPeriod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        width: 300,
        height: 463,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Novo Período",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(66),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState;
                    },
                    child:
                        SvgPicture.asset("lib/assets/svg/close_icon.asset.svg"),
                  )
                ],
              ),
              const Gap(30),
              isEditing
                  ? Container(
                      height: 39,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: CustomColors.lightGray,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.period?.name ?? "",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.black,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 39,
                      child: TextField(
                        cursorColor: CustomColors.darkGray.withOpacity(0.7),
                        controller: nameController,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.black,
                        ),
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: CustomColors.lightGray,
                            border: InputBorder.none,
                            hintText: "Nomeie seu periodo",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.hintGray,
                            )),
                      ),
                    ),
              const Gap(18),
              Container(
                height: 149,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:
                      isEditing ? CustomColors.white : CustomColors.lightGray,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    children: [
                      const Gap(19),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Começa",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? startTime = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050),
                              );
                              start = startTime?.millisecondsSinceEpoch;
                              setState(() {});
                            },
                            child: Container(
                              width: 103,
                              height: 29,
                              decoration: BoxDecoration(
                                color: CustomColors.white,
                                border: Border.all(
                                  color: CustomColors.offWhite,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  start != null
                                      ? DateFormatter.complete(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              start!))
                                      : "",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(8),
                      Container(
                        height: 1,
                        color: CustomColors.dividerGray,
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Termina",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? endsTime = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050),
                              );
                              ends = endsTime?.millisecondsSinceEpoch;
                              setState(() {});
                            },
                            child: Container(
                              width: 103,
                              height: 29,
                              decoration: BoxDecoration(
                                color: CustomColors.white,
                                border: Border.all(
                                  color: CustomColors.offWhite,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  ends != null
                                      ? DateFormatter.complete(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              ends!))
                                      : "",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(8),
                      Container(
                        height: 1,
                        color: CustomColors.dividerGray,
                      ),
                      isEditing ? const Gap(14) : const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Categoria",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.black,
                            ),
                          ),
                          isEditing
                              ? Text(
                                  widget.period?.periodCategory.name ?? "",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: CustomColors.black,
                                  ),
                                )
                              : DropdownMenu(
                                  onSelected: (value) {
                                    periodCategory = value;
                                  },
                                  initialSelection:
                                      widget.period?.periodCategory,
                                  width: 130,
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: CustomColors.black,
                                  ),
                                  inputDecorationTheme: InputDecorationTheme(
                                    fillColor: CustomColors.white,
                                    filled: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: CustomColors.offWhite,
                                      ),
                                    ),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    constraints: BoxConstraints.tight(
                                        const Size.fromHeight(29)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  dropdownMenuEntries: [
                                    DropdownMenuEntry(
                                      value: PeriodCategory.one,
                                      label: PeriodCategory.one.name,
                                    ),
                                    DropdownMenuEntry(
                                      value: PeriodCategory.two,
                                      label: PeriodCategory.two.name,
                                    ),
                                    DropdownMenuEntry(
                                      value: PeriodCategory.three,
                                      label: PeriodCategory.three.name,
                                    ),
                                    DropdownMenuEntry(
                                      value: PeriodCategory.four,
                                      label: PeriodCategory.four.name,
                                    ),
                                    DropdownMenuEntry(
                                      value: PeriodCategory.five,
                                      label: PeriodCategory.five.name,
                                    ),
                                  ],
                                )
                        ],
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
              ),
              const Gap(17),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Meta 1",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.black,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 39,
                      child: isEditing
                          ? Center(
                              child: Text(
                                widget.period?.goalOne.toString() ?? "",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlign: TextAlign.center,
                              controller: goalOneController,
                              cursorColor:
                                  CustomColors.darkGray.withOpacity(0.7),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                hintText: "un",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.offWhite,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColors.offWhite,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColors.offWhite,
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Meta 2",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.black,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 39,
                      child: isEditing
                          ? Center(
                              child: Text(
                                (widget.period?.goalTwo != null)
                                    ? widget.period!.goalTwo.toString()
                                    : "",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: goalTwoController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              cursorColor:
                                  CustomColors.darkGray.withOpacity(0.7),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                hintText: "un",
                                hintStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.offWhite,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColors.offWhite,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: CustomColors.offWhite,
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
              const Gap(30),
              isEditing
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PeriodModalButton(
                          text: "Excluir",
                          canClick: () {
                            return true;
                          },
                          canClickCallback: () {
                            Navigator.pop(context);
                            widget.deletePeriodCallback(widget.period?.id);
                          },
                          errorCallback: () {},
                          color: CustomColors.primaryRed,
                        ),
                        PeriodModalButton(
                          text: "Editar",
                          canClick: () {
                            return true;
                          },
                          canClickCallback: () {
                            setState(() {
                              isEditing = false;
                              nameController.text = widget.period?.name ?? "";
                              goalOneController.text =
                                  (widget.period?.goalOne != null)
                                      ? widget.period!.goalOne.toString()
                                      : "";
                              goalTwoController.text =
                                  (widget.period?.goalTwo != null)
                                      ? widget.period!.goalTwo.toString()
                                      : "";
                            });
                          },
                          errorCallback: () {},
                          color: CustomColors.primaryBlue,
                        )
                      ],
                    )
                  : PeriodModalButton(
                      text: "Concluir",
                      color: CustomColors.primaryBlue,
                      canClick: () {
                        return ((nameController.text.isNotEmpty) &&
                            (start != null) &&
                            (ends != null) &&
                            (periodCategory != null) &&
                            (goalOneController.text.isNotEmpty));
                      },
                      canClickCallback: () {
                        setState(() {
                          hasError = false;
                        });
                        PeriodRequest request = PeriodRequest(
                          name: nameController.text,
                          start: start!,
                          ends: ends!,
                          periodCategory: periodCategory!,
                          goalOne: int.parse(goalOneController.text),
                          goalTwo: goalTwoController.text.isNotEmpty
                              ? int.parse(goalTwoController.text)
                              : null,
                        );
                        if (widget.period == null) {
                          widget.addPeriodCallback(request);
                        } else {
                          request.id = widget.period?.id;
                          widget.editPeriodCallback(request);
                        }
                        Navigator.pop(context);
                      },
                      errorCallback: () {
                        setState(() {
                          hasError = true;
                        });
                      },
                    ),
              const Gap(10),
              hasError
                  ? Container(
                      width: 200,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow,
                      ),
                      child: const Center(
                        child: Text(
                          "Preencha todos os campos",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
