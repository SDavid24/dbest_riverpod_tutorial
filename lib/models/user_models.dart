class UserModel{
  final String id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  final String avatarMedium;
  final String avatarLarge;

  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
    required this.avatarMedium,
    required this.avatarLarge,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['login']['uuid'],
      email: json['email'],
      firstname: json['name']['first'],
      lastname: json['name']['last'],
      avatar: json['picture']['thumbnail']
          ?? 'https://img.freepik.com/free-vector/watercolor-women-s-day-background_23-2151254843.jpg?t=st=1717832383~exp=1717835983~hmac=18f03be5c80989b13db06138cd56f0abf1d9260f0b43f1ae0653a61898d54531&w=2000',
      avatarMedium: json['picture']['medium']
          ?? 'https://img.freepik.com/free-vector/watercolor-women-s-day-background_23-2151254843.jpg?t=st=1717832383~exp=1717835983~hmac=18f03be5c80989b13db06138cd56f0abf1d9260f0b43f1ae0653a61898d54531&w=2000',
      avatarLarge: json['picture']['large']
          ?? 'https://img.freepik.com/free-vector/watercolor-women-s-day-background_23-2151254843.jpg?t=st=1717832383~exp=1717835983~hmac=18f03be5c80989b13db06138cd56f0abf1d9260f0b43f1ae0653a61898d54531&w=2000',
    );

  }

//  @override
 // String toString() {
   // return 'UserModel{id: $id, email: $email, firstname: $firstname, lastname: $lastname, avatar: $avatar, avatarMedium: $avatarMedium, avatarLarge: $avatarLarge}';
  //}
}