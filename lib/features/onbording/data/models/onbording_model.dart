import '../../../../core/utiles/app_images.dart';

class OnbordingModel {
  final String backgroundImage;
  final String image;
  final String title;
  final String desc;
  final String textButton;
  OnbordingModel({
    required this.backgroundImage,
    required this.image,
    required this.title,
    required this.desc,
    required this.textButton,
  });
}
List<OnbordingModel> onbordings=[
  OnbordingModel(
      backgroundImage: AppImages.backgroung,
      image: AppImages.onbording1,
      title: "موزع معتمد",
      desc: '''هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على ''',
      textButton: "التالى"),
  OnbordingModel(
      backgroundImage: AppImages.backgroung,
      image: AppImages.onbording2,
      title: "طلباتك كلها عندنا",
      desc: '''هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على ''',
      textButton: "التالى"),
  OnbordingModel(
      backgroundImage: AppImages.backgroung,
      image: AppImages.onbording3,
      title: "اطلب  حاجتك بكل سهولة",
      desc: '''هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على '''  ,
      textButton: "ابدأ"),
];
