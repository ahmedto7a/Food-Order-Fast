
import 'package:dominos/const/colors.dart';
import 'package:dominos/helping/checkout.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChoseTimeInDomina extends StatefulWidget {
  const ChoseTimeInDomina({Key? key}) : super(key: key);

  @override
  _ChoseTimeInDominaState createState() => _ChoseTimeInDominaState();
}

class _ChoseTimeInDominaState extends State<ChoseTimeInDomina> {
  Delivery delivery = Delivery.StanderdDelivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20.sp,),
        RadioListTile<Delivery>(
          selected: delivery==Delivery.StanderdDelivery? true:false,
          value: Delivery.StanderdDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
            // delivery = value!;
          },
          title: Text("Standerd Time",style: TextStyle(fontSize: 19.5.sp),),
          // CustomTextt(text: "Standerd Delivery", size: 24,),
          subtitle:Text("\nNormally, the food is ready 30-min after your order",style: TextStyle(fontSize: 13.sp),
          // CustomTextt(
          //   text: "\nOrder will be delivered between 3-5 business days",
          //   size: 17,
            ),

          activeColor: AppColor.primary,
        ),
        SizedBox(height: 20.sp,),
        RadioListTile<Delivery>(
          selected: delivery==Delivery.NextDayDelivery? true:false,

          value: Delivery.NextDayDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
            // delivery = value!;
          },
          title: Text("Take after 1 hour",style: TextStyle(fontSize: 19.5.sp),),
          subtitle:
          Text("\nWant you Take your Order After 1 hour from now",style: TextStyle(fontSize: 13.sp),),
          activeColor: AppColor.primary,
        ),
        SizedBox(height: 20.sp,),
        RadioListTile<Delivery>(
          selected: delivery==Delivery.NominatedDelivery? true:false,

          value: Delivery.NominatedDelivery,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
            // delivery = value!;
          },
          title: Text("Take after 2 hour",style: TextStyle(fontSize: 19.5.sp),),
          subtitle: Text("\nWant you Take your Order After 2 hour from now",style: TextStyle(fontSize: 13.sp),),
          activeColor: AppColor.primary,
        ),
        SizedBox(height: 20.sp,),
        RadioListTile<Delivery>(
          selected: delivery==Delivery.AddOnHourTime? true:false,

          value: Delivery.AddOnHourTime,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery=value!;
            });
            // delivery = value!;
          },
          title: Text("Take after 3 hour",style: TextStyle(fontSize: 19.5.sp),),
          subtitle: Text("\nWant you Take your Order After 3 hour from now",style: TextStyle(fontSize: 13.sp),),
          activeColor: AppColor.primary,
        ),
        SizedBox(height: 42.sp,),
      ],
    );
  }
}
