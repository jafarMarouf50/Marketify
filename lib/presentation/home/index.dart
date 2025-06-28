library;

import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// bloc
part './bloc/user/user_info_display_cubit.dart';
part './bloc/user/user_info_display_state.dart';
// pages
part './pages/home_view.dart';
part './widgets/categories.dart';
// widgets
part './widgets/header.dart';
part './widgets/search_filed.dart';
part './widgets/top_selling.dart';
