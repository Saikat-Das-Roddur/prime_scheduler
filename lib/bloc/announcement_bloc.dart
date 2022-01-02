import 'dart:async';

import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/announcement_repository.dart';

class AnnouncementBloc{

  late AnnouncementRepository _repository;
  late StreamController<Response<dynamic>> _addAnnouncementStreamController;

  StreamSink<Response<dynamic>> get addAnnouncementSink =>
      _addAnnouncementStreamController.sink;

  Stream<Response<dynamic>> get addAnnouncementStream =>
      _addAnnouncementStreamController.stream;

  AnnouncementBloc(){
    _repository = AnnouncementRepository();
    _addAnnouncementStreamController = StreamController<Response<dynamic>>();
  }
  Future<dynamic> addAnnouncement(Map body) async {
    addAnnouncementSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.addAnnouncement(body: body);
      addAnnouncementSink.add(Response.completed(response));
      return response;
    }catch(e){
      addAnnouncementSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _addAnnouncementStreamController.close();
  }
}