class DominaModel {
  late String quntity, proudect, totalPrice, date,userTime;
  late String inDominaValue;

  late bool inDomina=false;
  DominaModel({
    required this.userTime,
    required this.quntity,
    required this.inDominaValue,
    required this.proudect,
    required this.totalPrice,
    required this.date,
  });

  DominaModel.fromJson(Map<dynamic, dynamic> map) {

    quntity = map['quntity'];
    userTime = map['userTime'];
    inDominaValue = map['inDominaValue'];
    proudect = map['proudect'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'quntity': quntity,
      'userTime': userTime,
      'inDominaValue': inDominaValue,
      'proudect': proudect,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}