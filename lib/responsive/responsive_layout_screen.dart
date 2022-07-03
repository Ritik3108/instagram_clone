import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {Key key, this.mobileScreenLayout, this.webScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth > webScreenSize) {
          //web screen
          return webScreenLayout;
        }

        //mobile screen
        return mobileScreenLayout;
      },
    );
  }
}
