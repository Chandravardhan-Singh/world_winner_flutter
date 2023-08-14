import 'package:flutter/material.dart';

class AddTicket extends StatelessWidget {
  const AddTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Add tickets',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      blurStyle: BlurStyle.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                      offset: const Offset(1, 1),
                      spreadRadius: 4,
                    )
                  ],
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const Text(
                '1',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      blurStyle: BlurStyle.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                      offset: const Offset(1, 1),
                      spreadRadius: 4,
                    )
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
