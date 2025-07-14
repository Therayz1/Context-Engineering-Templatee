## Genel Davranış Kuralları ve Kısıtlamalar

Bu doküman, Manus AI ajanının React Native (Expo) mobil uygulama geliştirme sürecinde uyması gereken tüm genel kuralları, yasakları, güvenlik protokollerini ve en iyi uygulama prensiplerini detaylandırmaktadır. Bu kurallar, projenin kalitesini, güvenliğini, sürdürülebilirliğini, performansını ve kullanıcı deneyimini garanti altına almak için kritik öneme sahiptir.

---

### 1. Temel Prensipler ve Yaklaşım

*   **Bağlam Odaklılık:** Verilen tüm `context` dosyaları (01_persona.md, 02_project_overview.md vb.) en yüksek önceliğe sahiptir. Her karar ve eylem, bu bağlam dosyalarında belirtilen bilgilerle uyumlu olmalıdır.
*   **Kullanıcı Deneyimi (UX) Odaklılık:** Uygulamanın her özelliği ve arayüzü, kullanıcıların ihtiyaçlarını ve beklentilerini karşılayacak şekilde tasarlanmalı ve geliştirilmelidir. Sezgisel, erişilebilir ve keyifli bir deneyim sunulmalıdır.
*   **Performans Odaklılık:** Uygulama hızlı, akıcı ve tepkisel olmalıdır. Başlangıç süresi, animasyon akıcılığı ve bellek kullanımı sürekli olarak optimize edilmelidir.
*   **Modülerlik ve Yeniden Kullanılabilirlik:** Kod, bağımsız ve yeniden kullanılabilir bileşenlere ayrılmalıdır. Bu, kodun bakımını kolaylaştırır ve gelecekteki geliştirmeleri hızlandırır.
*   **Şeffaflık ve Dokümantasyon:** Yapılan her işlem, alınan her karar, kullanılan her kütüphane ve karşılaşılan her sorun açıkça raporlanmalı ve dokümante edilmelidir. Kod içinde yeterli yorum ve açıklama bulunmalıdır.
*   **Yeniden Üretilebilirlik (Reproducibility):** Geliştirme ortamı ve bağımlılıklar net bir şekilde tanımlanmalı, böylece projenin farklı ortamlarda sorunsuz bir şekilde çalışması sağlanmalıdır.

### 2. Kod Kalitesi ve Sürdürülebilirlik

*   **Clean Code Prensibi:**
    *   **Okunabilirlik:** Kod, anlaşılır ve düzenli olmalıdır. Değişken, fonksiyon ve bileşen isimleri, amaçlarını net bir şekilde yansıtmalıdır.
    *   **Modülerlik:** Uygulama, işlevsel olarak ayrılmış, küçük ve yönetilebilir modüllere (bileşenler, servisler, yardımcı fonksiyonlar) ayrılmalıdır.
    *   **DRY (Don't Repeat Yourself):** Kod tekrarından kaçınılmalıdır. Ortak işlevler yeniden kullanılabilir fonksiyonlar veya bileşenler olarak soyutlanmalıdır.
    *   **Yorumlar:** Karmaşık algoritmalar, kritik iş mantığı veya özel çözümler için açıklayıcı yorumlar eklenmelidir. Ancak, iyi yazılmış kodun kendisi de açıklayıcı olmalıdır.
*   **TypeScript Kullanımı:** Mümkün olduğunca TypeScript kullanılmalıdır. Bu, kodun tip güvenliğini artırır, hataları derleme zamanında yakalar ve kodun okunabilirliğini/bakımını kolaylaştırır.
*   **ESLint ve Prettier:** Kod stilini ve kalitesini otomatikleştirmek için ESLint ve Prettier kullanılmalıdır. Proje genelinde tutarlı bir kod stili sağlanmalıdır.
*   **Versiyon Kontrolü:** Tüm kod ve önemli dokümantasyonlar Git gibi bir versiyon kontrol sistemi ile yönetilmelidir. Anlamlı commit mesajları kullanılmalıdır.
*   **Bağımlılık Yönetimi:** `package.json` dosyası düzenli tutulmalı, gereksiz bağımlılıklar kaldırılmalı ve bağımlılıklar güncel tutulmalıdır.

### 3. Güvenlik Protokolleri

*   **Hassas Veri Saklama:** API anahtarları, kullanıcı kimlik bilgileri veya diğer hassas veriler asla doğrudan kod içine (hardcode) yazılmamalıdır. Ortam değişkenleri (`.env` dosyaları) veya güvenli depolama mekanizmaları (örn: Expo SecureStore) kullanılmalıdır.
*   **API Güvenliği:** Backend API çağrıları HTTPS üzerinden yapılmalı ve uygun kimlik doğrulama/yetkilendirme mekanizmaları (örn: JWT, OAuth2) kullanılmalıdır.
*   **Girdi Doğrulama:** Kullanıcıdan alınan tüm girdiler (formlar, arama kutuları vb.) hem istemci tarafında (frontend) hem de sunucu tarafında (backend - eğer varsa) mutlaka doğrulanmalıdır. XSS (Cross-Site Scripting) ve SQL Injection (eğer backend veritabanı ile doğrudan etkileşim varsa) gibi saldırılara karşı önlemler alınmalıdır.
*   **Depolama Güvenliği:** Cihaz üzerinde depolanan hassas veriler şifrelenmeli veya Expo SecureStore gibi güvenli API'ler kullanılmalıdır.
*   **Bağımlılık Güvenliği:** Kullanılan tüm üçüncü taraf kütüphaneler ve bağımlılıklar düzenli olarak güvenlik açıkları için taranmalı ve güncel tutulmalıdır. Bilinen zafiyetleri olan bağımlılıklar kullanılmamalıdır.
*   **SSL Pinning (Opsiyonel):** Eğer çok yüksek güvenlik gereksinimleri varsa, sunucu sertifikasının doğrulanması için SSL Pinning düşünülebilir.

### 4. Performans Optimizasyonu

*   **Bileşen Optimizasyonu:** `React.memo`, `useCallback`, `useMemo` gibi React optimizasyon teknikleri, gereksiz yeniden render (re-render) işlemlerini önlemek için doğru yerlerde kullanılmalıdır.
*   **Görsel Optimizasyonu:** Resimler ve diğer medya dosyaları optimize edilmeli (sıkıştırma, doğru format seçimi) ve tembel yükleme (lazy loading) stratejileri kullanılmalıdır.
*   **Liste Optimizasyonu:** Büyük listeler için `FlatList` veya `SectionList` gibi sanallaştırılmış bileşenler kullanılmalı ve `keyExtractor` doğru bir şekilde uygulanmalıdır.
*   **Bellek Yönetimi:** Bellek sızıntılarını önlemek için `useEffect` hook'larında temizleme fonksiyonları kullanılmalıdır.
*   **Asenkron İşlemler:** Ağ istekleri ve diğer uzun süreli işlemler asenkron olarak yönetilmeli, kullanıcı arayüzünün donması engellenmelidir. Yükleme göstergeleri (loading indicators) kullanılmalıdır.
*   **Bundle Boyutu:** Uygulama bundle boyutunu minimize etmek için gereksiz kütüphanelerden kaçınılmalı ve ağaç sallama (tree shaking) teknikleri kullanılmalıdır.

### 5. UI/UX ve Erişilebilirlik

*   **Tutarlı Tasarım:** `08_ui_ux_guidelines.md` dosyasında belirtilen tasarım sistemine (renkler, tipografi, bileşenler) harfiyen uyulmalıdır. Uygulama genelinde tutarlı bir görünüm ve his sağlanmalıdır.
*   **Duyarlı Tasarım (Responsive Design):** Uygulama, farklı ekran boyutlarına ve cihazlara (telefonlar, tabletler) uyum sağlayacak şekilde tasarlanmalıdır.
*   **Erişilebilirlik (Accessibility):** Uygulama, engelli kullanıcılar için erişilebilir olmalıdır. Ekran okuyucular, klavye navigasyonu ve yeterli kontrast oranları gibi erişilebilirlik standartlarına uyulmalıdır.
*   **Geri Bildirim:** Kullanıcı eylemlerine (buton tıklamaları, veri yükleme) görsel ve/veya dokunsal geri bildirimler (haptic feedback) sağlanmalıdır.
*   **Hata Yönetimi:** Kullanıcıya anlaşılır ve yardımcı hata mesajları gösterilmelidir. Uygulamanın çökmesi yerine hatanın zarifçe ele alınması sağlanmalıdır.

### 6. Test ve Hata Ayıklama

*   **Birim Testleri:** Her bir bileşen ve iş mantığı için birim testleri yazılmalıdır (örn: Jest, React Testing Library).
*   **Entegrasyon Testleri:** Farklı bileşenlerin birbiriyle nasıl etkileşim kurduğunu test etmek için entegrasyon testleri yazılmalıdır.
*   **Uçtan Uca (E2E) Testleri:** Uygulamanın gerçek bir kullanıcı gibi çalışıp çalışmadığını test etmek için E2E testleri (örn: Detox) düşünülebilir.
*   **Hata Takibi:** Uygulama kilitlenmelerini ve hatalarını izlemek için bir hata izleme hizmeti (örn: Sentry, Firebase Crashlytics) entegre edilmelidir.

### 7. Yasaklar (Kesinlikle Yapılmaması Gerekenler)

*   **Hardcoded Değerler:** API anahtarları, sabit metinler veya yapılandırma değerleri doğrudan kod içine yazılmamalıdır. Ortam değişkenleri veya yapılandırma dosyaları kullanılmalıdır.
*   **Konsol Logları:** Üretim (production) ortamına dağıtılacak kodda `console.log`, `alert` veya `debugger` gibi hata ayıklama ifadeleri bırakılmamalıdır.
*   **Doğrudan DOM Manipülasyonu:** React Native'in soyutlama katmanını atlayarak doğrudan yerel (native) UI bileşenlerini manipüle etmekten kaçınılmalıdır (gerektiğinde `NativeModules` dikkatli kullanılmalıdır).
*   **Senkron İşlemler:** Uzun süreli veya ağ tabanlı işlemleri ana UI iş parçacığında (main thread) senkron olarak çalıştırmaktan kaçınılmalıdır. Bu, uygulamanın donmasına neden olur.
*   **Gereksiz Yeniden Renderlar:** Performansı düşüreceği için gereksiz bileşen yeniden renderlarından kaçınılmalıdır. Optimizasyon teknikleri doğru kullanılmalıdır.
*   **Büyük ve Optimize Edilmemiş Kaynaklar:** Büyük resim dosyaları, videolar veya optimize edilmemiş fontlar kullanılmamalıdır. Tüm medya varlıkları mobil kullanım için optimize edilmelidir.
*   **`any` Tipi Kullanımı (TypeScript):** TypeScript kullanırken `any` tipinden mümkün olduğunca kaçınılmalıdır. Bu, tip güvenliğini zayıflatır.
*   **Teknoloji Kısıtlamalarını İhlal Etme:** `05_tech_stack.md` dosyasında belirtilen teknoloji yığınının dışına çıkılmamalıdır. Yeni bir kütüphane veya araç eklenmeden önce bu doküman güncellenmeli ve kullanıcının onayı alınmalıdır.

Bu kurallar, React Native (Expo) mobil uygulamasının geliştirme sürecinde bir yol haritası sunmakta ve projenin başarılı bir şekilde tamamlanmasını sağlamaktadır. Manus AI, bu kurallara tam uyum sağlamayı taahhüt eder.

