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


  bool emailIsSentWithSuccess = false;
  bool get getEmailSendingStatus => emailIsSentWithSuccess;
  set setEmailSendingStatus(bool val){
    emailIsSentWithSuccess = val;
    notifyListeners();
  }


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