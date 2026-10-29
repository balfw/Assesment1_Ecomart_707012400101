import 'package:flutter/material.dart';

class FormPemesananPage extends StatefulWidget {
  const FormPemesananPage({super.key});

  @override
  State<FormPemesananPage> createState() => _FormPemesananPageState();
}

class _FormPemesananPageState extends State<FormPemesananPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();

  String metodePengiriman = 'Diantar';
  bool setuju = false;

  @override
  void dispose() {
    namaController.dispose();
    teleponController.dispose();
    super.dispose();
  }

  void kirimPesanan() {
    if (namaController.text.trim().isEmpty ||
        teleponController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan nomor telepon wajib diisi')),
      );
      return;
    }
    if (!setuju) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan setujui pembelian terlebih dahulu')),
      );
      return;
    }
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pesanan berhasil dikirim')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pemesanan'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Data Pembeli',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: 'Nama Pembeli',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: teleponController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Nomor Telepon',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Metode Pengiriman', style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<String>(
            title: const Text('Diantar'),
            value: 'Diantar',
            groupValue: metodePengiriman,
            onChanged: (value) => setState(() => metodePengiriman = value!),
          ),
          RadioListTile<String>(
            title: const Text('Ambil di Tempat'),
            value: 'Ambil di Tempat',
            groupValue: metodePengiriman,
            onChanged: (value) => setState(() => metodePengiriman = value!),
          ),
          CheckboxListTile(
            value: setuju,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('Saya menyetujui pesanan ini'),
            onChanged: (value) => setState(() => setuju = value ?? false),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: kirimPesanan,
            icon: const Icon(Icons.send),
            label: const Text('Kirim Pesanan'),
          ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali ke Beranda'),
          ),
          const SizedBox(height: 12),
          const Text(
            'Pesanan pada latihan ini hanya disimulasikan dan belum disimpan ke server.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
