## Dağıtım İçin Hazırlık Prompt Şablonu

Bu şablon, mobil uygulamanın test ortamlarından veya doğrudan üretim ortamına dağıtımı için gerekli son hazırlıkları yapmak üzere bir yapay zeka ajanına (Manus AI) verilecek komutun temel yapısını tanımlar. Bu şablon, `commands/05_prepare_for_deployment.txt` komutu tarafından kullanılır.

---

**Şablon Açıklaması:**

Bu prompt, ajandan `10_deployment_guidelines.md` dosyasında belirtilen adımları takip ederek uygulamanın dağıtım için hazır hale getirilmesini ister. Bu, genellikle uygulamanın versiyon numarasını güncelleme, EAS Build ile derleme ve EAS Submit ile mağazalara gönderme işlemlerini içerir.

**Kullanım:**

Bu şablon, `commands/05_prepare_for_deployment.txt` dosyasındaki talimatlar doğrultusunda ajana iletilir. Ajan, bu şablondaki yönergeleri takip ederek dağıtım hazırlıklarını gerçekleştirir.

```
# Ajan: Mobilet
# Görev: Mobil Uygulamayı Dağıtım İçin Hazırla

# Referans Bağlam Dosyaları:
# - context/10_deployment_guidelines.md

# Hedef Klasör:
# - output/builds/

# Ek Talimatlar:
# - `context/10_deployment_guidelines.md` dosyasındaki yönergelere göre `app.json` dosyasındaki uygulama versiyonunu (`version`, `android.versionCode`, `ios.buildNumber`) güncelle.
# - EAS Build kullanarak Android için üretim derlemesi (`.aab` veya `.apk`) oluştur.
# - EAS Build kullanarak iOS için üretim derlemesi (`.ipa`) oluştur.
# - Oluşturulan derleme dosyalarını `output/builds/` klasörüne kaydet.
# - Derlemeler tamamlandıktan sonra, `context/10_deployment_guidelines.md` dosyasındaki mağaza gönderme talimatlarına göre EAS Submit ile Google Play Store ve Apple App Store Connect platformlarına gönder.
# - Dağıtım sürecinin loglarını ve sonuçlarını raporla.
# - Herhangi bir hata veya sorun durumunda, sorunu açıkla ve çözüm önerisi sun.
```

**Beklenen Çıktı:**

*   Uygulamanın güncel versiyon numarası.
*   Android için `.aab` veya `.apk` ve iOS için `.ipa` derleme dosyaları `output/builds/` klasöründe.
*   Uygulamanın Google Play Store ve Apple App Store Connect platformlarına başarıyla gönderilmesi.

