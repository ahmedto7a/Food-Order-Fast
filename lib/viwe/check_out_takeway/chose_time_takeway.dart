
import 'package:dominos/const/colors.dart';
import 'package:dominos/helping/checkout.dart';
import 'package:dominos/widget/custom_text_two.dart';
import 'package:flutter/material.dart';

class ChoseTimeTackeway extends StatefulWidget {
  const ChoseTimeTackeway({Key? key}) : super(key: key);

  @override
  _ChoseTimeTackewayState createState() => _ChoseTimeTackewayState();
}

class _ChoseTimeTackewayState extends State<ChoseTimeTackeway> {
  Delivery delivery = Delivery.StanderdDelivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        RadioListTile<Delivery>(
          value: Delivery.StanderdDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
            // delivery = value!;
          },
          title: CustomTextt(text: "Standerd Delivery", size: 24,),
          subtitle: CustomTextt(
            text: "\nOrder will be delivered between 3-5 business days",
            size: 17,
            color: Colors.black54,),

          activeColor: AppColor.primary,
        ),
        SizedBox(height: 30,),
        RadioListTile<Delivery>(
          value: Delivery.NextDayDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
            // delivery = value!;
          },
          title: CustomTextt(text: "Next Day Delivery", size: 24,),
          subtitle: CustomTextt(
            text: "\nPlace your order before 6pm and your items will be delivered the next day",
            size: 17,
            color: Colors.black54,),
          activeColor: AppColor.primary,
        ),
        SizedBox(height: 30,),
        RadioListTile<Delivery>(
          value: Delivery.NominatedDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
            // delivery = value!;
          },
          title: CustomTextt(text: "Nominated Delivery", size: 24,),
          subtitle: CustomTextt(
            text: "\nPick a particular date from the calendar and order will be delivered on selected date",
            size: 17,
            color: Colors.black54,),
          activeColor: AppColor.primary,
        ),
        SizedBox(height: 80,),
      ],
    );
  }
}
