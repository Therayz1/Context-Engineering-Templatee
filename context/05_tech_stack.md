## Proje Teknoloji Yığını (Tech Stack)

Bu doküman, React Native (Expo) mobil uygulama projesinin geliştirilmesinde kullanılacak tüm programlama dillerini, kütüphaneleri, araçları ve platformları detaylandırmaktadır. Belirtilen teknolojilere harfiyen uyulmalı ve bu listenin dışına çıkılmamalıdır. Her bir seçimin arkasındaki mantık da açıklanmıştır.

---

### 1. Temel Geliştirme Ortamı

*   **Programlama Dili:** **JavaScript (ES6+) / TypeScript**
    *   **Neden:** React Native ve Expo ekosisteminin temel dili olması. TypeScript, büyük ölçekli projelerde kod kalitesini, okunabilirliğini ve bakımını artıran tip güvenliği sağlar.

*   **Çerçeve (Framework):** **React Native**
    *   **Neden:** Tek bir kod tabanı ile hem iOS hem de Android platformlarında yerel (native) mobil uygulamalar geliştirmeyi sağlar. Geniş topluluk desteği ve zengin bileşen kütüphanesi sunar.

*   **Geliştirme Platformu:** **Expo (Managed Workflow)**
    *   **Neden:** React Native geliştirmeyi basitleştiren, hızlı prototipleme, kolay test ve dağıtım imkanları sunan bir araç ve hizmet setidir. Yerel modülleri yönetme karmaşıklığını azaltır ve OTA (Over-the-Air) güncellemeleri sağlar.

*   **Paket Yöneticisi:** **Yarn** veya **npm**
    *   **Neden:** Proje bağımlılıklarını yönetmek ve komut dosyalarını çalıştırmak için standart araçlar.

### 2. Kullanıcı Arayüzü (UI) ve Gezinme (Navigation)

*   **UI Kütüphanesi (Opsiyonel ama Önerilen):** **React Native Paper** veya **NativeBase**
    *   **Neden:** Materyal Tasarım veya diğer UI yönergelerine uygun, önceden tasarlanmış ve özelleştirilebilir bileşenler sunarak geliştirme sürecini hızlandırır ve tutarlı bir kullanıcı arayüzü sağlar.

*   **Gezinme (Navigation):** **React Navigation (v6+)**
    *   **Neden:** React Native uygulamaları için güçlü, esnek ve özelleştirilebilir bir gezinme çözümü. Stack, Tab, Drawer gibi farklı navigatör tiplerini destekler ve derinlemesine entegrasyon sağlar.

### 3. Durum Yönetimi (State Management)

*   **Global Durum Yönetimi:** **Zustand** veya **React Context API + useReducer**
    *   **Neden:** Uygulamanın global durumunu yönetmek için hafif, esnek ve ölçeklenebilir çözümler sunar. Karmaşık durum yönetimi ihtiyaçları için Redux veya MobX gibi daha kapsamlı kütüphaneler de düşünülebilir, ancak başlangıç için bu seçenekler yeterlidir.

*   **Asenkron Durum Yönetimi:** **React Query** veya **SWR**
    *   **Neden:** Sunucu tarafındaki verilerin (API çağrıları) yönetimi, önbelleğe alınması, senkronizasyonu ve güncellenmesi için güçlü araçlar sunar. Kod karmaşıklığını azaltır ve kullanıcı deneyimini iyileştirir.

### 4. API Entegrasyonu

*   **HTTP İstemcisi:** **Axios** veya **Fetch API**
    *   **Neden:** Backend API'leri ile iletişim kurmak için standart ve güvenilir yöntemler. Axios, daha zengin özellikler (interceptorlar, otomatik JSON dönüşümü) sunar.

*   **Veri Şeması Doğrulama (Opsiyonel):** **Zod** veya **Yup**
    *   **Neden:** API'lerden gelen verilerin veya form girdilerinin şemasını tanımlamak ve doğrulamak için kullanılır. Tip güvenliğini artırır ve çalışma zamanı hatalarını azaltır.

### 5. Veri Depolama

*   **Yerel Depolama:** **AsyncStorage (React Native Community)** veya **Expo SecureStore**
    *   **Neden:** Uygulama içinde küçük miktarda veriyi (kullanıcı tercihleri, oturum tokenları) kalıcı olarak depolamak için. Hassas veriler için SecureStore tercih edilmelidir.

### 6. Test

*   **Birim ve Entegrasyon Testleri:** **Jest** ve **React Native Testing Library**
    *   **Neden:** React Native bileşenlerini ve iş mantığını test etmek için endüstri standardı kütüphaneler. Hızlı geri bildirim sağlar ve kod kalitesini artırır.

*   **Uçtan Uca (E2E) Testleri (Opsiyonel):** **Detox** veya **Appium**
    *   **Neden:** Uygulamanın gerçek bir cihazda veya emülatörde kullanıcı akışlarını test etmek için kullanılır. Büyük ve kritik uygulamalar için önemlidir.

### 7. Diğer Yardımcı Kütüphaneler

*   **Form Yönetimi:** **React Hook Form** veya **Formik**
    *   **Neden:** Form oluşturmayı, doğrulamayı ve durum yönetimini basitleştirir.

*   **Tarih İşlemleri:** **date-fns** veya **Moment.js**
    *   **Neden:** Tarih ve saat manipülasyonlarını kolaylaştırır.

*   **Uygulama İçi Bildirimler:** **Expo Notifications**
    *   **Neden:** Anlık bildirimler (push notifications) ve yerel bildirimler göndermek için Expo'nun entegre çözümü.

### 8. Dağıtım ve CI/CD (Opsiyonel)

*   **Expo Application Services (EAS):**
    *   **Neden:** Expo uygulamalarını derlemek, imzalamak ve mağazalara dağıtmak için entegre bir hizmet. CI/CD süreçlerini basitleştirir.

*   **Fastlane:**
    *   **Neden:** Mobil uygulama dağıtımını otomatikleştirmek için açık kaynaklı bir platform (EAS ile birlikte veya alternatif olarak kullanılabilir).

Bu teknoloji yığını, React Native (Expo) mobil uygulamasının geliştirme yaşam döngüsünün tüm aşamalarını kapsayacak şekilde tasarlanmıştır. Herhangi bir yeni teknoloji veya kütüphane eklenmeden önce bu doküman güncellenmeli ve kullanıcının onayı alınmalıdır.

