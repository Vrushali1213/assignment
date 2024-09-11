import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/dashboard/company_details.dart';
import 'package:jobportal/gen/appfont.dart';
import 'package:jobportal/gen/custom_color.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  double? scrWidth, scrHeight;
  var dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    scrWidth = MediaQuery.of(context).size.width;
    scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
            height: scrHeight,
            width: scrWidth,
            child: Padding(
              padding: EdgeInsets.only(
                  left: scrWidth! * 0.07, right: scrWidth! * 0.07),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: scrHeight! * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu),
                    InkWell(
                      onTap: () {
                        dashboardController.isSearch.value =
                            !dashboardController.isSearch.value;
                        if (dashboardController.isSearch.value == false) {
                          dashboardController.userListApi();
                          dashboardController.searchController.clear();

                        }
                      },
                      child: Container(
                          width: scrWidth! * 0.13,
                          decoration: BoxDecoration(
                              border: Border.all(color: CustomColor.white),
                              borderRadius: BorderRadius.circular(10),
                              color: CustomColor.white),
                          child: const Icon(Icons.search)),
                    ),
                  ],
                ),


                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Find your Dream \n Job today",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: scrWidth! * 0.065,
                        fontFamily: AppFont.robotoBold,
                        color: CustomColor.blacknew,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => dashboardController.isSearch.value == false
                      ? Container()
                      : searchbytitle(),
                ),
                jobListview(),
              ]),
            )));

  }

  Widget jobListview() {
    return Expanded(
      child: GetX<DashboardController>(
          init: Get.put<DashboardController>(DashboardController()),
          initState: (state) => RxStatus.loading(),
          builder: (DashboardController statedashboardController) {
            statedashboardController.update();
            if (statedashboardController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (statedashboardController.userList == null ||
                statedashboardController.userList.isEmpty) {
              return Container();
            }
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: statedashboardController.userList.length != null ||
                      statedashboardController.userList.length != 0
                  ? statedashboardController.userList.length
                  : 0,
              itemBuilder: (BuildContext context, int index) =>
                  statedashboardController.userList.length == 0
                      ? Container()
                      : Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                print("Index $index");
                                print("is applied ${statedashboardController.userList[index].isApplied.toString()}");
                                await bottomSheet(context,
                                    statedashboardController.userList[index]);
                              },
                              child: Container(
                                width: scrWidth! * 0.85,
                                height: scrWidth! * 0.2,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: CustomColor.white),
                                    borderRadius: BorderRadius.circular(10),
                                    color: CustomColor.white),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: CustomColor.greyshade,
                                        child:
                                            statedashboardController.userList ==
                                                    null
                                                ? Container()
                                                : Image.network(
                                                    statedashboardController
                                                        .userList[index]
                                                        .thumbnailUrl
                                                        .toString(),
                                                    fit: BoxFit.contain,
                                                    width: scrWidth! * 0.04,
                                                    height: scrWidth! * 0.07,
                                                  )),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        statedashboardController.userList ==
                                                null
                                            ? Container()
                                            : Text(
                                                statedashboardController
                                                    .userList[index].title!
                                                    .split(' ')
                                                    .take(2)
                                                    .join(' '),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                  fontSize: scrWidth! * 0.03,
                                                  fontFamily:
                                                      AppFont.robotoMedium,
                                                  color: CustomColor.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                        Container(
                                          width: scrWidth! * 0.45,
                                          child: statedashboardController
                                                      .userList ==
                                                  null
                                              ? Container()
                                              : Text(
                                                  statedashboardController
                                                      .userList[index].title!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    fontSize: scrWidth! * 0.03,
                                                    fontFamily:
                                                        AppFont.robotoMedium,
                                                    color: CustomColor.grey,
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: scrWidth! * 0.1,
                                      child: CircleAvatar(
                                          backgroundColor:
                                              statedashboardController
                                                          .userList[index]
                                                          .isApplied ==
                                                      true
                                                  ? CustomColor.greenfaint
                                                  : CustomColor.blue,
                                          child: Icon(
                                            Icons.work,
                                            color: CustomColor.white,
                                            size: scrWidth! * 0.037,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: scrWidth! * 0.045,
                            )
                          ],
                        ),
            );
          }),
    );
  }

  Widget searchbytitle() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {
            dashboardController
                .searchbyTitle(dashboardController.searchController.text);
            print("search text ${dashboardController.searchController.text}");
          },
          controller: dashboardController.searchController,
          decoration: InputDecoration(
            labelText: 'Search',
            suffixIcon: InkWell(
                onTap: () {
                  dashboardController.userListApi();
                  dashboardController.searchController.clear();
                },
                child: const Icon(
                  Icons.clear,
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  //////bottom sheet

  bottomSheet(context, var userid) {
    return showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext buildcontext) {
          return  BottomSheetCompanyDetails(userId:userid);

        });
  }

}