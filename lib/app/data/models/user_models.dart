// class UserModel {
//   final String? id;
//   final String? email;
//   final String? firstName;
//   final String? lastName;
//   final String? profilePhoto;
//   final String? phone;
//
//   UserModel({
//     this.id,
//     this.email,
//     this.firstName,
//     this.lastName,
//     this.profilePhoto,
//     this.phone,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id']?.toString(),
//       email: json['email'],
//       firstName: json['first_name'] ?? json['firstName'],
//       lastName: json['last_name'] ?? json['lastName'],
//       profilePhoto: json['profile_photo'] ?? json['profilePhoto'],
//       phone: json['phone'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'email': email,
//       'first_name': firstName,
//       'last_name': lastName,
//       'profile_photo': profilePhoto,
//       'phone': phone,
//     };
//   }
// }