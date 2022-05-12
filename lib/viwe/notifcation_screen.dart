import 'package:dominos/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';



class NotificationScreen extends StatefulWidget {

  // final User user;
  // NotificationScreen({
  //   Key key,
  //   @required this.user
  // });
  @override
  _NotificationState createState() => _NotificationState();


}

class _NotificationState extends State<NotificationScreen> {

  // var dbHelper;
  // bool isReady = false;
  // Future<List<NotificationM>>getNotifListByUserId;
  // int notifsCnt;Future<int>notificationCount;
  // @override
  // void initState(){
  //   super.initState();
  //   dbHelper = DBHelper();
  //   WidgetsBinding.instance
  //       .addPostFrameCallback((_) {
  //     getNotifListByUserId = dbHelper.getNotifListByUserId(widget.user.id);
  //     dbHelper.updateNotifStatusByUserId(widget.user.id);
  //
  //   } );
  //   notificationCount = dbHelper.notificationCount(widget.user.id);
  //   notificationCount.then((value){
  //     setState(() {
  //       notifsCnt = value;
  //     });
  //   });
  //   Future.delayed(Duration(seconds: 2),(){
  //     setState(() {
  //       isReady = true;
  //
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  AnimationLimiter(
          child: SingleChildScrollView(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 775),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 150.0,
                  child: FlipAnimation(
                    child: widget,
                  ),
                ),
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 60.sp,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.Home,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.notifications,
                              color: AppColor.primary,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Notifications",
                            style: TextStyle(
                                color: AppColor.Home,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:
                        //!isReady?Center(
                        //   child: CircularProgressIndicator(
                        //     valueColor: new AlwaysStoppedAnimation<Color>(AppCommons.appColor),
                        //     backgroundColor: AppCommons.white,
                        //   ),
                        // ):FutureBuilder<List<NotificationM>>(
                        //     future: getNotifListByUserId,
                        //     builder: (context, snapshot){
                        //       if(snapshot.connectionState != ConnectionState.done){
                        //
                        //       }
                        //       if(snapshot.hasError){
                        //         print("ERROR!!");
                        //         print(snapshot.error);
                        //       }
                        //       List<NotificationM>notisList = snapshot.data??[];
                        ListView.builder(
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              // NotificationM notif = notisList[index];
                              return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Card(
                                    elevation: 2,
                                    shadowColor: AppColor.primary,
                                    child: Container(
                                      height: 80,

                                      /// need to edit//////////////////////////////////////////////
                                      /// /// need to edit//////////////////////////////////////////////
                                      /// /// need to edit//////////////////////////////////////////////
                                      /// /// need to edit//////////////////////////////////////////////
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Welcom in Domina",
                                                    // notif.message,
                                                    style: TextStyle(
                                                        color: AppColor.primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    " Your order Accepted please wait ... ",

                                                    // notif.updDt,
                                                    style: TextStyle(
                                                      color: AppColor.primary,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: AppColor.primary,
                                            ),
                                            // onPressed: (){
                                            //   print(notif.id);
                                            //   dbHelper.removeNotifById(notif.id);
                                            //   notificationCount = dbHelper.notificationCount(widget.user.id);
                                            //   notificationCount.then((value){
                                            //     setState(() {
                                            //       notifsCnt = value;
                                            //     });
                                            //   });
                                            //   setState(() {
                                            //     getNotifListByUserId = dbHelper.getNotifListByUserId(widget.user.id);
                                            //
                                            //   });
                                            // })
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            }
                            // );
                            // );
                            ),
                  ),
                ),
              ],
            ),
        ),
          ),
      ),
      ),
    );
  }
}
