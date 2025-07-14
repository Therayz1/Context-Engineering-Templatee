
# run_tests.tpl

## Testleri Çalıştırma ve Raporlama İçin Prompt Şablonu

Bu şablon, mobil uygulama projesindeki testleri çalıştırmak ve sonuçları raporlamak üzere bir yapay zeka ajanına (Manus AI) verilecek komutun temel yapısını tanımlar. Bu şablon, `commands/04_run_tests.txt` komutu tarafından kullanılır.

---

**Şablon Açıklaması:**

Bu prompt, ajandan `07_testing_strategy.md` dosyasında belirtilen test araçlarını (Jest, React Native Testing Library) kullanarak projedeki tüm testleri çalıştırmasını ister. Test sonuçları toplanır, özetlenir ve bir rapor halinde sunulur. Amaç, uygulamanın kalitesini ve kararlılığını doğrulamaktır.

**Kullanım:**

Bu şablon, `commands/04_run_tests.txt` dosyasındaki talimatlar doğrultusunda ajana iletilir. Ajan, bu şablondaki yönergeleri takip ederek testleri çalıştırır ve raporlar.

```
# Ajan: Manus AI
# Görev: Mobil Uygulama Testlerini Çalıştır ve Raporla

# Referans Bağlam Dosyaları:
# - context/07_testing_strategy.md

# Hedef Klasör:
# - output/test_reports/

# Ek Talimatlar:
# - `context/07_testing_strategy.md` dosyasında belirtilen test araçlarını (Jest, React Native Testing Library) kullanarak birim ve entegrasyon testlerini çalıştır.
# - Test sonuçlarını XML veya JSON formatında `output/test_reports/` klasörüne kaydet.
# - Kod kapsamı (code coverage) raporunu oluştur ve `output/test_reports/` klasörüne kaydet.
# - Test sonuçlarını özetleyen, başarılı/başarısız test sayısı, kod kapsamı yüzdesi ve varsa hata detaylarını içeren bir Markdown raporu (`output/test_reports/test_summary_report.md`) oluştur.
# - Eğer E2E testleri yapılandırılmışsa, onları da çalıştır ve sonuçlarını raporla.
# - Herhangi bir hata veya test başarısızlığı durumunda, sorunu açıkla ve çözüm önerisi sun.
```

**Beklenen Çıktı:**

*   `output/test_reports` klasöründe, çalıştırılan testlerin sonuçlarını içeren dosyalar (XML, JSON, HTML).
*   `output/test_reports/test_summary_report.md` dosyasında, test sonuçlarını özetleyen okunabilir bir rapor.

