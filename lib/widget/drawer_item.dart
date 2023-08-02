import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(239, 239, 239, 1),
        ),
        child: Icon(
          Icons.home_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      title: Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
      onTap: onTap,
    );
  }
}
