// Model storing request loan data
class RequestLoan {
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;
  final String location;
  final double salary;
  final int dependants;
  final String mainIncomeSource;
  final String passportPath;
  final String imagePath;

  RequestLoan(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.location,
    this.salary,
    this.dependants,
    this.mainIncomeSource,
    this.passportPath,
    this.imagePath,
  );
}

class PersonalInformation {
  final String firstName;
  final String lastName;
  final String email;
  final int phoneNumber;
  final String location;

  PersonalInformation(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.location,
  );
}

class EmploymentInformation {
  final double salary;
  final int dependants;
  final String mainIncomeSource;

  EmploymentInformation(
    this.salary,
    this.dependants,
    this.mainIncomeSource,
  );
}

class VerificationInformation {
  final String passportPath;
  final String imagePath;

  VerificationInformation(
    this.passportPath,
    this.imagePath,
  );
}
