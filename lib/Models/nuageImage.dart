class Nuage{
  String bgImage;
  
  String description;
  List<String> images;

  Nuage(
    this.bgImage,
    this.description,
    this.images,
  );

  static List<Nuage> nuages() {
    return [
      Nuage(
        'assets/images/meteo.png',
       
       
      
        "NICE SUNNY SPELLS EXPECTED AROUND 00:00 SKY RATHER CLEAR",
        [
          'assets/images/ori2.jpg',
          'assets/images/ori3.jpg',
          'assets/images/ori4.jpg',
        ],
      ),
      Nuage(
        'assets/images/meteo2.jpg',

       
       
        "NICE SUNNY SPELLS EXPECTED AROUND 04:00 SKY RATHER CLEAR",
        [
          'assets/images/rl2.jpg',
          'assets/images/rl3.jpg',
          'assets/images/rl4.jpg',
          'assets/images/rl5.jpg',
        ],
      ),
    ];
  }
}
