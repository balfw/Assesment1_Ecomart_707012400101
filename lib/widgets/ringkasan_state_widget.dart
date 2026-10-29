import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../cubit/keranjang_cubit.dart';
import '../providers/favorit_provider.dart';

class RingkasanStateWidget extends StatelessWidget {
  const RingkasanStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<FavoritProvider>(
          builder: (context, favorit, child) {
            return Text('Jumlah favorit: ${favorit.jumlahFavorit}');
          },
        ),
        BlocBuilder<KeranjangCubit, int>(
          builder: (context, jumlah) {
            return Text('Jumlah keranjang: $jumlah barang');
          },
        ),
      ],
    );
  }
}
