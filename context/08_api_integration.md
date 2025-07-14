 ## API Entegrasyonu ve Veri Akışı

Bu doküman, mobil uygulamanın backend API ile nasıl iletişim kuracağını, veri alışverişi prensiplerini, kimlik doğrulama mekanizmalarını ve hata yönetimini detaylandırmaktadır. Amaç, güvenli, verimli ve tutarlı bir API entegrasyonu sağlamaktır.

---

### 1. API Türü ve İletişim Protokolü

*   **API Türü:** RESTful API (Representational State Transfer)
    *   **Neden:** Geniş kabul görmüş, esnek ve durum bilgisi olmayan (stateless) bir mimari stilidir. HTTP metotlarını (GET, POST, PUT, DELETE) kaynaklar üzerinde işlem yapmak için kullanır.
*   **İletişim Protokolü:** HTTPS (Hypertext Transfer Protocol Secure)
    *   **Neden:** Tüm API çağrıları şifreli bir kanal üzerinden yapılacaktır. Bu, veri bütünlüğünü ve gizliliğini sağlar, man-in-the-middle saldırılarını önler.

### 2. API Temel URL ve Ortam Yönetimi

*   **Temel URL:** API endpointlerinin başlangıç adresi (örn: `https://api.myawesomeapp.com/v1`).
*   **Ortam Değişkenleri:** Geliştirme, test ve üretim ortamları için farklı API temel URL'leri kullanılacaktır. Bu URL'ler, Expo ortam değişkenleri (`.env` dosyaları veya `app.config.js` içindeki `extra` alanı) aracılığıyla yönetilecektir. Hassas bilgiler (API anahtarları) asla doğrudan kod içine yazılmayacaktır.

### 3. HTTP İstemcisi ve Yapılandırma

*   **Kütüphane:** **Axios**
    *   **Neden:** Promise tabanlı HTTP istemcisi olması, istek ve yanıt interceptorları (araya giriciler), otomatik JSON dönüşümü ve hata yönetimi gibi gelişmiş özellikler sunması nedeniyle tercih edilmiştir.
*   **Yapılandırma:**
    *   **Temel URL:** Axios instance'ı oluşturulurken temel API URL'si ayarlanacaktır.
    *   **Zaman Aşımı (Timeout):** API çağrıları için makul bir zaman aşımı süresi belirlenecektir (örn: 10-30 saniye).
    *   **Başlıklar (Headers):** Tüm isteklerde gerekli başlıklar (örn: `Content-Type: application/json`, `Authorization` tokenı) otomatik olarak eklenecektir.

### 4. Kimlik Doğrulama (Authentication) ve Yetkilendirme (Authorization)

*   **Mekanizma:** JWT (JSON Web Tokens)
    *   **Neden:** Hafif, güvenli ve ölçeklenebilir bir kimlik doğrulama mekanizmasıdır. Sunucu tarafında oturum bilgisi tutulmasını gerektirmez.
*   **Akış:**
    1.  **Giriş (Login):** Kullanıcı, kullanıcı adı/e-posta ve şifresi ile `/auth/login` endpoint'ine POST isteği gönderir.
    2.  **Token Alma:** Başarılı girişte, API bir `access_token` (erişim tokenı) ve isteğe bağlı olarak bir `refresh_token` (yenileme tokenı) döndürür.
    3.  **Token Saklama:** `access_token` ve `refresh_token`, Expo SecureStore gibi güvenli yerel depolama alanında saklanacaktır. Asla `AsyncStorage` gibi güvenli olmayan yerlerde saklanmayacaktır.
    4.  **Yetkili İstekler:** Sonraki tüm yetkilendirme gerektiren API istekleri, `Authorization` başlığında `Bearer <access_token>` formatında `access_token`'ı içerecektir.
    5.  **Token Yenileme:** `access_token`'ın süresi dolduğunda, `refresh_token` kullanılarak yeni bir `access_token` almak için `/auth/refresh-token` gibi bir endpoint'e istek gönderilecektir. Bu işlem, bir Axios interceptor'ı aracılığıyla otomatik olarak yönetilecektir.
    6.  **Çıkış (Logout):** Kullanıcı çıkış yaptığında, yerel depolamadaki tüm tokenlar silinecek ve oturum sonlandırılacaktır.

### 5. Veri Akışı ve Yönetimi

*   **Veri Getirme (Data Fetching):** `React Query` veya `SWR` gibi kütüphaneler, sunucu tarafındaki verilerin yönetimi için kullanılacaktır. Bu kütüphaneler, veri getirme, önbelleğe alma, arka planda yeniden doğrulama, hata yönetimi ve yükleme durumlarını otomatik olarak yönetir.
*   **Veri Şeması Doğrulama:** API'den gelen verilerin beklenen şemaya uygun olduğunu doğrulamak için `Zod` veya `Yup` gibi kütüphaneler kullanılacaktır. Bu, çalışma zamanı hatalarını önler ve tip güvenliğini artırır.
*   **Veri Dönüşümü:** API'den gelen veriler, uygulamanın UI bileşenlerinin veya iş mantığının ihtiyaç duyduğu formata dönüştürülebilir (örn: tarih formatları, sayısal dönüşümler).

### 6. Hata Yönetimi

API çağrılarında oluşabilecek hatalar (ağ sorunları, sunucu hataları, yetkilendirme hataları) tutarlı bir şekilde ele alınacaktır:

*   **HTTP Durum Kodları:** API'den dönen HTTP durum kodları (örn: 401 Unauthorized, 404 Not Found, 500 Internal Server Error) kontrol edilecek ve buna göre uygun hata mesajları veya eylemler tetiklenecektir.
*   **Interceptorlar:** Axios interceptor'ları, global hata yönetimi için kullanılacaktır. Örneğin, 401 hatası alındığında kullanıcıyı otomatik olarak giriş ekranına yönlendirme veya token yenileme mekanizmasını tetikleme.
*   **Kullanıcı Geri Bildirimi:** Hata durumlarında kullanıcıya anlaşılır ve bilgilendirici hata mesajları gösterilecektir (örn: Toast bildirimleri, hata ekranları).
*   **Hata Kaydı:** Üretim ortamında oluşan kritik hatalar, Sentry veya Firebase Crashlytics gibi hata izleme servislerine kaydedilecektir.

### 7. Güvenlik Hususları

*   **Veri Şifreleme:** Hassas veriler (örn: şifreler) API üzerinden gönderilmeden önce şifrelenmeli veya hash'lenmelidir (backend tarafında).
*   **Parametre Doğrulama:** API'ye gönderilen tüm parametreler, backend tarafında da doğrulanmalıdır.
*   **Rate Limiting:** API'ye yapılan istekler için hız sınırlamaları (rate limiting) uygulanmalıdır (backend tarafında).
*   **SSL Pinning (Opsiyonel):** Eğer çok yüksek güvenlik gereksinimleri varsa, sunucu sertifikasının doğrulanması için SSL Pinning düşünülebilir.

Bu API entegrasyon stratejisi, mobil uygulamanın backend ile güvenli, verimli ve hatasız bir şekilde iletişim kurmasını sağlayacaktır.

