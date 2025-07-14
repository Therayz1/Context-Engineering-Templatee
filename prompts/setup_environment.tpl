## Geliştirme Ortamı Kurulumu İçin Prompt Şablonu

Bu şablon, React Native (Expo) mobil uygulama projesi için geliştirme ortamını kurmak üzere bir yapay zeka ajanına (Manus AI) verilecek komutun temel yapısını tanımlar. Bu şablon, `commands/01_setup_environment.txt` komutu tarafından kullanılır.

---

**Şablon Açıklaması:**

Bu prompt, ajandan `05_tech_stack.md` dosyasında belirtilen teknoloji yığınına uygun bir Node.js ortamı kurmasını ve gerekli kütüphaneleri yüklemesini ister. Ayrıca, Expo CLI aracılığıyla yeni bir Expo projesi başlatmasını ve temel proje yapısını oluşturmasını bekler.

**Kullanım:**

Bu şablon, `commands/01_setup_environment.txt` dosyasındaki talimatlar doğrultusunda ajana iletilir. Ajan, bu şablondaki yönergeleri takip ederek ortam kurulumunu gerçekleştirir.

```
# Ajan: Mobilet
# Görev: Mobil Uygulama Projesi Geliştirme Ortamını Kur

# Referans Bağlam Dosyaları:
# - context/05_tech_stack.md

# Ek Talimatlar:
# - `context/05_tech_stack.md` dosyasında belirtilen Node.js versiyonunu ve kütüphaneleri yükle.
# - Expo CLI ve gerekli diğer global paketleri kur.
# - Yeni bir Expo projesi başlat ve `my-mobile-app` olarak adlandır.
# - `package.json` dosyasındaki tüm bağımlılıkları yükle.
# - Projenin temel klasör yapısını oluştur: `src/{assets,components,navigation,screens,services,store,utils,hooks,types}` ve `tests/{unit,integration,e2e}`.
# - `README.md` dosyasını projenin amacına uygun bir başlık ve kısa bir açıklama ile oluştur.
# - `.gitignore` dosyasını oluştur/güncelle ve hassas dosyaları (node_modules, build çıktıları, loglar) versiyon kontrolünden hariç tut.
# - Kurulum sırasında herhangi bir hata oluşursa, hatayı raporla ve çözüm önerisi sun.
```

**Beklenen Çıktı:**

*   Gerekli Node.js kütüphanelerinin yüklü olduğu bir ortam.
*   Temel Expo projesi (`my-mobile-app` klasörü içinde).
*   Projenin temel klasör yapısı.
*   `README.md` ve `.gitignore` dosyaları.

