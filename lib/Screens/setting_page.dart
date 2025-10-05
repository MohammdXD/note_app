import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/locale_provider.dart';
import '../generated/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final isArabic = localeProvider.locale.languageCode == 'ar';

    return Scaffold(
      backgroundColor: const Color(0xff152e6a),
      appBar: AppBar(
        backgroundColor: const Color(0xff152e6a),
        elevation: 0,
        title: Text(
          S.of(context).settings,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              S.of(context).language,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff0a3697),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  isArabic ? 'العربية' : 'English',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: Switch(
                  value: isArabic,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  onChanged: (value) {
                    final newLocale = value
                        ? const Locale('ar')
                        : const Locale('en');
                    localeProvider.setLocale(newLocale);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
