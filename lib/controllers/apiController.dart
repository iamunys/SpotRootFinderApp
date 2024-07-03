import 'package:get/get.dart';
import 'package:spotrootpartner/model/getUserSpot.dart';
import 'package:spotrootpartner/services/ApiProvider/SpotApi.dart';

class ApiController extends GetxController {
  Future<List<Spot>>? getSpotList;

  Future<void> getSpotMethod({required String id}) async {
    getSpotList = SpotApiProvider.getSpots(id: id);
    update();
  }
}
