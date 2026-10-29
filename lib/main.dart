
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'cubit/keranjang_cubit.dart';
import 'pages/beranda_page.dart';
import 'providers/favorit_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoritProvider(),
        ),
      ],
      child: BlocProvider<KeranjangCubit>(
        create: (_) => KeranjangCubit(),
        child: const EcoMartApp(),
      ),
    ),
  );
}

class EcoMartApp extends StatelessWidget {
  const EcoMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoMart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F8F3),
      ),
      home: const BerandaPage(),
    );
  }
}
