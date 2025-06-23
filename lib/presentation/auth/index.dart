library;

import 'package:ecommerce_app/common/index.dart';
import 'package:ecommerce_app/core/config/assets/app_images.dart';
import 'package:ecommerce_app/core/config/assets/app_styles.dart';
import 'package:ecommerce_app/core/config/themes/app_colors.dart';
import 'package:ecommerce_app/core/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

/// pages
part './pages/signin_view.dart';

part './pages/enter_password_view.dart';

part './pages/forget_password_view.dart';

part './pages/reset_password_view.dart';

part './pages/signup_view.dart';

part './pages/gender_and_age_selection_view.dart';

/// widgets
part './widgets/auth_prompt.dart';

part './widgets/custom_text_field.dart';

part './widgets/title_screen.dart';

part './widgets/gender_tile.dart';

part './widgets/age_selection.dart';

part './widgets/ages.dart';

//bloc
part './bloc/gender_selection_cubit.dart';
part './bloc/age_selection_cubit.dart';