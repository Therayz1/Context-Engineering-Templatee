# React Native Expo Mobil Uygulama Geliştirme - Context Engineering Şablonu! Kendinize göre özelleştirebilirsiniz proje yapınıza göre.

Bu proje, React Native ve Expo kullanarak cross-platform mobil uygulamalar geliştirmeyi amaçlamaktadır. Proje, mobil uygulama geliştirme yaşam döngüsünün tüm aşamalarını kapsayan sistematik bir yaklaşımla tasarlanmıştır: proje planlama, UI/UX tasarımı, bileşen geliştirme, durum yönetimi, API entegrasyonu, test, performans optimizasyonu ve dağıtım.

## 🚀 Proje Amacı

*   Modern, performanslı ve kullanıcı dostu cross-platform mobil uygulamalar geliştirmek için kapsamlı bir şablon sağlamak.
*   React Native ve Expo ekosisteminin en iyi pratiklerini kullanarak ölçeklenebilir ve bakımı kolay uygulamalar oluşturmak.
*   Yapay zeka ajanları ile işbirliği içinde hızlı ve tutarlı mobil uygulama geliştirme süreci sunmak.
*   Geliştiriciler için yeniden kullanılabilir, özelleştirilebilir ve profesyonel bir başlangıç noktası oluşturmak.

## 🧠 Bağlam Mühendisliği (Context Engineering) Yapısı

Bu proje, yapay zeka ajanları ile işbirliği içinde geliştirilmek üzere özel olarak tasarlanmış kapsamlı bir bağlam mühendisliği yapısına sahiptir. Bu yapı, projenin tutarlı, yeniden üretilebilir ve yönetilebilir olmasını sağlar. İşte ana bileşenleri:

```
react-native-expo-mobile-app-v1/
│
├───📁 context/             # Projenin tüm kuralları, hedefleri ve detayları
│   ├───📄 01_persona.md
│   ├───📄 02_project_overview.md
│   ├───📄 03_rules.md
│   ├───📄 04_app_structure.md
│   ├───📄 05_tech_stack.md
│   ├───📄 06_software_architecture.md
│   ├───📄 07_testing_strategy.md
│   ├───📄 08_api_integration.md
│   ├───📄 09_performance_optimization.md
│   └───📄 10_deployment_guidelines.md
│
├───📁 commands/            # Yapay zeka ajanına verilecek sıralı komutlar
│   ├───📄 01_setup_environment.txt
│   ├───📄 02_generate_tasks.txt
│   ├───📄 03_execute_tasks.txt
│   ├───📄 04_run_tests.txt
│   └───📄 05_prepare_for_deployment.txt
│
├───📁 prompts/             # Yapay zeka ajanına özel komut şablonları
│   ├───📄 setup_environment.tpl
│   ├───📄 generate_tasklist.tpl
│   ├───📄 execute_task.tpl
│   ├───📄 run_tests.tpl
│   └───📄 prepare_for_deployment.tpl
│
└───📁 output/              # Yapay zeka ajanının ürettiği tüm çıktılar
    ├───📁 builds/          # Uygulama derlemeleri (.apk, .aab, .ipa)
    ├───📁 test_reports/    # Test sonuçları ve raporları
    ├───📁 screenshots/     # Uygulama ekran görüntüleri
    └───📁 docs/            # Proje dokümantasyonları (görev listesi vb.)
```

### 📂 `context` Klasörü: Projenin Kılavuzu

Bu klasör, yapay zeka ajanının projenin her aşamasında başvuracağı temel bilgi kaynağıdır. Projenin ne olduğunu, nasıl yapılacağını, hangi kurallara uyulacağını ve başarı kriterlerini detaylandırır:

*   **`01_persona.md`**: Yapay zeka ajanının rolünü ve kimliğini tanımlar (Mobilet - Kıdemli Mobil Uygulama Geliştiricisi).
*   **`02_project_overview.md`**: Projenin iş hedeflerini, misyonunu, vizyonunu, hedef kitleyi ve başarı kriterlerini açıklar.
*   **`03_rules.md`**: Kod kalitesi, güvenlik, performans, UI/UX prensipleri gibi uyulması zorunlu kuralları içerir.
*   **`04_app_structure.md`**: Uygulama ekranlarını, gezinme akışını ve kullanıcı deneyimi haritasını detaylandırır.
*   **`05_tech_stack.md`**: Projede kullanılacak tüm teknolojileri, kütüphaneleri ve araçları listeler (React Native, Expo, TypeScript vb.).
*   **`06_software_architecture.md`**: Bileşen mimarisi, klasör yapısı, durum yönetimi ve kod organizasyonunu tanımlar.
*   **`07_testing_strategy.md`**: Birim testleri, entegrasyon testleri ve E2E testleri stratejilerini açıklar.
*   **`08_api_integration.md`**: Backend API entegrasyonu, kimlik doğrulama ve veri akışı yönergelerini içerir.
*   **`09_performance_optimization.md`**: Mobil uygulama performansını optimize etmek için stratejileri ve teknikleri belirler.
*   **`10_deployment_guidelines.md`**: App Store ve Google Play Store'a dağıtım süreçlerini ve EAS kullanımını açıklar.

### ⚙️ `commands` Klasörü: Projenin Tetikleyicileri

Bu klasördeki `.txt` dosyaları, yapay zeka ajanına projenin hangi aşamasında ne yapması gerektiğini söyleyen sıralı komutlardır. Her bir dosya, belirli bir görevi başlatır:

*   **`01_setup_environment.txt`**: Expo CLI, Node.js kütüphanelerini kurar ve temel proje klasör yapısını oluşturur.
*   **`02_generate_tasks.txt`**: `context` klasöründeki bilgilere dayanarak detaylı bir mobil uygulama geliştirme görev listesi oluşturur.
*   **`03_execute_tasks.txt`**: Oluşturulan görev listesindeki maddeleri tek tek yerine getirir (bileşen geliştirme, ekran oluşturma, API entegrasyonu vb.).
*   **`04_run_tests.txt`**: Birim testleri, entegrasyon testleri çalıştırır ve test raporları oluşturur.
*   **`05_prepare_for_deployment.txt`**: Uygulamayı App Store ve Google Play Store'a dağıtım için hazırlar (EAS Build, EAS Submit).

### 💡 `prompts` Klasörü: Akıllı Komut Şablonları

Bu klasör, `commands` klasöründeki komutları çalıştırırken yapay zeka ajanına verilecek olan hazır prompt (komut istemi) şablonlarını içerir. Bu şablonlar, ajanın görevleri tutarlı ve doğru bir şekilde anlamasını sağlar:

*   **`setup_environment.tpl`**: Geliştirme ortamı kurulumu için prompt şablonu.
*   **`generate_tasklist.tpl`**: Görev listesi oluşturma için prompt şablonu.
*   **`execute_task.tpl`**: Tek bir görevi yürütme için prompt şablonu.
*   **`run_tests.tpl`**: Test çalıştırma ve raporlama için prompt şablonu.
*   **`prepare_for_deployment.tpl`**: Dağıtım hazırlığı için prompt şablonu.

### 📊 `output` Klasörü: Eserin Ortaya Çıktığı Yer

Bu klasör, yapay zeka ajanının ürettiği tüm çıktıların depolandığı yerdir:

*   **`builds/`**: Uygulama derlemeleri - Android için `.apk` ve `.aab` dosyaları, iOS için `.ipa` dosyaları.
*   **`test_reports/`**: Test sonuçları, kod kapsamı raporları ve kalite metrikleri.
*   **`screenshots/`**: Uygulama ekran görüntüleri, UI/UX dokümantasyonu için görseller.
*   **`docs/`**: Proje görev listesi, API dokümantasyonu ve geliştirme notları.

## 🚀 Projeyi Başlatma

Bu projeyi başlatmak için temel olarak `commands` klasöründeki `.txt` dosyalarını sırayla kullanmanız gerekmektedir. Her bir `.txt` dosyası, içinde yapay zeka ajanına (veya manuel olarak size) verilecek talimatları içerir.

### Adım Adım Başlatma Kılavuzu:

1.  **Ortamı Kurun:** 
    ```bash
    # commands/01_setup_environment.txt dosyasındaki talimatları takip edin
    # Expo CLI, Node.js bağımlılıkları ve proje klasör yapısını kurar
    ```

2.  **Görev Listesi Oluşturun:** 
    ```bash
    # commands/02_generate_tasks.txt dosyasındaki talimatı kullanın
    # Yapay zeka ajanından projenin detaylı görev listesini oluşturmasını isteyin
    ```

3.  **Görevleri Yürütün:** 
    ```bash
    # commands/03_execute_tasks.txt dosyasındaki talimatları takip edin
    # Bileşenler, ekranlar, API entegrasyonu, durum yönetimi görevlerini yürütün
    ```

4.  **Testleri Çalıştırın:** 
    ```bash
    # commands/04_run_tests.txt ile birim ve entegrasyon testlerini çalıştırın
    # Test raporlarını oluşturun ve kod kalitesini doğrulayın
    ```

5.  **Dağıtım Hazırlığı:** 
    ```bash
    # commands/05_prepare_for_deployment.txt ile uygulamayı mağazalara hazırlayın
    # EAS Build ve EAS Submit kullanarak dağıtım sürecini başlatın
    ```

### Örnek Kullanım:

```bash
# 1. Proje klasörünü oluşturun
mkdir my-awesome-mobile-app && cd my-awesome-mobile-app

# 2. Bu şablonu klonlayın
git clone https://github.com/Therayz1/Context-Engineering-Templatee.git .

# 3. commands/01_setup_environment.txt dosyasındaki talimatları takip edin
# Expo CLI kurulumu ve proje başlatma

# 4. Yapay zeka ajanı ile çalışmaya başlayın
# Her bir command dosyasını sırayla kullanın
```

## 🛠️ Teknoloji Yığını

*   **Framework:** React Native + Expo
*   **Dil:** TypeScript / JavaScript
*   **UI Kütüphanesi:** React Native Paper / NativeBase
*   **Gezinme:** React Navigation v6+
*   **Durum Yönetimi:** Zustand / React Context API
*   **API İstemcisi:** Axios
*   **Test:** Jest + React Native Testing Library
*   **Dağıtım:** Expo Application Services (EAS)

## 📱 Desteklenen Platformlar

*   ✅ **iOS** (iPhone, iPad)
*   ✅ **Android** (Telefon, Tablet)
*   ✅ **Web** (Expo Web desteği ile)

## 📋 Özellikler

*   📦 **Hazır Bileşen Kütüphanesi** - Atomic Design prensipleri
*   🔐 **Kimlik Doğrulama** - JWT tabanlı güvenli giriş sistemi
*   🎨 **Modern UI/UX** - Responsive tasarım ve tema desteği
*   📊 **Durum Yönetimi** - Merkezi ve optimize edilmiş veri akışı
*   🚀 **Performans Optimizasyonu** - Hızlı ve akıcı kullanıcı deneyimi
*   🧪 **Kapsamlı Test Kapsamı** - Birim, entegrasyon ve E2E testleri
*   📱 **Cross-Platform** - Tek kod tabanı, çoklu platform desteği
*   🔄 **CI/CD Hazır** - Otomatik build ve deployment süreçleri

## 📚 Dokümantasyon

Detaylı dokümantasyon için `context/` klasöründeki dosyaları inceleyebilirsiniz:

*   [Proje Genel Bakış](context/02_project_overview.md)
*   [Uygulama Yapısı](context/04_app_structure.md)
*   [Teknoloji Yığını](context/05_tech_stack.md)
*   [Yazılım Mimarisi](context/06_software_architecture.md)
*   [Test Stratejisi](context/07_testing_strategy.md)

## 🤝 Katkıda Bulunma

Bu proje açık kaynaklıdır ve katkılarınıza açıktır. Her türlü geri bildirim, hata düzeltmesi veya yeni özellik önerisi memnuniyetle karşılanır.

### Katkıda Bulunma Adımları:

1. Bu repository'yi fork edin
2. Yeni bir feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Bir Pull Request oluşturun

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakınız.

## 🙏 Teşekkürler

*   React Native ve Expo topluluğuna
*   Açık kaynak kütüphane geliştiricilerine
*   Context Engineering metodolojisine katkıda bulunanlara

---

**ERAY COŞKUN tarafından oluşturulmuştur.**

**🌟 Bu şablonu beğendiyseniz, lütfen yıldız verin ve paylaşın!**

---

### 📞 İletişim

*   **GitHub:** [@Therayz1](https://github.com/Therayz1)
*   **Email:** [contact@example.com](mailto:contact@example.com)
*   **LinkedIn:** [Eray Coşkun](https://linkedin.com/in/eray-coskun)

### 🔗 İlgili Projeler

*   [Context Engineering Metodolojisi](https://github.com/Therayz1/Context-Engineering-Methodology)
*   [React Native Best Practices](https://github.com/Therayz1/React-Native-Best-Practices)
*   [Expo Development Guide](https://github.com/Therayz1/Expo-Development-Guide) 