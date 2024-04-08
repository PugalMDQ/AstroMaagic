import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'hello': 'HELLO WORLD',
          'message': 'WELCOME TO PROTO CODERS POINT',
          'title': 'Flutter Language - Localization',
          'Language': 'Language',
        },
        //TAMIL LANGUAGE
        'ta_IN': {
          "hello": "ஹலோ உலகம்",
          "message": "பதிப்பகம் கேள்வியுடன் வருக",
          "title": "ஃப்ளட்டர் மொழி - மொழியை உள்ளமைப்பது",
          "Language": "மொழி"
        },
        // KANNADA LANGUAGE
        'kn_IN': {
          "hello": "ಹಲೋ ಪ್ರಪಂಚ",
          "message": "ಪ್ರಕಟಣೆ ಸ್ವಾಗತ",
          "title": "ಫ್ಲಟರ್ ಭಾಷೆ - ಭಾಷಾಂತರಿಸುವುದು",
          "sub": "ಈಗ ಚಂದಾದಾರರಾಗಿ",
          "Language": "ಭಾಷೆ"
        },
        // HINDI LANGUAGE
        'hi_IN': {
          "hello": "ಹಲೋ ಪ್ರಪಂಚ",
          "message": "ಪ್ರಕಟಣೆ ಸ್ವಾಗತ",
          "title": "ಫ್ಲಟರ್ ಭಾಷೆ - ಭಾಷಾಂತರಿಸುವುದು",
          "sub": "ಈಗ ಚಂದಾದಾರರಾಗಿ",
          "Language": "भाषा"
        },
      };
}
