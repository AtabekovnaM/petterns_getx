import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petterns_getx/model/post_model.dart';
import 'package:petterns_getx/service/http_service.dart';


class UpdateController extends GetxController{
  var isLoading = false.obs;
  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;
  var _post = Post();



  Future apiCreatePost() async{
    isLoading(true);
    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body, userId: _post.userId, id: _post.id);

    var response = await NetWork.PUT(NetWork.API_UPDATE + _post.id.toString(), NetWork.paramsUpdate(post));
    isLoading(false);
    Get.back(result: response);
  }

}