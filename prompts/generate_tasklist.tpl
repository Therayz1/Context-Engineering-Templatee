
# generate_tasklist.tpl

## Detaylı Görev Listesi Oluşturma İçin Prompt Şablonu

Bu şablon, mobil uygulama projesinin tüm `context` dosyalarını referans alarak, projenin tamamlanması için gereken detaylı ve sıralı bir görev listesi oluşturmak üzere bir yapay zeka ajanına (Manus AI) verilecek komutun temel yapısını tanımlar. Bu şablon, `commands/02_generate_tasks.txt` komutu tarafından kullanılır.

---

**Şablon Açıklaması:**

Bu prompt, ajandan projenin tüm bağlamını analiz etmesini ve `04_app_structure.md` ile `06_software_architecture.md` dosyalarındaki yapıları temel alarak, adım adım yapılacak işleri içeren bir Markdown tabanlı görev listesi oluşturmasını ister. Görevlerin net, ölçülebilir ve eyleme geçirilebilir olması beklenir.

**Kullanım:**

Bu şablon, `commands/02_generate_tasks.txt` dosyasındaki talimatlar doğrultusunda ajana iletilir. Ajan, bu şablondaki yönergeleri takip ederek `output/docs/task_list.md` dosyasını oluşturur.

```
# Ajan: Manus AI
# Görev: Mobil Uygulama Projesi İçin Detaylı Görev Listesi Oluştur

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

# Çıktı Dosyası:
# - output/docs/task_list.md

# Ek Talimatlar:
# - Görev listesini, `06_software_architecture.md` dosyasındaki bileşen mimarisi (Atomic Design) ve `04_app_structure.md` dosyasındaki ekran akışını temel alarak oluştur.
# - Her görevi, onay kutusu formatında (`- [ ] Görev Adı`) yaz.
# - Görevleri, bağımlılıklarına göre mantıksal bir sıraya koy (örn: önce atoms, sonra molecules, sonra organisms, sonra screens, sonra navigation, sonra services, sonra tests).
# - Görev açıklamalarını, ne yapılması gerektiğini net bir şekilde ifade edecek şekilde yaz.
# - Örneğin:
#   - [ ] Atom Bileşenlerini Oluşturma
#     - [ ] `src/components/atoms/Button.tsx` bileşenini oluştur ve temel stilini tanımla.
#     - [ ] `src/components/atoms/Input.tsx` bileşenini oluştur ve temel stilini tanımla.
#   - [ ] Kimlik Doğrulama Ekranlarını Oluşturma
#     - [ ] `src/screens/auth/LoginScreen.tsx` ekranını oluştur ve `AuthLayout` şablonunu kullan.
#     - [ ] `LoginScreen` için gerekli form alanlarını (`Input` atomları) ve butonu (`Button` atomu) entegre et.
#   - [ ] Gezinme Yapısını Kurma
#     - [ ] `src/navigation/AuthNavigator.tsx` dosyasını oluştur ve kimlik doğrulama ekranlarını Stack Navigator olarak tanımla.
```

**Beklenen Çıktı:**

*   `output/docs/task_list.md` dosyasında, projenin tüm aşamalarını kapsayan, detaylı, sıralı ve onay kutuları içeren bir görev listesi.

