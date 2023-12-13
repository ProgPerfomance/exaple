import 'dart:io';

List<User> users = [];

void main() {
  while (true) {
    int select = 0;
    print('Выберите действие\n1 - создать анкету\n2 - Просмотреть анкеты');
    select = int.parse(stdin.readLineSync().toString());
    switch (select) {
      case 1:
        createUser();
        break;
      case 2:
        getUsersList();
        break;
    }
  }
  //print(OutUserInfo(name: user.name, city: user.city, sex: user.sex, age: user.age, title: user.title, hobbyes: user.hobbyes, uid: user.uid).printUserInfo());
}

class User {
  final String? name;
  final String? city;
  final String? sex;
  final int? age;
  final String? title;
  final List? hobbyes;
  final int? uid;
  User(
      {required this.name,
      required this.city,
      required this.sex,
      required this.age,
      required this.title,
      required this.hobbyes,
      required this.uid});
  @override
  String toString() {
    // TODO: implement toString
    return '$name, $city, $sex, $title, $hobbyes, $uid';
  }
}

void createUser() {
  users.add(User(
    name: stdin.readLineSync(),
    city: stdin.readLineSync(),
    sex: stdin.readLineSync(),
    age: int.parse(stdin.readLineSync()!),
    title: stdin.readLineSync(),
    hobbyes: [],
    uid: 1,
  ));
}

void getUsersList() {
  for (int i = 0; i < users.length; i++) {
    var user = users[i];
    print(OutUserInfo(
            name: user.name,
            city: user.city,
            sex: user.sex,
            age: user.age,
            title: user.title,
            hobbyes: user.hobbyes,
            uid: user.uid)
        .getUserInfo());
    print('Лайк - 1 \nДизлайк - 2\nПрекратить просмотр - 3');
    int select = 0;
    select = int.parse(stdin.readLineSync().toString());
    switch(select) {
      case 1:
        print('Лайк отправлен');
        break;
      case 2:
        print('Анкета пропущена');
        break;
      case 3:
        i = users.length;
        break;
      default:
        print('Неверный ввод');
    }
  }
}

class OutUserInfo extends User {
  OutUserInfo(
      {required super.name,
      required super.city,
      required super.sex,
      required super.age,
      required super.title,
      required super.hobbyes,
      required super.uid});
  String getUserInfo() {
    return '------------------------------------------------------\nИмя: $name\nГород: $city\nПол: $sex\nВозраст: $age\nТекст анкеты: $title\n------------------------------------------------------';
  }
}

//4 команды
//создать удалить обновить получить
