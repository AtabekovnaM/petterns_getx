import 'package:get/get.dart';
import 'package:petterns_getx/model/post_model.dart';
import 'package:petterns_getx/pages/create_page.dart';
import 'package:petterns_getx/pages/update_page.dart';
import 'package:petterns_getx/service/http_service.dart';



class HomeController extends GetxController {
  var isLoading = false.obs;

  var items = new List<Post>().obs;

  Future apiPostList() async {
    isLoading(true);
    var response = await NetWork.GET(NetWork.API_LIST, NetWork.paramsEmpty());
    if(response != null){
      items.value = NetWork.parsePostList(response);
    }else{
      items.value = new List();
    }
    isLoading(false);
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading(true);
    var response = await NetWork.DEL(NetWork.API_DELETE + post.id.toString(), NetWork.paramsEmpty());
    isLoading(false);
    return response != null;
  }

  Future<void> apiUpdatePost(Post post) async{
    String result = await Get.to(() => UpdatePage(post: post,));
    if(result != null) {
      Post newPost = NetWork.parsePost(result);
      items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
    }
  }

}