import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

class LoginCommand
    extends Command<LoginEventData, LoginEventRawData, AuthEventResponse> {
  static final int id = Apis.authenticate.index;
  static final String name = Apis.authenticate.name;

  LoginCommand() : super(id, name);

  @override
  Future<AuthEventResponse> handleEvent(LoginEventData eventData) async {
    int messageId = eventData.messageId;

    return handleRawEvent(eventData.toRawServiceEventData(messageId));
  }

  @override
  Future<AuthEventResponse> handleRawEvent(LoginEventRawData eventData) async {
    Api api = AuthenticateApi();

    Uri url = Uri.https(host, api.url);

    Map<String, Object> body = {
      LoginRequestKeys.username.name: eventData.username,
      LoginRequestKeys.password.name: eventData.password
    };
    Map<String, String> headers = {"Content-Type": "application/json"};

    return ApiService.instance()
        .client
        .post(url, body: jsonEncode(body), headers: headers)
        .then((response) {
      try {
        final decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        AuthResponse authResponse = AuthResponse.fromJson(decodedResponse);

        return AuthEventResponse(
            authResponse: authResponse, messageId: eventData.messageId);
      } catch (e) {
        return AuthEventResponse(
            messageId: eventData.messageId,
            status: ServiceEventResponseStatus.error);
      }
    });
  }
}

enum LoginResponseKeys {
  etablissementId,
  expirationDate,
  idIndividu,
  token,
  userId,
  userName,
}

enum LoginRequestKeys {
  username,
  password,
}

class AuthResponse {
  final int etablissementId;
  final String expirationDate;
  final int idIndividu;
  final String token;
  final int userId;
  final String userName;

  AuthResponse(
      {required this.etablissementId,
      required this.expirationDate,
      required this.idIndividu,
      required this.token,
      required this.userId,
      required this.userName});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      etablissementId: json[LoginResponseKeys.etablissementId.name],
      expirationDate: json[LoginResponseKeys.expirationDate.name],
      idIndividu: json[LoginResponseKeys.idIndividu.name],
      token: json[LoginResponseKeys.token.name],
      userId: json[LoginResponseKeys.userId.name],
      userName: json[LoginResponseKeys.userName.name],
    );
  }
}

class LoginEventRawData extends RawServiceEventData {
  final String username;
  final String password;

  LoginEventRawData(
      {required this.username,
      required this.password,
      required int messageId,
      required String requesterId})
      : super(messageId, requesterId, Apis.authenticate.index);
}

class LoginEventData extends ServiceEventData {
  final String username;
  final String password;
  final int messageId;

  LoginEventData(
      {required this.username,
      required this.password,
      required this.messageId,
      required String requesterId})
      : super(requesterId);

  @override
  LoginEventRawData toRawServiceEventData(int messageId) {
    return LoginEventRawData(
        username: username,
        password: password,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class AuthEventResponse extends ServiceEventResponse {
  final AuthResponse? authResponse;

  AuthEventResponse(
      {this.authResponse,
      required int messageId,
      ServiceEventResponseStatus status = ServiceEventResponseStatus.success})
      : super(messageId, status);
}
