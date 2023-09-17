//? onboarding models
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
//? login models

class Customer {
  String id;
  String firstName;
  Customer(this.id, this.firstName);
}

class Contacts {
  String name;
  String phone;
  String email;
  Contacts(this.name, this.phone, this.email);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer, this.contacts);
}
