import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _posicaoX = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 246, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBar(
          backgroundColor: const Color(0xFF8CAFE6),
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/imgs/menu.png',
                      width: 60,
                      height: 60,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 10,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/imgs/voltar.png',
                      width: 40,
                      height: 40,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/logo(2).png',
                            width: 350,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 20.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Categorias",
              style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 23, 85, 181),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: _posicaoX,
                  right: -_posicaoX,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        _posicaoX += details.delta.dx;
                      });
                    },
                    child: const _CardDeslizavelCategorias(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Favoritos",
              style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 23, 85, 181),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: _posicaoX,
                  right: -_posicaoX,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        _posicaoX += details.delta.dx;
                      });
                    },
                    child: const _CardDeslizavel(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardDeslizavel extends StatelessWidget {
  const _CardDeslizavel();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _Produto(nome: "Produto 1", img: "assets/imgs/prod1.png"),
          _Produto(nome: "Produto 2", img: "assets/imgs/prod2.png"),
          _Produto(nome: "Produto 3", img: "assets/imgs/prod3.png"),
          _Produto(nome: "Produto 4", img: "assets/imgs/prod4.png"),
        ],
      ),
    );
  }
}

class _CardDeslizavelCategorias extends StatelessWidget {
  const _CardDeslizavelCategorias();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(15),
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _Produto(nome: "Categoria 1", img: "assets/imgs/cat1.png"),
          _Produto(nome: "Categoria 2", img: "assets/imgs/cat2.png"),
          _Produto(nome: "Categoria 3", img: "assets/imgs/cat3.png"),
          _Produto(nome: "Categoria 4", img: "assets/imgs/cat4.png"),
        ],
      ),
    );
  }
}

class _Produto extends StatelessWidget {
  final String nome;
  final String img;

  const _Produto({required this.nome, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF1FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(img, fit: BoxFit.contain)),
          const SizedBox(height: 5),
          Text(
            nome,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
