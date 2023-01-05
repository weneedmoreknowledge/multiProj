class API{
  static const hostConnect='http://localhost/api_qrscan';
  static const hostConnectUser='$hostConnect/user';

  //Sign up user
  static const validateEmail = '$hostConnectUser/validate_email.php';
  static const signUp = '$hostConnectUser/signup.php';
  static const login = '$hostConnectUser/login.php';
  static const feedback = '$hostConnectUser/feedback.php';
  static const update = '$hostConnectUser/update.php';
  static const history = '$hostConnectUser/history.php';
}