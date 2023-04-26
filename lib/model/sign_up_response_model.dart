class SignUpResponseModel {
    SignUpResponseModel({
        this.message,
        this.newuser,
    });

    final String? message;
    final Newuser? newuser;

    factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        message: json["message"],
        newuser: Newuser.fromJson(json["newuser"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "newuser": newuser!.toJson(),
    };
}

class Newuser {
    Newuser({
        this.firstName,
        this.lastName,
        this.age,
        this.email,
        this.password,
        this.phoneNumber,
        this.role,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    final String? firstName;
    final String? lastName;
    final int? age;
    final String? email;
    final String? password;
    final String? phoneNumber;
    final String? role;
    final String? id;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory Newuser.fromJson(Map<String, dynamic> json) => Newuser(
        firstName: json["firstName"],
        lastName: json["lastName"],
        age: json["age"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "age": age,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "role": role,
        "_id": id,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
