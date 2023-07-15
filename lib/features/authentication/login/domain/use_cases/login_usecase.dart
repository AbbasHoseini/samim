import 'package:samim/core/usecase/use_case.dart';
import 'package:samim/features/authentication/login/data/models/email_password_params_model.dart';
import 'package:samim/features/authentication/login/domain/repositories/login_repository.dart';


class LoginUseCase extends UseCase<dynamic, EmailPasswordParams> {
  LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);

  @override
  Future call(EmailPasswordParams param) {
    return loginRepository.login(param);
  }
  
}

