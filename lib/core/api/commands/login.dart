import 'dart:convert';

import 'package:progresswebtu/core/api/feature.dart';
import 'package:progresswebtu/utility/serviceStore/service.dart';

final int loginEventId = Apis.authenticate.index;
final String loginEventName = Apis.authenticate.name;

class LoginCommand
    extends Command<LoginEventData, LoginEventRawData, AuthEventResponse> {

  final Map<String, String> _headers;

  LoginCommand([this._headers = const {}]) : super(loginEventId, loginEventName);

  @override
  Future<AuthEventResponse> handleEvent(LoginEventData eventData) async {
    return handleRawEvent(eventData.toRawServiceEventData());
  }

  @override
  Future<AuthEventResponse> handleRawEvent(LoginEventRawData eventData) async {
    Api api = AuthenticateApi();

    Uri url = Uri.https(host, api.url);

    Map<String, Object> body = {
      LoginRequestKeys.username.name: eventData.username,
      LoginRequestKeys.password.name: eventData.password
    };

    return ApiService.instance()
        .client
        .post(url, body: jsonEncode(body), headers: _headers)
        .then((response) {
      try {
        final decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        LoginResponse authResponse = LoginResponse.fromJson(decodedResponse);

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

class LoginResponse {
  final int etablissementId;
  final String expirationDate;
  final int idIndividu;
  final String token;
  final int userId;
  final String userName;

  LoginResponse(
      {required this.etablissementId,
      required this.expirationDate,
      required this.idIndividu,
      required this.token,
      required this.userId,
      required this.userName});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      etablissementId: json[LoginResponseKeys.etablissementId.name] ?? 0,
      expirationDate: json[LoginResponseKeys.expirationDate.name] ?? "",
      idIndividu: json[LoginResponseKeys.idIndividu.name] ?? 0,
      token: json[LoginResponseKeys.token.name] ?? "",
      userId: json[LoginResponseKeys.userId.name] ?? 0,
      userName: json[LoginResponseKeys.userName.name] ?? "",
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
      : super(messageId, requesterId, loginEventId);
}

class LoginEventData extends ServiceEventData<LoginEventRawData> {
  final String username;
  final String password;

  LoginEventData({
    required this.username,
    required this.password,
    required String requesterId,
  }) : super(requesterId);

  @override
  LoginEventRawData toRawServiceEventData() {
    return LoginEventRawData(
        username: username,
        password: password,
        messageId: messageId,
        requesterId: requesterId);
  }
}

class AuthEventResponse extends ServiceEventResponse {
  final LoginResponse? authResponse;

  AuthEventResponse(
      {this.authResponse,
      required int messageId,
      ServiceEventResponseStatus status = ServiceEventResponseStatus.success})
      : super(messageId, status);
}

class LoginEvent extends ServiceEvent<AuthEventResponse> {
  LoginEvent({required super.eventData, super.callback})
      : super(loginEventId, loginEventName, serviceId);
}
