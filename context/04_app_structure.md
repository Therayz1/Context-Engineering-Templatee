 ## Uygulama Yapısı ve Ekran Akışı

Bu doküman, mobil uygulamanın ekranlarını, bu ekranlar arasındaki gezinme (navigation) akışını ve her bir ekranın temel işlevlerini detaylandırmaktadır. Bu, uygulamanın kullanıcı deneyimi (UX) ve genel mimarisi için bir yol haritası görevi görür.

---

### 1. Ekran Hiyerarşisi ve Gezinme (Navigation)

Uygulama, aşağıdaki gezinme yapısını kullanacaktır. Bu yapı, `react-navigation` kütüphanesi ile uygulanacaktır.

*   **Ana Gezinme (Main Navigator):**
    *   **Tip:** Stack Navigator (Yığın Gezgini)
    *   **Açıklama:** Uygulamanın ana gezinme yapısını yönetir. Kimlik doğrulama akışı ile ana uygulama akışını ayırır.

*   **Kimlik Doğrulama Akışı (Auth Flow):**
    *   **Tip:** Stack Navigator
    *   **Ekranlar:**
        *   `WelcomeScreen`: Uygulamanın açılış ekranı. Giriş ve kayıt butonlarını içerir.
        *   `LoginScreen`: Kullanıcıların e-posta ve şifre ile giriş yapabileceği ekran.
        *   `RegisterScreen`: Yeni kullanıcıların kayıt olabileceği ekran.
        *   `ForgotPasswordScreen`: Kullanıcıların şifrelerini sıfırlamak için talepte bulunabileceği ekran.

*   **Ana Uygulama Akışı (App Flow):**
    *   **Tip:** Tab Navigator (Sekme Gezgini)
    *   **Açıklama:** Kullanıcı giriş yaptıktan sonra erişebileceği ana uygulama ekranlarını içerir. Ekranın alt kısmında sekmeler bulunur.
    *   **Sekmeler:**
        1.  **`HomeScreen` (Ana Sayfa):**
            *   **Tip:** Stack Navigator
            *   **Açıklama:** Uygulamanın ana ekranı. Görev listesi gibi temel içerikleri gösterir.
            *   **Alt Ekranlar:**
                *   `TaskListScreen`: Görevlerin listelendiği ana ekran.
                *   `TaskDetailScreen`: Bir görevin detaylarının görüntülendiği ve düzenlendiği ekran.
                *   `AddTaskScreen`: Yeni bir görev ekleme ekranı.
        2.  **`CalendarScreen` (Takvim):**
            *   **Tip:** Stack Navigator
            *   **Açıklama:** Görevlerin takvim üzerinde görüntülendiği ekran.
            *   **Alt Ekranlar:**
                *   `CalendarViewScreen`: Görevlerin aylık/haftalık takvim görünümünde gösterildiği ekran.
        3.  **`ProfileScreen` (Profil):**
            *   **Tip:** Stack Navigator
            *   **Açıklama:** Kullanıcı profili ve ayarlarının yönetildiği ekran.
            *   **Alt Ekranlar:**
                *   `ProfileViewScreen`: Kullanıcı bilgilerinin görüntülendiği ekran.
                *   `EditProfileScreen`: Kullanıcı bilgilerinin düzenlendiği ekran.
                *   `SettingsScreen`: Uygulama ayarlarının (bildirimler, tema vb.) yapıldığı ekran.

### 2. Ekran Açıklamaları ve İşlevleri

Bu bölümde, her bir ekranın amacı, içereceği bileşenler ve temel işlevleri detaylandırılmıştır.

#### Kimlik Doğrulama Ekranları

*   **`WelcomeScreen` (Karşılama Ekranı):**
    *   **Amaç:** Kullanıcıyı karşılamak ve giriş/kayıt seçeneklerini sunmak.
    *   **Bileşenler:** Uygulama logosu, karşılama metni, "Giriş Yap" butonu, "Kayıt Ol" butonu.
    *   **İşlevler:** İlgili butonlara tıklandığında `LoginScreen` veya `RegisterScreen` ekranlarına yönlendirme.

*   **`LoginScreen` (Giriş Ekranı):**
    *   **Amaç:** Mevcut kullanıcıların uygulamaya giriş yapmasını sağlamak.
    *   **Bileşenler:** E-posta giriş alanı, şifre giriş alanı, "Giriş Yap" butonu, "Şifremi Unuttum" linki, "Hesabın yok mu? Kayıt Ol" linki.
    *   **İşlevler:** Kullanıcı bilgilerini doğrulama, başarılı girişte ana uygulama akışına yönlendirme, hatalı girişte hata mesajı gösterme.

*   **`RegisterScreen` (Kayıt Ekranı):**
    *   **Amaç:** Yeni kullanıcıların uygulamaya kayıt olmasını sağlamak.
    *   **Bileşenler:** Ad, soyad, e-posta, şifre, şifre tekrarı giriş alanları, "Kayıt Ol" butonu, "Zaten hesabın var mı? Giriş Yap" linki.
    *   **İşlevler:** Kullanıcı bilgilerini doğrulama, yeni kullanıcı oluşturma, başarılı kayıtta ana uygulama akışına yönlendirme, hatalı kayıtta hata mesajı gösterme.

#### Ana Uygulama Ekranları

*   **`TaskListScreen` (Görev Listesi Ekranı):**
    *   **Amaç:** Kullanıcının görevlerini listelemek ve yönetmek.
    *   **Bileşenler:** Görev listesi (`FlatList`), her bir görev için görev öğesi (görev adı, son tarih, tamamlandı durumu), yeni görev ekleme butonu, filtreleme/sıralama seçenekleri.
    *   **İşlevler:** Görevleri listeleme, bir görevi tamamlandı olarak işaretleme, bir görevi silme, görev detaylarına gitmek için bir göreve tıklama.

*   **`TaskDetailScreen` (Görev Detay Ekranı):**
    *   **Amaç:** Bir görevin tüm detaylarını görüntülemek ve düzenlemek.
    *   **Bileşenler:** Görev adı, açıklama, son tarih, kategori, öncelik seviyesi gibi detaylar, "Düzenle" ve "Sil" butonları.
    *   **İşlevler:** Görev detaylarını görüntüleme, düzenleme moduna geçme, görevi silme.

*   **`AddTaskScreen` (Görev Ekleme Ekranı):**
    *   **Amaç:** Yeni bir görev oluşturmak.
    *   **Bileşenler:** Görev adı, açıklama, son tarih seçici, kategori seçici, öncelik seçici gibi form elemanları, "Kaydet" butonu.
    *   **İşlevler:** Yeni bir görev oluşturma ve kaydetme.

*   **`CalendarViewScreen` (Takvim Görünümü Ekranı):**
    *   **Amaç:** Görevleri bir takvim üzerinde görselleştirmek.
    *   **Bileşenler:** Aylık/haftalık takvim görünümü, görevlerin takvim üzerinde işaretlenmesi.
    *   **İşlevler:** Belirli bir güne tıklandığında o günün görevlerini gösterme.

*   **`ProfileViewScreen` (Profil Görüntüleme Ekranı):**
    *   **Amaç:** Kullanıcının profil bilgilerini göstermek.
    *   **Bileşenler:** Profil resmi, ad, soyad, e-posta, "Profili Düzenle" butonu, "Ayarlar" butonu, "Çıkış Yap" butonu.
    *   **İşlevler:** İlgili ekranlara yönlendirme, kullanıcı oturumunu sonlandırma.

*   **`SettingsScreen` (Ayarlar Ekranı):**
    *   **Amaç:** Uygulama ayarlarını yönetmek.
    *   **Bileşenler:** Bildirim ayarları, tema seçimi (açık/koyu mod), dil seçimi gibi seçenekler.
    *   **İşlevler:** Kullanıcı tercihlerini kaydetme.

Bu ekran yapısı, uygulamanın temel iskeletini oluşturur ve geliştirme sürecinde bir rehber olarak kullanılacaktır. Her bir ekran, `06_software_architecture.md` dosyasında belirtilen mimariye uygun olarak geliştirilecektir.

