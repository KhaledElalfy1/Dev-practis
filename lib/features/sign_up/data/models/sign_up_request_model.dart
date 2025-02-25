
import 'package:image_picker/image_picker.dart';
class SignUpRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String location;
  final XFile? profilePic;

  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.location,
    required this.profilePic,
  });

  Map<String,dynamic>toJson()=> {
    'name': name,
    'email': email,
    'phone': phone,
    'password': password,
    'confirmPassword': confirmPassword,
    'location': location,
  };

}


