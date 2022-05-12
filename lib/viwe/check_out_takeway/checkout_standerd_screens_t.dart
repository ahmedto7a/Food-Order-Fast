
import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/checkout_viwe_model.dart';
import 'package:dominos/viwe/check_out_takeway/summary_t.dart';
import 'package:dominos/viwe/control_viwe.dart';
import 'package:dominos/viwe/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chose_time_takeway.dart';
import 'done_screen_t.dart';


class CheckOutTakeWay extends GetView<CheckoutViewModel> {

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
        child:  Stepper(
          elevation: 0.0,
          type: StepperType.horizontal,
          steps: buildStep(),
          currentStep: controller.currentStepDl.value,
          onStepContinue: () {
            if (controller.currentStepDl.value == buildStep().length - 1) {
              Get.off(ControlView());
             controller.currentStepDl.value-=2;
            }
            else {
              controller.currentStepDl.value++;
            }
          },
          onStepCancel: () {
            controller.currentStepDl.value == 0
                ? null
                : controller.currentStepDl.value--;
          },

          /// to stoped c
          // onStepTapped: (index) {
          //   controller.currentStepDelevery.value = index;
          // },
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Container(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(controller.currentStepDl.value == buildStep().length - 1
                          ? "Back Home"
                          : "Next"),
                      onPressed:controls.onStepContinue ,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  if (controller.currentStepDl.value != 0 && controller.currentStepDl.value != 2 )
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
          title: Text('Domina',),
          content: ChoseTimeTackeway(),
          isActive: controller.currentStepDl.value >= 0,
          state: controller.currentStepDl.value>0?StepState.complete:StepState.indexed
      ),

      Step(
          title: Text('Summary'),
          content:  SummaryTackaWay(),
          isActive: controller.currentStepDl.value >= 1,
          state: controller.currentStepDl.value > 1
              ? StepState.complete
              : StepState.indexed),

      Step(
          title: Text('Order Done'),
          content:  OrderDoneTakeway(),
          isActive: controller.currentStepDl.value >= 2)
    ];
  }
}


