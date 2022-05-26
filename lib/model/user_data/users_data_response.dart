import 'dart:convert';

UsersData usersDataFromJson(String str) => UsersData.fromJson(json.decode(str));

String usersDataToJson(UsersData data) => json.encode(data.toJson());

class UsersData {
  UsersData({
    this.results,
    this.info,
  });

  List<Result>? results;
  Info? info;

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
    "info": info == null ? null : info!.toJson(),
  };
}

class Info {
  Info({
    this.seed,
    this.results,
    this.page,
    this.version,
  });

  String? seed;
  int? results;
  int? page;
  String? version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    seed: json["seed"] == null ? null : json["seed"],
    results: json["results"] == null ? null : json["results"],
    page: json["page"] == null ? null : json["page"],
    version: json["version"] == null ? null : json["version"],
  );

  Map<String, dynamic> toJson() => {
    "seed": seed == null ? null : seed,
    "results": results == null ? null : results,
    "page": page == null ? null : page,
    "version": version == null ? null : version,
  };
}

class Result {
  Result({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  Gender? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Dob? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    gender: json["gender"] == null ? null : genderValues.map![json["gender"]],
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    email: json["email"] == null ? null : json["email"],
    login: json["login"] == null ? null : Login.fromJson(json["login"]),
    dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
    registered: json["registered"] == null ? null : Dob.fromJson(json["registered"]),
    phone: json["phone"] == null ? null : json["phone"],
    cell: json["cell"] == null ? null : json["cell"],
    id: json["id"] == null ? null : Id.fromJson(json["id"]),
    picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
    nat: json["nat"] == null ? null : json["nat"],
  );

  Map<String, dynamic> toJson() => {
    "gender": gender == null ? null : genderValues.reverse![gender],
    "name": name == null ? null : name!.toJson(),
    "location": location == null ? null : location!.toJson(),
    "email": email == null ? null : email,
    "login": login == null ? null : login!.toJson(),
    "dob": dob == null ? null : dob!.toJson(),
    "registered": registered == null ? null : registered!.toJson(),
    "phone": phone == null ? null : phone,
    "cell": cell == null ? null : cell,
    "id": id == null ? null : id!.toJson(),
    "picture": picture == null ? null : picture!.toJson(),
    "nat": nat == null ? null : nat,
  };
}

class Dob {
  Dob({
    this.date,
    this.age,
  });

  DateTime? date;
  int? age;

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    age: json["age"] == null ? null : json["age"],
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date!.toIso8601String(),
    "age": age == null ? null : age,
  };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

class Id {
  Id({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "value": value == null ? null : value,
  };
}

class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  });

  Street? street;
  String? city;
  String? state;
  String? country;
  dynamic postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: json["street"] == null ? null : Street.fromJson(json["street"]),
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    country: json["country"] == null ? null : json["country"],
    postcode: json["postcode"],
    coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
    timezone: json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street == null ? null : street!.toJson(),
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "country": country == null ? null : country,
    "postcode": postcode,
    "coordinates": coordinates == null ? null : coordinates!.toJson(),
    "timezone": timezone == null ? null : timezone!.toJson(),
  };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String? latitude;
  String? longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}

class Street {
  Street({
    this.number,
    this.name,
  });

  int? number;
  String? name;

  factory Street.fromJson(Map<String, dynamic> json) => Street(
    number: json["number"] == null ? null : json["number"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "number": number == null ? null : number,
    "name": name == null ? null : name,
  };
}

class Timezone {
  Timezone({
    this.offset,
    this.description,
  });

  String? offset;
  String? description;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    offset: json["offset"] == null ? null : json["offset"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset == null ? null : offset,
    "description": description == null ? null : description,
  };
}

class Login {
  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    uuid: json["uuid"] == null ? null : json["uuid"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    salt: json["salt"] == null ? null : json["salt"],
    md5: json["md5"] == null ? null : json["md5"],
    sha1: json["sha1"] == null ? null : json["sha1"],
    sha256: json["sha256"] == null ? null : json["sha256"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid == null ? null : uuid,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "salt": salt == null ? null : salt,
    "md5": md5 == null ? null : md5,
    "sha1": sha1 == null ? null : sha1,
    "sha256": sha256 == null ? null : sha256,
  };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  Title? title;
  String? first;
  String? last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    title: json["title"] == null ? null : titleValues.map![json["title"]],
    first: json["first"] == null ? null : json["first"],
    last: json["last"] == null ? null : json["last"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : titleValues.reverse![title],
    "first": first == null ? null : first,
    "last": last == null ? null : last,
  };
}

enum Title { MS, MR, MRS }

final titleValues = EnumValues({
  "Mr": Title.MR,
  "Mrs": Title.MRS,
  "Ms": Title.MS
});

class Picture {
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  String? large;
  String? medium;
  String? thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    large: json["large"] == null ? null : json["large"],
    medium: json["medium"] == null ? null : json["medium"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "large": large == null ? null : large,
    "medium": medium == null ? null : medium,
    "thumbnail": thumbnail == null ? null : thumbnail,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
