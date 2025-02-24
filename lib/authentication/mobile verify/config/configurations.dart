// lib/authentication/mobile_verify/config/configurations.dart

class AWSConfig {
  // Use const for immutable configuration values
  static const String userPoolId = 'us-east-1_reJmnefrX';
  static const String clientId = '6v65rojap5uj02tddkhcsk2u7f';
  static const String region = 'us-east-1';

  // Optional: Add endpoint if you need to specify a custom endpoint
  static const String endpoint = 'https://cognito-idp.$region.amazonaws.com';

  // Getter for the full configuration map
  static Map<String, String> get configMap => {
        'userPoolId': userPoolId,
        'clientId': clientId,
        'region': region,
        'endpoint': endpoint,
      };
}
