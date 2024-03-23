import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int indexDrawer = 0;

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String mensaje = '';
  String user = "LuisOchoa", pass = '123456789';
  int indice = 0;
  final username = TextEditingController();
  final password = TextEditingController();
  Widget iconVisible = Icon(Icons.visibility);
  Widget iconInvisible = Icon(Icons.visibility_off);
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return dinamico();
  }

  Widget dinamico() {
    switch (indice) {
      case 0:
        {
          return Scaffold(
            backgroundColor: Color.fromRGBO(17, 17, 17, 1),
            appBar: AppBar(
              title: Text('GasPriceApp',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              foregroundColor: Colors.white,
              centerTitle: true,
              backgroundColor: Color.fromRGBO(34, 56, 67, 1),
            ),
            body: ListView(
              padding: EdgeInsets.fromLTRB(60, 100, 60, 100),
              children: [
                Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: username,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: Text("Username:"),
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: password,
                  obscureText: _visible,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      label: Text("password:"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                        icon: _visible ? iconInvisible : iconVisible,
                      ),
                      fillColor: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  mensaje,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          String userText = username.text;
                          String passText = password.text;
                          if (userText == user && passText == pass)
                            setState(() {
                              indice = 1;
                            });
                          else
                            mensaje =
                            'Error: Usuario o contraseña incorrecta.\nVuelva a intentarlo';
                        });
                      },
                      child: Text('Login'),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(200, 40))),
                    )
                  ],
                )
              ],
            ),
          );
        }

      case 1:
        {
          return Scaffold(
            backgroundColor: Color.fromRGBO(17, 17, 17, 1),
            appBar: AppBar(
              title: Text('GasPriceApp',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              foregroundColor: Colors.white,
              centerTitle: true,
              backgroundColor: Color.fromRGBO(34, 56, 67, 1),
            ),
            body: ListView(),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(34, 56, 67, 1)),
                    child: Column(
                      children: [
                        CircleAvatar(child: Text('LO'), radius: 30,),
                        SizedBox(height: 10,),
                        Text('Luis Ochoa',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '(C) Tec de Tepic',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  itemDrawer(1, Icons.add, 'CAPTURAR'),
                  itemDrawer(2, Icons.list_alt, 'MOSTRAR'),
                  itemDrawer(3, Icons.refresh, 'ACTUALIZAR'),
                  itemDrawer(4, Icons.delete, 'ELIMINAR'),
                  itemDrawer(5, Icons.logout, 'Cerrar sesión')
                ],
              ),
            ),
          );
        }
      default:
        return Scaffold();
    }
  }

  Widget itemDrawer(int index, IconData icon, String name) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          indexDrawer = index;
          if(index == 5)indice = 0;
        });
      },
      title: Row(
        children: [
          Expanded(child: Icon(icon)),
          Expanded(child: Text(name),
            flex: 2,
          )
        ],
      ),
    );
  }


}
