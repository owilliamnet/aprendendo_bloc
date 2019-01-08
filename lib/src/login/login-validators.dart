import 'dart:async';

class Validator {
  final performEmailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String emailValidationRule =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailValidationRule);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Favor informar um email válido');
    }
  });

  final performPasswordValidation =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    String passwordValidationRule =
        '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,10})';
    RegExp regExp = RegExp(passwordValidationRule);

    if (regExp.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError(
          'A senha tem que ter um número, uma letra minúscula, uma maiúscula, um caracter especial "@#%" e entre 6 e 10 caracteres');
    }
  });
}
