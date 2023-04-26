class LogInModel {
    LogInModel({
        this.message,
        this.token,
    });

    final String? message;
    final String? token;

    factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
    };
}
