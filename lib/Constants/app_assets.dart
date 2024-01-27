class AppAssets{

  // Images
  static String animals = _getImagePath('animal.jpg');
  static String fashion = _getImagePath('fashion.jpg');
  static String nature = _getImagePath('nature.jpg');
  static String people = _getImagePath('people.jpg');
  static String travel = _getImagePath('travel.jpg');

  // Animation
  static String loaderAnimation = _getAnimationPath('loader.json');

  static _getAnimationPath(String filename){
    return "Assets/Animation/$filename";
  }

  static _getImagePath(String filename){
    return "Assets/Images/$filename";
  }
}
