import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petterns_getx/model/post_model.dart';
import 'package:petterns_getx/service/http_service.dart';


class CreateController extends GetxController {
  var isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;

  Future apiPostCreate() async{
    isLoading(true);

    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: 1);

    var response = await NetWork.POST(NetWork.API_CREATE, NetWork.paramsCreate(post));
    isLoading(false);
  }

}