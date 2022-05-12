
import 'package:dominos/const/colors.dart';
import 'package:dominos/helping/checkout.dart';
import 'package:dominos/widget/custom_text_two.dart';
import 'package:flutter/material.dart';

class ChoseTimeDelevery extends StatefulWidget {
  const ChoseTimeDelevery({Key? key}) : super(key: key);

  @override
  _ChoseTimeDeleveryState createState() => _ChoseTimeDeleveryState();
}

class _ChoseTimeDeleveryState extends State<ChoseTimeDelevery> {
  Delivery delivery = Delivery.StanderdDelivery;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
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
          title: Text( "Standerd Delivery",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          subtitle:
          Text( "\nOrder will be delivered between 30 min-45min ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),

          activeColor: AppColor.primary,
        ),
        SizedBox(height: 30,),
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
          title:Text( "Next Hour Delivery",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          subtitle:Text( "\nPlace your order After 1-h and your items will be delivered to Your Home",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),

          activeColor: AppColor.primary,
        ),
        SizedBox(height: 30,),
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
          title: Text( "After more than 2 Hour Delivery",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          subtitle: Text( "\nRecive Your Order After 2 hour from now",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
          activeColor: AppColor.primary,
        ),
        SizedBox(height: 80,),
      ],
    );
  }
}
