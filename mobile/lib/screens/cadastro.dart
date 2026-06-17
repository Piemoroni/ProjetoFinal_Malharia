import 'package:flutter/material.dart';
import 'package:malharia/screens/login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String email = "";
  String senha = "";
  String confirmarSenha = "";
  bool _obscureSenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 246, 255),
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
              spacing: 6.0,
              children: [
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                ),

                Text(
                  "Nome",
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
                      labelText: "Digite seu nome",
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
                    onChanged: (value) {},
                  ),
                ),
                Text(
                  "CPF",
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
                      labelText: "Digite seu CPF",
                      filled: true,
                      fillColor: Color.fromARGB(255, 216, 236, 255),
                      labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 23, 85, 181),
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
                    onChanged: (value) {},
                  ),
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
                    onChanged: (value) {},
                  ),
                ),
                Text(
                  "Telefone",
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
                      labelText: "Digite seu telefone",
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
                    onChanged: (value) {},
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
                Text(
                  "Confirmar senha",
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
                      confirmarSenha = value;
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Já possui uma conta? Login",
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
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Text(
                    "Cadastrar",
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
