## Tek Bir Görevi Yürütme İçin Prompt Şablonu

Bu şablon, `output/docs/task_list.md` dosyasında tanımlanan görev listesindeki tek bir görevi yürütmek üzere bir yapay zeka ajanına (Manus AI) verilecek komutun temel yapısını tanımlar. Bu şablon, `commands/03_execute_tasks.txt` komutu tarafından kullanılır.

---

**Şablon Açıklaması:**

Bu prompt, ajandan belirli bir görevi yerine getirmesini, bu görevi tamamlamak için gerekli React Native (TypeScript) kodunu yazmasını ve sonuçları ilgili dosyalara (`.tsx`, `.ts`, `.test.ts`) kaydetmesini ister. Ajan, görevi tamamlarken `context` klasöründeki tüm kurallara ve yönergelere uymalıdır.

**Kullanım:**

Bu şablon, `commands/03_execute_tasks.txt` dosyasındaki talimatlar doğrultusunda, her bir görev için ayrı ayrı ajana iletilir. Ajan, bu şablondaki yönergeleri takip ederek görevi gerçekleştirir.

```
# Ajan: Mobilet
# Görev: Mobil Uygulama Projesi Görevini Yürüt

# Referans Bağlam Dosyaları:
# - context/01_persona.md
# - context/02_project_overview.md
# - context/03_rules.md
# - context/04_app_structure.md
# - context/05_tech_stack.md
# - context/06_software_architecture.md
# - context/07_testing_strategy.md
# - context/08_api_integration.md
# - context/09_performance_optimization.md
# - context/10_deployment_guidelines.md

# Hedef Dosya/Klasör:
# - [Görevin içeriğine göre belirlenecek dosya veya klasör yolu, örn: src/components/atoms/Button.tsx]

# Yürütülecek Görev:
# - Görev Adı: [Görev listesinden alınan görevin adı]
# - Görev Açıklaması: [Görev listesinden alınan görevin açıklaması]

# Ek Talimatlar:
# - Görevi tamamlamak için gerekli tüm React Native (TypeScript) kodunu yaz.
# - Kodu, belirtilen hedef dosya/klasöre kaydet. Eğer dosya yoksa oluştur.
# - Kodun her adımı için açıklayıcı yorumlar ekle.
# - Gerekirse, ilgili test dosyalarını (`.test.ts`) `tests/unit` veya `tests/integration` klasörüne kaydet.
# - Ekran görüntüleri veya UI/UX ile ilgili çıktılar için `output/screenshots` klasörünü kullan.
# - Görev tamamlandığında, `output/docs/task_list.md` dosyasındaki ilgili görevi tamamlandı olarak işaretle.
# - Herhangi bir hata veya belirsizlik durumunda, sorunu açıkla ve çözüm önerisi sun.
```

**Beklenen Çıktı:**

*   İlgili React Native bileşenlerinin, ekranlarının, servislerinin veya testlerinin oluşturulması/güncellenmesi.
*   Gerekli test raporlarının `output/test_reports` klasörüne kaydedilmesi.
*   Görsel çıktılarının `output/screenshots` klasörüne kaydedilmesi.

