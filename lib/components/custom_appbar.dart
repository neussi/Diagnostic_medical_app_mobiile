import 'package:app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, this.appTitle, this.route, this.icon, this.actions})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String? appTitle;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white, //couleur de fond app : blanche
      elevation: 0,
      title: Text(
        widget.appTitle!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      //si l’icône n’est pas définie, retourner null
      leading: widget.icon != null
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Config.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  //si l’itinéraire est donné, ce bouton d’icône naviguera vers ça
                  if (widget.route != null) {
                    Navigator.of(context).pushNamed(widget.route!);
                  } else {
                    //Sinon retour à la page précédente
                    Navigator.of(context).pop();
                  }
                },
                icon: widget.icon!,
                iconSize: 16,
                color: Colors.white,
              ),
            )
          : null,
      //si l’action n’est pas définie, renvoie null
      actions: widget.actions,
    );
  }
}
