import 'package:get/get_navigation/src/root/internacionalization.dart';

class Langue extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'Hello'},
        //'hi_IN': {'hello': 'नमस्ते'},
        //'fr_FR': {'hello': 'Bonjour'},
      };
}
