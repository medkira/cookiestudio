// onboarding models
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  List<SliderObject> sliderObject;
  int numberOfSlide;

  SliderViewObject({
    required this.numberOfSlide,
    required this.sliderObject,
  });
}
