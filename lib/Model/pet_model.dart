class Pet {
  int id;
  String name;
  String breed;
  String sex;
  String idDuenio;
  int age;
  DateTime creationDate;
  bool state;

  Pet(
      {this.id,
      this.name,
      this.breed,
      this.sex,
      this.idDuenio,
      this.age,
      this.creationDate,
      this.state});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
        id: json['id'],
        name: json['nombre'],
        breed: json['raza'],
        sex: json['sexo'],
        idDuenio: json['idCliente'],
        age: json['edad'],
        //creationDate: DateTime.parse(json['creationDate']),
        state: json['estado']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': name,
        'raza': breed,
        'sexo': sex,
        'idCliente': idDuenio,
        'edad': age,
        'fechaCreacion': creationDate.toIso8601String(),
        'estado': state
      };
  Map<String, dynamic> toJsonRegistry() => {
        'nombre': name,
        'raza': breed,
        'sexo': sex,
        'idCliente': idDuenio,
        'edad': age,
        'estado': state,
        'fechaCreacion': creationDate.toIso8601String()
      };
}
