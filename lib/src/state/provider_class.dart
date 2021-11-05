import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';


class ProviderClass extends ChangeNotifier{

  int _selectedAppBarIndex = 0;
  int get getSelectedAppBarIndex => _selectedAppBarIndex;
  set setSelectedAppBarIndex(int val){
    _selectedAppBarIndex = val;
    notifyListeners();
  }

  Project? selectedProject;
  Project? get getSelectedProject => selectedProject;
  set setSelectedProject(Project val){
    selectedProject = val;
    notifyListeners();
  }


  final ScrollController _scrollController = ScrollController();
  bool pageScrolled = false;
  ScrollController get getScrollController => _scrollController;
  bool get isPageScrolled => pageScrolled;

  void listenToScrollChanges(){
    _scrollController.addListener(() {
      if(_scrollController.offset >= kToolbarHeight / 2){
        setPageScrollingState = true;
      }else{
        setPageScrollingState = false;
      }
      notifyListeners();
    });
  }

  void disposeOfScrollController(){
    _scrollController.dispose();
    notifyListeners();
  }

  set setPageScrollingState(bool val){
    pageScrolled = val;
    notifyListeners();
  }

  // final PageController _pageController = PageController();
  // PageController get getPageController => _pageController;
  // void disposeOfPageController(){
  //   _pageController.dispose();
  //   notifyListeners();
  // }




  bool _disposed = false;
  
  @override
  void dispose() {
    _disposed = true;
    disposeOfScrollController();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if(!_disposed) super.notifyListeners();
  }
}