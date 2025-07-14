 ## Dağıtım (Deployment) ve Yayınlama Kılavuzu

Bu doküman, React Native (Expo) mobil uygulamasının geliştirme ortamından test ortamlarına ve nihayetinde uygulama mağazalarına (App Store ve Google Play Store) nasıl dağıtılacağını detaylandırmaktadır. Amaç, sorunsuz, güvenli ve otomatikleştirilmiş bir dağıtım süreci sağlamaktır.

---

### 1. Dağıtım Ortamları

Uygulama, aşağıdaki ortamlar arasında dağıtılacaktır:

*   **Geliştirme Ortamı (Development):** Geliştiricilerin kod yazdığı ve anlık testler yaptığı yerel ortamlar. Expo Go uygulaması veya yerel emülatörler/cihazlar kullanılır.
*   **Test Ortamı (Staging/QA):** Yeni özelliklerin ve hata düzeltmelerinin kapsamlı bir şekilde test edildiği, üretim ortamına yakın bir ortam. Dahili test kullanıcıları veya QA ekipleri tarafından kullanılır.
*   **Üretim Ortamı (Production):** Uygulamanın son kullanıcılara sunulduğu canlı ortam. App Store ve Google Play Store üzerinden dağıtılır.

### 2. Expo Application Services (EAS) Kullanımı

Expo Managed Workflow kullanıldığı için, dağıtım süreçlerinin çoğu Expo Application Services (EAS) üzerinden yönetilecektir. EAS, derleme (build), imzalama (signing) ve mağazalara gönderme (submit) gibi karmaşık süreçleri basitleştirir.

#### 2.1. EAS Build

*   **Amaç:** Uygulamanın yerel (native) derlemelerini (APK/AAB for Android, IPA for iOS) oluşturmak.
*   **Adımlar:**
    1.  `eas.json` dosyasını yapılandırma: Farklı ortamlar (development, preview, production) için derleme profilleri tanımlanır.
    2.  `expo login` ile Expo hesabına giriş yapma.
    3.  `eas build --platform android --profile production` veya `eas build --platform ios --profile production` komutlarını kullanarak derlemeleri başlatma.
    4.  Derleme durumu Expo paneli veya CLI üzerinden takip edilebilir.
*   **En İyi Uygulamalar:**
    *   Her derleme öncesi `package.json` ve `app.json` dosyalarındaki versiyon numaraları (`version` ve `buildNumber`/`ios.buildNumber`/`android.versionCode`) güncellenmelidir.
    *   Derlemeler, CI/CD süreçlerine entegre edilmelidir.

#### 2.2. EAS Submit

*   **Amaç:** Oluşturulan yerel derlemeleri (APK/AAB, IPA) uygulama mağazalarına göndermek.
*   **Adımlar:**
    1.  `eas submit --platform android` veya `eas submit --platform ios` komutlarını kullanma.
    2.  İlk gönderimde Google Play Console ve Apple App Store Connect hesap bilgileri (API anahtarları, uygulama kimlikleri) yapılandırılmalıdır.
    3.  Mağaza listeleme bilgileri (uygulama adı, açıklama, ekran görüntüleri, kategori vb.) önceden hazırlanmalıdır.
*   **En İyi Uygulamalar:**
    *   Mağaza listeleme bilgileri, hedef kitleye ve uygulamanın amacına uygun, çekici ve bilgilendirici olmalıdır.
    *   Ekran görüntüleri, uygulamanın en iyi özelliklerini ve kullanıcı arayüzünü sergilemelidir.

#### 2.3. EAS Update (Over-the-Air - OTA Updates)

*   **Amaç:** Uygulamanın JavaScript kodunu ve varlıklarını (assets) uygulama mağazalarına yeni bir derleme göndermeden güncellemek.
*   **Adımlar:**
    1.  `eas update` komutunu kullanarak yeni bir güncelleme yayınlama.
    2.  `app.json` dosyasındaki `runtimeVersion` veya `updates.url` ayarları doğru yapılandırılmalıdır.
*   **En İyi Uygulamalar:**
    *   Kritik hata düzeltmeleri veya küçük özellik eklemeleri için idealdir.
    *   Yerel (native) kod değişiklikleri gerektiren güncellemeler için EAS Build kullanılmalıdır.
    *   Kullanıcılara güncellemenin mevcut olduğunu bildiren bir mekanizma (örn: uygulama içi bildirim) düşünülebilir.

### 3. Uygulama Mağazası Gereksinimleri

#### 3.1. Google Play Store (Android)

*   **Uygulama Paketi:** Android App Bundle (AAB) formatı tercih edilmelidir.
*   **Mağaza Listeleme:** Uygulama adı, kısa ve tam açıklama, ekran görüntüleri, özellik grafiği, kategori, gizlilik politikası URL'si, iletişim bilgileri.
*   **Test Kanalları:** Dahili test, kapalı test, açık test kanalları kullanılarak farklı kullanıcı gruplarıyla testler yapılabilir.
*   **Politikalar:** Google Play Geliştirici Program Politikalarına uyulmalıdır.

#### 3.2. Apple App Store (iOS)

*   **Uygulama Paketi:** IPA formatı.
*   **Mağaza Listeleme:** Uygulama adı, alt başlık, açıklama, anahtar kelimeler, ekran görüntüleri, önizleme videosu (opsiyonel), kategori, gizlilik politikası URL'si, destek URL'si.
*   **TestFlight:** Dahili ve harici test kullanıcıları için Apple'ın TestFlight platformu kullanılır.
*   **Politikalar:** Apple App Store İnceleme Yönergelerine uyulmalıdır.

### 4. Sürekli Entegrasyon ve Sürekli Teslimat (CI/CD) - *Opsiyonel ama Önerilen*

*   **Amaç:** Kod değişikliklerinin otomatik olarak test edilmesini, derlenmesini ve dağıtılmasını sağlamak.
*   **Araçlar:** GitHub Actions, GitLab CI/CD, Bitrise, CircleCI gibi platformlar kullanılabilir.
*   **Akış:**
    1.  Geliştirici kodu Git deposuna (örn: GitHub) gönderir.
    2.  CI/CD hattı tetiklenir.
    3.  Birim ve entegrasyon testleri çalıştırılır.
    4.  Kod kalitesi denetimleri yapılır (ESLint, Prettier).
    5.  Başarılı olursa, EAS Build ile derleme başlatılır.
    6.  Derleme tamamlandığında, test ortamına otomatik dağıtım yapılır veya mağazaya gönderim için hazır hale getirilir.

### 5. İzleme ve Analiz

*   **Kilitlenme Raporlama:** Sentry, Firebase Crashlytics gibi araçlar kullanılarak üretim ortamındaki kilitlenmeler ve hatalar izlenir.
*   **Analitik:** Google Analytics for Firebase, Mixpanel gibi analitik araçlar kullanılarak kullanıcı davranışları, özellik kullanımı ve uygulama performansı izlenir.
*   **Uygulama İçi Geri Bildirim:** Kullanıcıların uygulama içinden kolayca geri bildirim göndermesini sağlayan bir mekanizma (örn: anketler, geri bildirim formları) entegre edilebilir.

Bu dağıtım kılavuzu, mobil uygulamanın geliştirme sürecinin son aşaması olan yayınlama sürecini sistematik bir şekilde yönetmek için bir çerçeve sunmaktadır. Her adımda dikkatli olunmalı ve mağaza politikalarına tam uyum sağlanmalıdır.

