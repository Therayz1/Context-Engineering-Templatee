 ## Performans Optimizasyonu Kılavuzu

Bu doküman, React Native (Expo) mobil uygulamasının performansını en üst düzeye çıkarmak için uygulanacak stratejileri ve en iyi pratikleri detaylandırmaktadır. Amaç, uygulamanın hızlı, akıcı, tepkisel olmasını ve kaynakları (CPU, bellek, pil) verimli kullanmasını sağlamaktır. Performans, kullanıcı deneyiminin (UX) kritik bir bileşenidir.

---

### 1. Genel Performans Prensipleri

*   **Ölç ve Optimize Et:** Optimizasyon yapmadan önce performans darboğazlarını doğru bir şekilde tespit etmek için ölçüm araçları kullanılmalıdır. Varsayımlara dayalı optimizasyonlardan kaçınılmalıdır.
*   **Kullanıcı Algısı:** Sadece teknik metrikler değil, aynı zamanda kullanıcının uygulama hızını nasıl algıladığı da önemlidir. Yükleme göstergeleri, iskelet ekranlar (skeleton screens) ve önbelleğe alma gibi teknikler kullanıcı algısını iyileştirebilir.
*   **Aşamalı Optimizasyon:** Performans optimizasyonu, geliştirme sürecinin başından itibaren düşünülmeli, ancak kritik darboğazlar tespit edildiğinde daha derinlemesine optimizasyonlar yapılmalıdır.

### 2. React Native Özel Optimizasyonlar

#### 2.1. Bileşen Optimizasyonu

*   **`React.memo`:** Fonksiyonel bileşenlerin, prop'ları değişmediği sürece yeniden render edilmesini önlemek için kullanılmalıdır. Özellikle sık güncellenen veya pahalı render maliyeti olan bileşenlerde etkilidir.
*   **`useCallback`:** Fonksiyonel bileşenlere prop olarak geçirilen callback fonksiyonlarının gereksiz yere yeniden oluşturulmasını önler. Bu, alt bileşenlerin `React.memo` ile optimize edilmesini sağlar.
*   **`useMemo`:** Pahalı hesaplamaların sonuçlarını önbelleğe almak için kullanılır. Bağımlılıkları değişmediği sürece hesaplama tekrar yapılmaz. Özellikle büyük veri setlerinin işlendiği veya karmaşık bileşenlerin render edildiği durumlarda faydalıdır.
*   **Koşullu Render (Conditional Rendering):** Sadece gerekli olduğunda bileşenleri render etmek için koşullu renderlama kullanılmalıdır. Örneğin, bir modal veya açılır menü sadece görünür olduğunda render edilmelidir.
*   **Anahtar (Key) Prop Kullanımı:** `FlatList`, `ScrollView` veya `map` ile render edilen listelerde her öğe için benzersiz ve kararlı `key` prop'ları kullanılmalıdır. Bu, React'in listeleri verimli bir şekilde güncellemesini sağlar.

#### 2.2. Liste Optimizasyonu

*   **`FlatList` ve `SectionList`:** Büyük veri setlerini listelemek için `ScrollView` yerine bu sanallaştırılmış liste bileşenleri kullanılmalıdır. Bu bileşenler, sadece ekranda görünen öğeleri render ederek bellek ve CPU kullanımını optimize eder.
*   **`getItemLayout`:** `FlatList` ve `SectionList` için `getItemLayout` prop'u sağlanmalıdır. Bu, liste öğelerinin boyutlarını önceden hesaplayarak kaydırma performansını önemli ölçüde artırır.
*   **`removeClippedSubviews`:** Performansı artırmak için `ScrollView` ve `FlatList` gibi bileşenlerde `removeClippedSubviews` prop'u `true` olarak ayarlanabilir. Ancak bu, bazı durumlarda görsel hatalara yol açabilir, dikkatli kullanılmalıdır.

#### 2.3. Animasyonlar

*   **Yerel Sürücü (Native Driver):** Animasyonlar için `useNativeDriver: true` seçeneği kullanılmalıdır. Bu, animasyonların ana JavaScript iş parçacığı yerine yerel UI iş parçacığında çalışmasını sağlayarak daha akıcı animasyonlar sunar.
*   **`Animated` API:** React Native'in `Animated` API'si veya `Reanimated` gibi kütüphaneler, performanslı animasyonlar oluşturmak için tercih edilmelidir.

### 3. Veri Yönetimi ve Ağ İstekleri

*   **Verimli Veri Getirme:** Sadece ihtiyaç duyulan veriler getirilmelidir. API'ler, sayfalama (pagination) ve filtreleme gibi özellikler sunuyorsa bunlar kullanılmalıdır.
*   **Önbelleğe Alma (Caching):** `React Query` veya `SWR` gibi kütüphaneler, API'den gelen verileri önbelleğe alarak gereksiz ağ isteklerini azaltır ve uygulamanın daha hızlı tepki vermesini sağlar.
*   **Veri Sıkıştırma:** Backend API'den gelen veriler sıkıştırılmış formatta (örn: Gzip) olmalıdır.
*   **İstek Birleştirme (Batching):** Mümkünse, birden fazla küçük API isteği tek bir büyük isteğe birleştirilmelidir.

### 4. Medya ve Varlık Optimizasyonu

*   **Resim Optimizasyonu:**
    *   **Doğru Format:** PNG (şeffaflık gerektiren ikonlar için) ve JPEG (fotoğraflar için) gibi uygun resim formatları kullanılmalıdır.
    *   **Sıkıştırma:** Resimler, kaliteden ödün vermeden mümkün olduğunca sıkıştırılmalıdır.
    *   **Doğru Boyutlandırma:** Resimler, görüntülenecekleri boyuta yakın çözünürlükte sağlanmalıdır. Çok büyük resimler kullanılmamalıdır.
    *   **WebP:** Daha iyi sıkıştırma oranları sunan WebP formatı değerlendirilebilir.
*   **Tembel Yükleme (Lazy Loading):** Ekran dışındaki resimler veya bileşenler, sadece ekranda görünür hale geldiklerinde yüklenmelidir.
*   **Video Optimizasyonu:** Videolar sıkıştırılmalı ve mobil cihazlar için uygun formatlarda sunulmalıdır.

### 5. Uygulama Boyutu ve Başlangıç Süresi

*   **Gereksiz Bağımlılıkları Kaldırma:** Kullanılmayan kütüphaneler veya modüller projeden kaldırılmalıdır. `package.json` dosyası düzenli olarak gözden geçirilmelidir.
*   **Ağaç Sallama (Tree Shaking):** Kullanılmayan kodların nihai bundle'a dahil edilmesini önlemek için modüler importlar kullanılmalıdır.
*   **Kod Bölme (Code Splitting - Expo için sınırlı):** Büyük uygulamalarda, uygulamanın farklı bölümlerini ayrı ayrı yüklemek için kod bölme teknikleri araştırılabilir.
*   **Yerel Modüllerin Akıllıca Kullanımı:** Expo Managed Workflow, yerel modül kullanımını basitleştirse de, her eklenen yerel modül bundle boyutunu artırır. Sadece gerçekten gerekli olan modüller kullanılmalıdır.

### 6. Hata Ayıklama ve Profilleme Araçları

*   **React Native Debugger:** Uygulamanın performansını izlemek, bileşen hiyerarşisini incelemek ve ağ isteklerini takip etmek için güçlü bir araçtır.
*   **Flipper:** Facebook tarafından geliştirilen, mobil uygulamalar için kapsamlı bir hata ayıklama platformu. Ağ istekleri, veritabanı, bellek kullanımı gibi birçok alanda profil çıkarma imkanı sunar.
*   **Chrome Geliştirici Araçları:** JavaScript kodunu hata ayıklamak ve profil çıkarmak için kullanılabilir.
*   **Expo Go Uygulaması:** Geliştirme sırasında uygulamanın performansını gerçek cihazda test etmek için kullanılmalıdır.

Bu performans optimizasyonu kılavuzu, uygulamanın geliştirme sürecinin her aşamasında dikkate alınmalı ve düzenli olarak performans testleri yapılarak iyileştirmeler sürdürülmelidir.

