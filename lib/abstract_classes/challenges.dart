///Challenge 1
abstract class Storage {
  void save() {
    print('Save Storage');
  }

  void retreive() {
    print('Retreive from Stroage');
  }
}

class LocalStorage extends Storage {}

class CloudStorage extends Storage {}
