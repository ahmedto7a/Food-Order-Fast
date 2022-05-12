

import 'package:dominos/core/view_model/cart_viwe_model.dart';

import 'caart_mode.dart';

class DeleveryModel {
  late String street, city, state, country, phone, totalPrice, date;
  // late List items ;
  late String indeleveryValue;
  DeleveryModel({
    // required this.items,
    required this.indeleveryValue,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.totalPrice,
    required this.date,
  });

  DeleveryModel.fromJson(Map<dynamic, dynamic> map) {
    // items = map['items'];
    indeleveryValue = map['indeleveryValue'];
    street = map['street'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
    phone = map['phone'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'indeleveryValue': indeleveryValue,
      'street': street,
      // 'items': items,
      'city': city,
      'state': state,
      'country': country,
      'phone': phone,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}