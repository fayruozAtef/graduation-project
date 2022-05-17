import 'dart:async';
import 'dart:convert' show json;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

abstract class IFCMNotificationService {
  Future<void> sendNotificationToUser({

    required String title,
    required String body,
    required String tableno,
  });

}

class FCMNotificationService extends IFCMNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final String _endpoint = 'https://fcm.googleapis.com/fcm/send';
  final String _contentType = 'application/json';
  final String _authorization =
      'key=AAAAq241yYI:APA91bHo6UFGnCz242a_UVQCSV1_-Lrl63mpGCuCSPehHMkwHqsbBapF4h7JShO89ilk3aWkLz0lKE1zE_MMVhDGC67n_bOQohU5YOZt5akspPcH_cV0dzjeDO2JQyttcHs2uWv08Y4p';
  Future<http.Response> _sendNotification(

      String title,
      String body,
      String tableno,
      ) async {
    try {
      final dynamic data = json.encode(
        {
          'to': '/topics/waiter',
          'priority': 'high',
          'data':{
            'table': tableno
          },
          'notification': {
            'title': title,
            'body': body,
          },
          'content_available': true
        },
      );
      http.Response response = await http.post(
        Uri.parse(_endpoint),
        body: data,
        headers: {
          'Content-Type': _contentType,
          'Authorization': _authorization
        },
      );

      return response;
    } catch (error) {
      throw Exception(error);
    }
  }


  @override
  Future<void> sendNotificationToUser({

    required String title,
    required String body,
    required String tableno,
  }) {
    return _sendNotification(
      title,
      body,
      tableno,
    );
  }


}