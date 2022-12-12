class API{
  static const hostConnect='http://localhost/api_qrscan';
  static const hostConnectUser='$hostConnect/user';

  //Sign up user
  static const validateEmail = '$hostConnectUser/validate_email.php';
  static const signUp = '$hostConnectUser/signup.php';
}