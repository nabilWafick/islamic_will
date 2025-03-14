enum ClientType { individual, company, ngo }

extension ClientTypeExtension on ClientType {
  String get name {
    switch (this) {
      case ClientType.individual:
        return "Particulier";
      case ClientType.company:
        return "Société";
      case ClientType.ngo:
        return "ONG";
    }
  }

  String get value {
    switch (this) {
      case ClientType.individual:
        return "individual";
      case ClientType.company:
        return "company";
      case ClientType.ngo:
        return "ngo";
    }
  }

  static ClientType? fromValue(String value) {
    switch (value.toLowerCase()) {
      case "individual":
        return ClientType.individual;
      case "company":
        return ClientType.company;
      case "ngo":
        return ClientType.ngo;
      default:
        return null;
    }
  }

  static ClientType? fromName(String name) {
    switch (name.toLowerCase()) {
      case "particulier":
        return ClientType.individual;
      case "société":
        return ClientType.company;
      case "ong":
        return ClientType.ngo;
      default:
        return null;
    }
  }
}

enum AuthenticationStatus {
  unauthenticated,
  authenticated,
  enrolled,
}
