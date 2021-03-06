import 'package:http/http.dart';
import 'package:mobx/mobx.dart';

import '../model/todo_model.dart';
import 'package:http/http.dart' as http;

part 'api.g.dart';

class ApiStore = Api with _$ApiStore;

abstract class Api with Store {
  @observable
  List<CategoryResponse> list = [];

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMoreData = false;

  var limit = 15;

  int page = 1;

  @computed
  bool get loadingMoreData => isLoadingMoreData;

  @action
  Future<void> fetchData() async {
    isLoading = true;
    Response response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/todos?_limit=$limit&_page=$page"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      list = categoryResponseFromJson(response.body);
      page++;
    }
    isLoading = false;
  }

  @action
  Future<void> fetchMoreData() async {
    if(isLoadingMoreData) return;
    isLoadingMoreData = true;
    Response response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/todos?_limit=$limit&_page=$page"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var tempList = List.from(list);
      tempList.addAll(categoryResponseFromJson(response.body));
      list = List.from(tempList);
      page++;
    }
    isLoadingMoreData = false;
  }
}
