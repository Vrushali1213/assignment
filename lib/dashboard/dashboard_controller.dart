import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobportal/api_endpoint/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:jobportal/model/joblistmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {

  var isLoading = false.obs;
  RxBool isSearch=false.obs;

  RxList<JobListJson> userList= <JobListJson>[].obs;
  RxList<JobListJson> searchuserList= <JobListJson>[].obs;

  TextEditingController searchController = TextEditingController();

  Future<void> userListApi() async {
    isLoading.value = true;
    try {
      var url = Uri.parse(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.jobListData.jobListApi
          }");

      final response= await http.get(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },);

      print("starting.....");
      if (response.statusCode == 200) {
        isLoading.value = false;

        print("Status code 200");

        var json = response.body;
        List<JobListJson> users1= userFromJson(json);

        userList.value=userFromJson(json);
        print("users1 ${users1.length}");

        print("JoblistJson");

      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          "list api not responding",
          snackPosition: SnackPosition.BOTTOM,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      }
    } catch (error) {
      isLoading.value = false;
      print("error $error");
      Get.snackbar(
        'Exception - ',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }

  searchbyTitle(String searchString) {
    searchuserList.value=[];
    searchuserList.value = userList
        .where((element) =>
        element.title!.toLowerCase().contains(searchString.toLowerCase()))
        .toList();

    update();
     return userList.assignAll(searchuserList);

  }

  @override
  void onInit() {

    userListApi();
    super.onInit();
  }
}
