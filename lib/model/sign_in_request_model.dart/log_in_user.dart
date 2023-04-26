class LogInUserRequestModel {
    LogInUserRequestModel({
        this.email,
        this.password,
    });

    final String? email;
    final String? password;

    factory LogInUserRequestModel.fromJson(Map<String, dynamic> json) => LogInUserRequestModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
