class AuthValidators {
  static String? name(String? value) {
    if (value == null || value.isEmpty) return "Le nom requis.";
    if (value.trim().length < 3) return "Le nom doit contenir au moins trois lettres.";

    final regExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!regExp.hasMatch(value.trim())) {
      return 'Le nom doit contenir uniquement des lettres.';
    }
    return null;
  }

  static String? firstname(String? value) {
    if (value == null || value.isEmpty) return "Le prénom requis.";
    if (value.trim().length < 3) return "Le prénom doit contenir au moins trois lettres.";

    final regExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!regExp.hasMatch(value.trim())) {
      return 'Le prénom doit contenir uniquement des lettres.';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) return "Le numéro est requis";
    if (value.trim().length < 8) return "Le numéro doit contenir au moins 8 chiffres.";

    final regExp = RegExp(r'^[0-9\s]+$');
    if (!regExp.hasMatch(value.trim())) {
      return 'Le numéro doit contenir uniquement des chiffres.';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'adresse e-mail est requise.';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'L\'adresse e-mail n\'est pas valide.';
    }
    return null;
  }

  static String? ifuNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le numéro IFU est requis.';
    }

    final numericRegex = RegExp(r'^\d{13}$');
    if (!numericRegex.hasMatch(value)) {
      return 'Le numéro IFU doit contenir exactement 13 chiffres.';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis.';
    }

    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères.';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins une lettre majuscule.';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins une lettre minuscule.';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins un chiffre.';
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Le mot de passe doit contenir au moins un caractère spécial.";
    }

    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'La confirmation du mot de passe est requise.';
    }

    if (value != password) {
      return 'Les mots de passe ne correspondent pas.';
    }

    return null;
  }
}

class ValuesValidator {
  static String? qualityRequirements(String? value) {
    if (value == null || value.isEmpty) return "L'exigence est requise.";
    if (value.trim().length < 3) return "L'exigence doit contenir au moins trois caractères.";

    return null;
  }

  static String? penalties(String? value) {
    if (value == null || value.isEmpty) return "La pénalité est requise.";
    if (value.trim().length < 3) return "La pénalité doit contenir au moins trois caractères.";

    return null;
  }

  static String? paymentsTerms(String? value) {
    if (value == null || value.isEmpty) return "Les termes de payements sont requis.";
    if (value.trim().length < 3)
      return "Les termes de payements contenir au moins trois caractères.";

    return null;
  }
}
