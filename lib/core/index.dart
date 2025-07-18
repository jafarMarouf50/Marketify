library;

import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_app/data/auth/index.dart';
import 'package:ecommerce_app/data/category/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/domain/category/index.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'config/assets/app_images.dart';
part 'config/assets/app_styles.dart';
part 'config/themes/app_colors.dart';
part 'config/themes/app_theme.dart';
part 'constants/app_constants.dart';
part 'init/firebase_initializer.dart';
part 'init/hive_initializer.dart';
part 'init/service_locator.dart';
part 'init/supabase_initializer.dart';
part 'services/supabase_uploader.dart';
part 'usecase/usecase.dart';
