library;

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/data/auth/index.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:hive/hive.dart';

//entity
part './entity/user_entity.dart';
part './entity/user_entity.g.dart';
// repository
part './repositories/auth_repository.dart';
part './usecases/get_ages.dart';
part './usecases/get_current_user.dart';
part './usecases/is_logged.dart';
part './usecases/reset_password.dart';
part './usecases/signin.dart';
part './usecases/signout.dart';
//usecase
part './usecases/signup.dart';
