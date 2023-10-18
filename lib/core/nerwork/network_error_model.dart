import 'package:equatable/equatable.dart';

class NetworkErrorModel extends Equatable {
  final String statusMsg;
  final int statusCode;
  final bool success;

  const NetworkErrorModel({
  required  this.statusMsg,
  required  this.statusCode,
  required  this.success
  });

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json)=>NetworkErrorModel(
      statusMsg: json['status_message'],
      statusCode:json['status_code'],
      success: json['success'],
  );

  @override
  List<Object> get props => [statusMsg, statusCode, success];
}