
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/dashboard/dashboard_page.dart';
import 'package:jobportal/gen/appfont.dart';
import 'package:jobportal/gen/custom_color.dart';
import 'dashboard_controller.dart';

class BottomSheetCompanyDetails extends StatelessWidget {

  BottomSheetCompanyDetails({Key? key, this.userId }): super(key: key);

  var userId;

  double? scrWidth, scrHeight;
  var dashboardController = Get.put(DashboardController());


  @override
  Widget build(BuildContext context) {
    scrWidth = MediaQuery
        .of(context)
        .size
        .width;
    scrHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Wrap(children: <Widget>[
      Container(
        height: 500,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
              height: 500,
              color: Colors.transparent,
            ),
            Positioned(
                left: scrWidth! * 0.15,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                )),
            Positioned(
                top: scrWidth! * 0.09,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  height: scrHeight!,
                  width: scrWidth!,
                )),
            Positioned(
                top: scrWidth! * 0.036,
                left: scrWidth! * 0.175,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 40,
                  child: ClipOval(
                      child: Image.asset(
                        'assets/images/googleicon.png',
                        fit: BoxFit.contain,
                        width: 40,
                      )),
                )),
            Positioned(
                left: scrWidth! * 0.15,
                top: scrWidth! * 0.23,
                child: companyDetails(userId, context)),
          ],
        ),
      )
    ]);
  }



  Widget companyDetails(var userid, context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Google LLC",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: scrWidth! * 0.05,
                fontFamily: AppFont.robotoBold,
                color: CustomColor.blacknew,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
                height: 1.6,
              ),
            ),
            SizedBox(
              width: scrWidth! * 0.35,
            ),
            Icon(
              Icons.star,
              size: 30,
              color: Colors.grey[300],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "silicon valley CA",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                fontSize: scrWidth! * 0.036,
                fontFamily: AppFont.robotoMedium,
                color: CustomColor.grey,
              ),
            ),
            Container(width: scrWidth! * 0.4),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Tech based company and producer",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                fontSize: scrWidth! * 0.036,
                fontFamily: AppFont.robotoMedium,
                color: CustomColor.grey,
              ),
            ),
            Container(width: scrWidth! * 0.1),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "role",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                fontSize: scrWidth! * 0.036,
                fontFamily: AppFont.robotoMedium,
                color: CustomColor.grey,
              ),
            ),
            Container(width: scrWidth! * 0.6),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "Senior UI/UX Designer",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: scrWidth! * 0.05,
                fontFamily: AppFont.robotoBold,
                color: CustomColor.blacknew,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
                height: 1.6,
              ),
            ),
            SizedBox(
              width: scrWidth! * 0.13,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Description",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                fontSize: scrWidth! * 0.036,
                fontFamily: AppFont.robotoMedium,
                color: CustomColor.grey,
              ),
            ),
            Container(width: scrWidth! * 0.5),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              width: scrWidth! * 0.7,
              child: Text(
                "Applicant must  at least up to 10 years of design experience",
                textAlign: TextAlign.left,
                maxLines: 3,
                style: TextStyle(
                  fontSize: scrWidth! * 0.036,
                  fontFamily: AppFont.robotoRegular,
                  color: CustomColor.blacknew,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        applyButton(userid, context),
      ],
    );
  }

  Widget applyButton(var userid, context) {
    return Container(
        child: Center(
          child: Container(
            width: scrWidth! * 0.7,
            height: scrHeight! * 0.05,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    userid.isApplied == true
                        ? CustomColor.greenfaint
                        : CustomColor.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),
              child: Text(
                userid.isApplied == true ? 'Applied' : 'APPLY NOW',
                style: TextStyle(
                    color: CustomColor.white,
                    fontSize: scrWidth! * 0.04,
                    fontFamily: AppFont.robotoBlack,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0),
              ),
              onPressed: () {
                if (userid.isApplied == false) {
                  userid.isApplied = true;
                  print(userId.isApplied.toString());
                  print("applying");
                  Get.snackbar(
                    "Job Applied",
                    "Successfully",
                    snackPosition: SnackPosition.BOTTOM,
                    forwardAnimationCurve: Curves.elasticInOut,
                    reverseAnimationCurve: Curves.easeOut,
                  );
                  print("Successful");
                  // Navigator.pop(context);


                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                          (Route<dynamic> route) => false);
                } else {
                  Get.back();
                }
              },
            ),
          ),
        ));
  }


}
