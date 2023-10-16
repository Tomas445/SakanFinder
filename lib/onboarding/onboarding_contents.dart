import 'package:mano/core/constant/imageasset.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  const OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  const OnboardingContents(
    title: "اسكتشف مكانك",
    image: AppImageAsset.onBoardingImageOne,
    desc:
        "تقدر من خلال هذا التطبيق انك تشوف المكان   المناسب ليك بكل سهوله وبسعر مناس ليك",
  ),
  const OnboardingContents(
    title: "احجز مكانك",
    image: AppImageAsset.onBoardingImageTwo,
    desc:
        "تقدر تحجز من خلال هذا التطبيق بعد التفواوض   مع المالك  بخصوص كل شى  وتحجز مكانك  المناسب",
  ),
  const OnboardingContents(
    title: "احجز سريرك ",
    image: AppImageAsset.onBoardingImageThree,
    desc:
        "تقدر تحجز من خلال هذا التطبيق بعد التفواوض   مع المالك  بخصوص كل شى  وتحجز مكانك  المناسب",
  ),
  const OnboardingContents(
    title: "وضع حد للسعر",
    image: AppImageAsset.onBoardingImageFour,
    desc: "قم بعمل فلتر على السعر الذى يناسبك",
  ),
  const OnboardingContents(
    title: "اختار وسائل راحتك",
    image: AppImageAsset.onBoardingImageFive,
    desc:
        "تقدر تحجز من خلال هذا التطبيق بعد التفواوض   مع المالك  بخصوص كل شى  وتحجز مكانك  المناسب",
  ),
];
