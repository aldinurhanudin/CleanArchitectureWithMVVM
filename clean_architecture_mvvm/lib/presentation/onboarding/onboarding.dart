import 'package:clean_architecture_mvvm/domain/model/model.dart';
import 'package:clean_architecture_mvvm/presentation/onboarding/onboarding_view_model.dart';
import 'package:clean_architecture_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  
  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind( ){
    _viewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
    
  }
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(stream: _viewModel.outputSliderViewObject, builder: (context, snapShot) {
      return _getContentWidget(snapShot.data);
    },);
  }

Widget _getContentWidget (SliderViewObject? sliderViewObject){
  
 if(sliderViewObject== null){
  return Container();
 }else
 return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: sliderViewObject.numOfSlides,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return OnBoardingpage(sliderViewObject.sliderObject);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            // Add layout for indicator and arrows
            _getBottomSheetWidget(sliderViewObject)
          ],
        ),
      ),
    );
}


Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
  return Container(
    color: ColorManager.primary,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //left arrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
            onTap: (){
              // go to next slide
              _pageController.animateToPage(_viewModel.goPrevious(),duration: Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);
            },
          ),
        ),
  
        //circles indicator
        Row(
          children: [
            for(int i =0;i< sliderViewObject.numOfSlides;i++)
            Padding(padding: EdgeInsets.all(AppPadding.p8),
            child: _getProperCircle(i, sliderViewObject.currentIndex),
            ),
          ],
        ),
  
        //right arrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),
            onTap: (){
              // go to next slide
              _pageController.animateToPage(_viewModel.goNext(), duration: Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);
            },
          ),
        ),
      ],
    ),
  );
}



Widget _getProperCircle(int index, int _currentIndex){
  if (index == _currentIndex) {
     return SvgPicture.asset(ImageAssets.hollowCircleIc);
  }else{
    return SvgPicture.asset(ImageAssets.solidCircleIc);
  }
}

@override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}
class OnBoardingpage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingpage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image),

        //image widget
      ],
    );
  }
}

