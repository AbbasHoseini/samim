import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:samim/core/resources/data_state.dart';
import 'package:samim/features/authentication/login/data/data_source/local/local_api_provider.dart';
import 'package:samim/features/authentication/login/data/models/email_password_params_model.dart';
import 'package:samim/features/authentication/login/domain/entities/user_entity.dart';
import 'package:samim/features/authentication/login/domain/repositories/login_repository.dart';
import 'package:samim/features/authentication/login/domain/use_cases/login_usecase.dart';

class LoginRepositoryImpl extends LoginRepository {
  LocalApiProvider localApiProvider;
  LoginRepositoryImpl(this.localApiProvider);

  
  // @override
  // Future login(EmailPasswordParams params) async {
  //   try {
  //     dynamic response = await localApiProvider.login();
  //     print('EEEEEEE $response ${response.runtimeType}');

  //     // final List<dynamic> jsonList = json.decode(response);
  //     final List<UserEntity> users =
  //         response.map((json) => UserEntity.fromJson(json)).toList();
  //     print('object');

  //     for (var user in users) {
  //       if (user.email == params.email) {
  //         if (user.state == 'enable') {
  //           print('TTTTTTT ${user.email}');
  //           // return true;
  //           return const DataSuccess(null, 'Successfull');
  //         } else {
  //           print('TTTTTTT ${user.email}');
  //           // return false;
  //           return const DataFailed('Something went wrong!');
  //         }
  //       }
  //     }
  //     print('TTTTTTT null');
  //     // return false; // User not found
  //     return const DataFailed('Something went wrong!');
  //   } catch (e, s) {
  //     debugPrint('Error $e, $s');
  //     // return false;
  //     return const DataFailed('Something went wrong!');
  //   }
  // }

  @override
Future login(EmailPasswordParams params) async {
  try {
    dynamic response = await localApiProvider.login();
    print('EEEEEEE $response ${response.runtimeType}');

    final List<dynamic> jsonList = response;
    final List<UserEntity> users = jsonList
        .map<UserEntity>((json) => UserEntity.fromJson(json))
        .toList();
    print('object');

    for (var user in users) {
      if (user.email == params.email) {
        if (user.state == 'enable') {
          print('TTTTTTT ${user.email}');
          return DataSuccess(null, 'Successful');
        } else {
          print('TTTTTTT ${user.email}');
          return DataFailed( "شما اجازه دسترسی به این قسمت را ندارید");
        }
      }
    }
    print('TTTTTTT null');
    return DataFailed('کاربری با این مشخصات یافت نشد');
  } catch (e, s) {
    debugPrint('Error $e, $s');
    return DataFailed('مشکلی بوجود آمده است');
  }
}


}

class UserSearch {
  static String? searchUser(List<UserEntity> users, String email) {
    for (var user in users) {
      if (user.email == email) {
        if (user.state == 'enable') {
          return 'Logged in';
        } else {
          return "You don't have permission";
        }
      }
    }
    return null; // User not found
  }
}

// class LoginRepositoryImpl extends LoginRepository {
//   LocalApiProvider localApiProvider;
//   LoginRepositoryImpl(this.localApiProvider);

//   @override
//   Future<DataState<List<UserEntity>>> login(EmailPasswordParams params) async {
//     try {
//       final List<UserEntity> users = await localApiProvider.login();
//       return DataSuccess<List<UserEntity>>(users);
//     } catch (e) {
//       return DataFailed<List<UserEntity>>("Error");
//     }
//   }
// }

