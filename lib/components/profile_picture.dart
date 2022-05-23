import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final Image? profilePhoto;

  const ProfilePic({
    Key? key,
    this.profilePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    final image = Image(
      image: profilePhoto!.image,
    ).image;

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );
  }
}
