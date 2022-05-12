class TakeawayModel {
  late String quntity, proudect, totalPrice, date,userTime;
  late String TakewayValue;

  TakeawayModel({
    required this.userTime,
    required this.quntity,
    required this.TakewayValue,
    required this.proudect,
    required this.totalPrice,
    required this.date,
  });

  TakeawayModel.fromJson(Map<dynamic, dynamic> map) {

    quntity = map['quntity'];
    userTime = map['userTime'];
    TakewayValue = map['TakewayValue'];
    proudect = map['proudect'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'userTime': userTime,
      'quntity': quntity,
      'TakewayValue': TakewayValue,
      'proudect': proudect,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}