import 'package:flutter/material.dart';

import '../../domain/models.dart';

class BillInputAndGroupPreview extends StatelessWidget {
  final Group group;
  final TextEditingController controller;

  const BillInputAndGroupPreview({super.key, required this.group, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: ParticipantsPreview(
              memberA: group.people.first,
              memberB: group.people.last,
            ),
          ),
          BillInput(
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class ParticipantsPreview extends StatelessWidget {
  final Person memberA;
  final Person memberB;

  const ParticipantsPreview({
    super.key,
    required this.memberA,
    required this.memberB,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBoxContainer(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ParticipantPreviewName(
                name: memberA.name,
                rightBorder: true,
                greater: memberA.income.compareTo(memberB.income) > 0,
              ),
              ParticipantPreviewName(
                name: memberB.name,
                greater: memberB.income.compareTo(memberA.income) > 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParticipantPreviewName extends StatelessWidget {
  final String name;
  final bool rightBorder;
  final bool greater;

  const ParticipantPreviewName({
    super.key,
    required this.name,
    this.rightBorder = false,
    required this.greater,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFBF9145);

    final decoration = rightBorder
        ? const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: color,
                width: 1,
              ),
            ),
          )
        : null;

    return Expanded(
      flex: greater ? 2 : 1,
      child: Container(
        decoration: decoration,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BillInput extends StatelessWidget {
  final TextEditingController controller;

  const BillInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBoxContainer(
      color: const Color.fromARGB(255, 3, 3, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            key: const Key('txtBillField'),
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.euro),
              suffixIconColor: Colors.white,
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
            cursorColor: Colors.white,
          ),
          const Text(
            "How much do you want to split?",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedBoxContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;

  const RoundedBoxContainer({
    super.key,
    required this.child,
    this.color = const Color.fromARGB(255, 235, 185, 84),
    this.height = 200,
  });

  final _boxShadow = const BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 15),
    blurRadius: 10,
    spreadRadius: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [_boxShadow],
      ),
      height: height,
      child: child,
    );
  }
}
