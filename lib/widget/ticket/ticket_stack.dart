import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:world_winner_flutter/widget/ticket/ticket.dart';

class TicketStack extends StatefulWidget {
  const TicketStack({
    super.key,
    required this.closeTicketsOverlay,
    required this.openTicketsOverlay,
    required this.onTicketPress,
    required this.isExpanded,
  });
  final void Function() closeTicketsOverlay;
  final void Function() openTicketsOverlay;
  final void Function() onTicketPress;
  final bool isExpanded;

  @override
  State<TicketStack> createState() => _TicketStackState();
}

class _TicketStackState extends State<TicketStack> {
  final ScrollController _controller = ScrollController();

  int? _selectedTicket;
  final bool _overlayOpen = true;

  get _isTicketSelected {
    return _selectedTicket != null;
  }

  get allPopped {
    return !_isTicketSelected && _overlayOpen;
  }

  void _scrollToTop() {
    _controller.animateTo(0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  void onTicketPress(int ticketValue) {
    _scrollToTop();
    setState(() {
      _selectedTicket = ticketValue;
    });
    widget.onTicketPress();
  }

  void _onTicketVerticalDragDown() {
    setState(() {
      _selectedTicket = null;
    });
    widget.closeTicketsOverlay();
  }

  @override
  Widget build(BuildContext context) {
    final ticketHeight = MediaQuery.of(context).size.height * 0.65;

    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.none,
          padding: const EdgeInsets.only(top: 50),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.isExpanded ? 5 : 0,
              sigmaY: widget.isExpanded ? 5 : 0,
            ),
            child: GestureDetector(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  ...[0, 1, 2].map(
                    (e) {
                      double stackPosition = (e * 50);
                      double openStackPosition = (e * 25);
                      double top = allPopped
                          ? stackPosition - 20
                          : e == _selectedTicket
                              ? -20
                              : openStackPosition + (ticketHeight + 50);

                      return Ticket(
                        onVerticalDragEnd: () {},
                        onVerticalDragUp: widget.openTicketsOverlay,
                        top: top,
                        onVerticalDragDown: _onTicketVerticalDragDown,
                        onTicketPress: () => onTicketPress(e),
                      );
                    },
                  ).toList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
