import 'package:flutter/material.dart';
import 'package:malharia/screens/home.dart';

import 'cadastro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _AppState();
}

class _AppState extends State<Login> {
  String email = "";
  String senha = "";
  bool _obscureSenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.0,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 23, 85, 181),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 216, 236, 255),
                      labelText: "Digite seu email",
                      labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 23, 85, 181),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 23, 85, 181),
                          width: 1.0, // Espessura
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 23, 85, 181),
                          width: 1.0,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ),
                Text(
                  "Senha",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 23, 85, 181),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: _obscureSenha,
                    decoration: InputDecoration(
                      labelText: "Digite a senha",
                      filled: true,
                      fillColor: Color.fromARGB(255, 216, 236, 255),
                      labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 23, 85, 181),
                      ),

                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureSenha
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color.fromARGB(255, 23, 85, 181),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureSenha = !_obscureSenha;
                          });
                        },
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 23, 85, 181),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 23, 85, 181),
                          width: 1.0,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      senha = value;
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cadastro()),
                    );
                  },
                  child: Text(
                    "Não tem uma conta? Cadastrar-se",
                    style: TextStyle(color: Color.fromARGB(255, 23, 85, 181)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 154, 175, 210),
                    side: BorderSide(
                      width: 2.0,
                      color: const Color.fromARGB(255, 140, 175, 230),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Color.fromARGB(255, 23, 85, 181)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
