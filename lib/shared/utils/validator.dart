// 业务相关的验证工具类

class Validator {
  /// 验证邮箱格式
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    return emailRegex.hasMatch(email);
  }

  /// 验证手机号格式
  static bool isValidPhone(String phone) {
    final RegExp phoneRegex = RegExp(r'^1[3-9]\d{9}$');
    return phoneRegex.hasMatch(phone);
  }

  /// 验证密码强度
  /// 至少包含数字、字母，长度6-20位
  static bool isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-zA-Z])(?=.*\d).{6,20}$',
    );
    return passwordRegex.hasMatch(password);
  }

  /// 验证用户名
  /// 仅允许字母、数字、下划线，长度3-20位
  static bool isValidUsername(String username) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    return usernameRegex.hasMatch(username);
  }
}