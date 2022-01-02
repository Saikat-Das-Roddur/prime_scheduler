import 'dart:async';

import 'package:prime_scheduler/models/announcement_response.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/announcement_repository.dart';
import 'package:prime_scheduler/repositories/logged_in_home_repository.dart';


class LoggedInHomeBloc{
  late LoggedInHomeRepository _repository;
  late StreamController<Response<AnnouncementResponse>> _getAnnouncementStreamController;

  StreamSink<Response<AnnouncementResponse>> get getAnnouncementSink =>
      _getAnnouncementStreamController.sink;

  Stream<Response<AnnouncementResponse>> get getAnnouncementStream =>
      _getAnnouncementStreamController.stream;

  LoggedInHomeBloc(){
    _repository = LoggedInHomeRepository();
    _getAnnouncementStreamController = StreamController<Response<AnnouncementResponse>>();
  }
  Future<AnnouncementResponse?> getAnnouncement(String adminId) async {
    getAnnouncementSink.add(Response.loading(''));
    try{
      AnnouncementResponse response = await _repository.getAnnouncement(adminId);
      getAnnouncementSink.add(Response.completed(response));
      return response;
    }catch(e){
      getAnnouncementSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _getAnnouncementStreamController.close();
  }
}