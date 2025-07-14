 ## Yazılım Mimarisi ve Bileşen Yapısı

Bu doküman, React Native (Expo) mobil uygulamasının yazılım mimarisini, bileşen yapısını ve kod organizasyonunu detaylandırmaktadır. Amaç, uygulamanın ölçeklenebilir, bakımı kolay, test edilebilir ve performanslı olmasını sağlamaktır. Bu mimari, `03_rules.md` dosyasındaki temiz kod prensiplerini ve `05_tech_stack.md` dosyasındaki teknoloji seçimlerini destekler.

---

### 1. Genel Mimari Yaklaşım: Katmanlı Mimari ve Modülerlik

Uygulama, sorumlulukların net bir şekilde ayrıldığı katmanlı bir mimari prensibiyle geliştirilecektir. Her katman, belirli bir sorumluluğa sahip olacak ve diğer katmanlarla tanımlanmış arayüzler üzerinden iletişim kuracaktır. Bu yaklaşım, kodun anlaşılabilirliğini, test edilebilirliğini ve bakımını kolaylaştırır.

*   **Sunum Katmanı (Presentation Layer):** Kullanıcı arayüzü (UI) bileşenlerini ve ekranları içerir. Kullanıcı etkileşimlerini alır ve iş mantığına iletir.
*   **İş Mantığı Katmanı (Business Logic Layer):** Uygulamanın temel iş kurallarını ve veri işleme mantığını içerir. Sunum katmanından gelen istekleri işler ve veri katmanıyla iletişim kurar.
*   **Veri Katmanı (Data Layer):** Veri kaynaklarına (API, yerel depolama) erişimi ve veri manipülasyonunu yönetir. İş mantığı katmanına temiz ve tutarlı veri sağlar.

### 2. Klasör Yapısı (Project Structure)

Proje klasör yapısı, modülerliği ve sorumluluk ayrımını destekleyecek şekilde düzenlenecektir. Her bir ana klasör, uygulamanın belirli bir bölümünü veya işlevselliğini temsil edecektir.

```
my-mobile-app/
├── App.tsx                 # Ana uygulama bileşeni
├── app.json                # Expo yapılandırma dosyası
├── babel.config.js         # Babel yapılandırması
├── tsconfig.json           # TypeScript yapılandırması
├── package.json            # Proje bağımlılıkları ve scriptler
├── .env                    # Ortam değişkenleri
├── .gitignore              # Git tarafından izlenmeyecek dosyalar
│
├── src/
│   ├── assets/             # Statik varlıklar (resimler, fontlar, ikonlar)
│   │   ├── images/
│   │   ├── fonts/
│   │   └── icons/
│   │
│   ├── components/         # Yeniden kullanılabilir UI bileşenleri
│   │   ├── atoms/          # En küçük, bağımsız bileşenler (Button, Text, Input)
│   │   ├── molecules/      # Atomların birleşimi (Card, ListItem, FormField)
│   │   ├── organisms/      # Moleküllerin birleşimi, daha karmaşık (Header, Footer, TaskList)
│   │   └── templates/      # Ekran düzenleri, veri içermeyen (AuthLayout, MainLayout)
│   │
│   ├── navigation/         # Uygulama gezinme (React Navigation) yapılandırması
│   │   ├── AuthNavigator.tsx
│   │   ├── AppNavigator.tsx
│   │   └── index.tsx       # Ana navigatör
│   │
│   ├── screens/            # Uygulama ekranları (sayfalar)
│   │   ├── auth/           # Kimlik doğrulama ekranları
│   │   │   ├── LoginScreen.tsx
│   │   │   └── RegisterScreen.tsx
│   │   ├── main/           # Ana uygulama ekranları
│   │   │   ├── HomeScreen.tsx
│   │   │   └── ProfileScreen.tsx
│   │   └── index.tsx       # Ekranları dışa aktaran dosya
│   │
│   ├── services/           # API çağrıları ve harici servis entegrasyonları
│   │   ├── api.ts          # Axios instance ve temel API çağrıları
│   │   ├── authService.ts  # Kimlik doğrulama ile ilgili servisler
│   │   └── userService.ts  # Kullanıcı ile ilgili servisler
│   │
│   ├── store/              # Durum yönetimi (Zustand, Context API)
│   │   ├── authStore.ts    # Kimlik doğrulama durumu
│   │   ├── taskStore.ts    # Görev durumu
│   │   └── index.ts        # Tüm store'ları birleştiren dosya
│   │
│   ├── utils/              # Yardımcı fonksiyonlar ve sabitler
│   │   ├── constants.ts
│   │   ├── helpers.ts
│   │   └── validation.ts
│   │
│   ├── hooks/              # Özel React Hook'ları
│   │   ├── useAuth.ts
│   │   └── useTasks.ts
│   │
│   ├── types/              # TypeScript tip tanımlamaları
│   │   ├── index.d.ts
│   │   └── auth.d.ts
│   │
│   └── AppProvider.tsx     # Global sağlayıcılar (örn: tema, durum yönetimi)
│
└── tests/                  # Test dosyaları
    ├── unit/
    ├── integration/
    └── e2e/
```

### 3. Bileşen Mimarisi: Atomic Design Prensipleri

`components` klasörü içinde Atomic Design prensipleri uygulanacaktır. Bu yaklaşım, UI bileşenlerini daha küçük, yeniden kullanılabilir ve yönetilebilir parçalara ayırır:

*   **Atoms (Atomlar):** Uygulamanın en temel yapı taşlarıdır. Bağımsızdırlar ve kendi başlarına bir anlam ifade etmezler. Örnekler: `Button`, `Text`, `Input`, `Icon`, `Image`.
*   **Molecules (Moleküller):** Bir veya daha fazla atomun birleşerek daha karmaşık, işlevsel bir birim oluşturduğu yapılardır. Örnekler: `FormField` (Input + Label), `ListItem` (Text + Icon), `Card` (Image + Title + Description).
*   **Organisms (Organizmalar):** Moleküllerin ve/veya atomların birleşerek belirli bir bölümü veya işlevselliği temsil ettiği daha karmaşık bileşenlerdir. Genellikle bir sayfanın veya bölümün ana yapılarını oluştururlar. Örnekler: `Header`, `Footer`, `TaskList` (birçok ListItem içerir), `LoginForm`.
*   **Templates (Şablonlar):** Organizmaların bir araya gelerek bir sayfanın iskeletini oluşturduğu, ancak henüz gerçek veri içermeyen yapılardır. Sayfa düzenini ve bileşenlerin yerleşimini tanımlarlar. Örnekler: `AuthLayout`, `MainLayout`.
*   **Pages (Sayfalar/Ekranlar):** Şablonların gerçek verilerle doldurulduğu ve uygulamanın son kullanıcıya sunulan ekranlarıdır. `screens` klasöründe yer alırlar ve genellikle durum yönetimi ve API çağrıları gibi iş mantığını içerirler.

### 4. Durum Yönetimi Akışı

Uygulamanın durumu, `store` klasöründe merkezi olarak yönetilecektir. `Zustand` veya `React Context API` ile `useReducer` kombinasyonu kullanılacaktır.

*   **Global Durum:** Uygulama genelinde erişilmesi gereken veriler (örn: kullanıcı oturum bilgileri, tema ayarları) global store içinde tutulacaktır.
*   **Yerel Durum:** Bileşenlere özgü, sadece o bileşenin veya alt bileşenlerinin ihtiyaç duyduğu durumlar bileşenin kendi içinde (`useState`, `useReducer`) yönetilecektir.
*   **Veri Getirme (Data Fetching):** Sunucu tarafındaki veriler için `React Query` veya `SWR` gibi kütüphaneler kullanılacak, bu sayede veri getirme, önbelleğe alma, senkronizasyon ve hata yönetimi otomatikleştirilecektir.

### 5. API Entegrasyonu

`services` klasörü, tüm API çağrılarını ve harici servis entegrasyonlarını içerecektir. `Axios` gibi bir HTTP istemcisi kullanılacak ve API istekleri için merkezi bir yapı oluşturulacaktır. Her bir servis (örn: `authService.ts`, `userService.ts`) belirli bir kaynakla ilgili API çağrılarını içerecektir.

### 6. Hata Yönetimi

Uygulama genelinde tutarlı bir hata yönetimi stratejisi benimsenecektir:

*   **API Hataları:** `services` katmanında yakalanacak ve kullanıcıya anlaşılır mesajlar şeklinde iletilecektir.
*   **UI Hataları:** `ErrorBoundary` bileşenleri kullanılarak kritik UI hatalarının uygulamanın çökmesini engellemesi sağlanacaktır.
*   **Global Hata Yakalama:** Uygulama genelinde yakalanmayan hatalar için merkezi bir hata yakalama mekanizması (örn: Sentry gibi bir hata izleme servisi) entegre edilecektir.

Bu yazılım mimarisi, projenin karmaşıklığını yönetmek, geliştirme hızını artırmak ve yüksek kaliteli bir mobil uygulama sunmak için sağlam bir temel sağlar.

