import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItems extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

  const MenuItems(
      {Key? key,
      required this.icon,
      required this.text,
      this.isActive = false,
      required this.onPressed})
      : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: isHovered
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(widget.icon, color: Colors.white.withOpacity(0.3)),
                SizedBox(width: 10),
                Text(
                  widget.text,
                  style: GoogleFonts.roboto(
                      fontSize: 12, color: Colors.white.withOpacity(0.8)),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
