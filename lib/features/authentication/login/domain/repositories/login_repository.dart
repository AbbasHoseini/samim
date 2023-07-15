

import 'package:samim/features/authentication/login/data/models/email_password_params_model.dart';



abstract class LoginRepository {
    Future login(EmailPasswordParams params);
}