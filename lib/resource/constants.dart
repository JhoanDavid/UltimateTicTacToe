class Constants {
  static const urlAuthority =
      'http://ec2-18-216-139-106.us-east-2.compute.amazonaws.com:8090';
  static const pathBase = '/api/mascotas';

  // API
  static const urlFindAllPets = pathBase + '/mascota/all';
  static const urlInsertPet = pathBase + '/mascota/save';
  static const urlUpdatePet = pathBase + '/mascota/update';
  static const urlFindByIdPet = pathBase + '/mascota/id';
  static const urlFindByNamePet = pathBase + '/mascota/nombre';
  static const urlDeletePet = pathBase + '/mascota/delete';
  static const insertSuccess = 'El registro se realizó correctamente.';
  static const updateSuccess = 'El registro se actualizó correctamente.';
  static const deleteSuccess = 'El registro se eliminó correctamente.';
}
