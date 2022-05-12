import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/checkout_viwe_model.dart';
import 'package:dominos/viwe/checkout_in_house/summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../control_viwe.dart';
import 'chose_time.dart';
import 'done_screen.dart';


class CheckOutInDomina extends GetView<CheckoutViewModel> {
  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutViewModel());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {Get.back();},
          icon: Icon(

            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontSize: 27),
        ),
      ),
      body: Obx(() => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: AppColor.primary),
        ),
        child: Stepper(
          elevation: 0.0,
          type: StepperType.horizontal,
          steps: buildStep(),
          currentStep: controller.currentStepDo.value,
          onStepContinue: () {
            if (controller.currentStepDo.value == buildStep().length - 1) {
              /// to send order to cloud fire///////////////////
              Get.off(ControlView());
              controller.currentStepDo.value-=2;
            } else {
              controller.currentStepDo.value++;
            }
          },
          onStepCancel: () {
            controller.currentStepDo.value == 0
                ? null
                : controller.currentStepDo.value--;
          },
          // onStepTapped: (index) {
          //   controller.currentStepDo.value = index;
          // },
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Container(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(controller.currentStepDo.value == buildStep().length - 1
                          ? "Back Home"
                          : "Next"),
                      onPressed:controls.onStepContinue ,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  if (controller.currentStepDo.value != 0 && controller.currentStepDo.value != 2 )
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Previous"),
                        onPressed:controls.onStepCancel,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      ),
    );
  }
  List<Step> buildStep() {
    return [
      Step(
          title: Text('Domina'),
          content: ChoseTimeInDomina(),
          isActive: controller.currentStepDo.value >= 0,
          state: controller.currentStepDo.value>0?StepState.complete:StepState.indexed
      ),

      Step(
          title: Text('Summary',),
          content:  SummaryInDomina(),
          isActive: controller.currentStepDo.value >= 1,
          state: controller.currentStepDo.value > 1
              ? StepState.complete
              : StepState.indexed),

      Step(
          title: Text('Order Done',),
          content:  OrderDoneInDomina(),
          isActive: controller.currentStepDo.value >= 2)
    ];
  }
}


