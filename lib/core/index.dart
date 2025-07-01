library;

import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// config
part './config/assets/app_images.dart';
part './config/assets/app_styles.dart';
part './config/themes/app_colors.dart';
part './config/themes/app_theme.dart';
//constants
part './constants/app_constants.dart';
//init
part './init/firebase_initializer.dart';
// use case
part './usecase/usecase.dart';
part 'init/hive_initializer.dart';
