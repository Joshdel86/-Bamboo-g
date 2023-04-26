class SignUpModel {
    SignUpModel({
        this.firstName,
        this.lastName,
        this.age,
        this.email,
        this.phoneNumber,
        this.password,
    });

    final String? firstName;
    final String? lastName;
    final String? age;
    final String? email;
    final String? phoneNumber;
    final String? password;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
    };
}
