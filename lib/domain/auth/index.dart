library;

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/data/auth/index.dart';
import 'package:ecommerce_app/service_locator.dart';

// repository
part './repositories/auth_repository.dart';

//usecase
part './usecases/signup_usecase.dart';
part './usecases/signin_usecase.dart';
part './usecases/get_ages_usecase.dart';
part './usecases/reset_password_usecase.dart';