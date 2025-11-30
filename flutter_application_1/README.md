# 🏥 SOS Saúde - Primeiros Socorros

> **Nota:** Este projeto foi desenvolvido para fins educacionais/acadêmicos.

## 📖 Resumo do App
O **SOS Saúde** é uma aplicação móvel multiplataforma desenvolvida em **Flutter**, projetada para fornecer instruções rápidas, visuais e precisas sobre procedimentos de primeiros socorros.

O objetivo principal é auxiliar usuários leigos a agirem corretamente em situações de emergência enquanto aguardam o socorro especializado. A interface foi desenhada para ser limpa, intuitiva e de rápido acesso, com foco na usabilidade em momentos de tensão.

---

## ✨ Funcionalidades Principais

O aplicativo conta com guias interativos passo a passo para as seguintes emergências:

* **🦴 Engasgo (Manobra de Heimlich):** Instruções para adultos e bebês.
* **😵 Desmaio:** Procedimentos de segurança e recuperação.
* **🔥 Queimaduras:** Classificação e primeiros cuidados imediatos.
* **✂️ Cortes e Hemorragias:** Como estancar sangramentos e fazer curativos.
* **🐍 Picadas de Animais:** Procedimentos para animais peçonhentos e o que **não** fazer.
* **❤️ RCP (Reanimação Cardiopulmonar):** Guia completo de massagem cardíaca.
* **📍 Estabelecimentos Próximos:** Localização rápida de hospitais e UPAs.

### Diferenciais Técnicos:
* **Botão de Emergência (SAMU 192):** Discagem rápida integrada ao sistema nativo.
* **Cards Expansíveis:** Ilustrações detalhadas que podem ser ocultadas/exibidas para facilitar a leitura.
* **Interface Responsiva:** Adaptável para Web (PWA) e Mobile.
* **Efeitos Visuais:** Feedback visual (Hover) e animações suaves na navegação.

---

## 📱 Demonstração Online

Você pode acessar a versão Web do aplicativo diretamente pelo navegador do seu celular ou computador:

👉 **[Acessar App Online (Netlify)](https://sos-saude.netlify.app/) - [https://github.com/franklinferreiraf/app-primeiros-socorros.git]**

*(Recomendado: Adicione à tela inicial do celular para uma experiência de aplicativo nativo)*

---

## 📸 Capturas de Tela (Screenshots)

| Menu Principal | Engasgo | Desmaio | Queimadura |
|:---:|:---:|:---:|:---:|
| <img src="./assets/prints/menu.png" width="180"> | <img src="./assets/prints/engasgo.png" width="180"> | <img src="./assets/prints/desmaio.png" width="180"> | <img src="./assets/prints/queimadura.png" width="180"> |

| Picada de Animal | Corte | RCP | Estabelecimentos |
|:---:|:---:|:---:|:---:|
| <img src="./assets/prints/picadadeanimal.png" width="180"> | <img src="./assets/prints/corte.png" width="180"> | <img src="./assets/prints/rpc.png" width="180"> | <img src="./assets/prints/estabelecimento.png" width="180"> |

---

## 🚀 Como Rodar o Projeto Localmente

Siga os passos abaixo para executar o código na sua máquina.

### Pré-requisitos
* [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado.
* VS Code ou Android Studio.
* Navegador (Chrome/Edge) ou Emulador Android.

### Passo a Passo

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/franklinferreiraf/app-primeiros-socorros.git](https://github.com/franklinferreiraf/app-primeiros-socorros.git)
    ```

2.  **Entre na pasta do projeto:**
    ```bash
    cd app-primeiros-socorros
    ```

3.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

4.  **Execute o aplicativo:**
    * **Para Web (Recomendado para PC):**
        ```bash
        flutter run -d chrome
        ```
    * **Para Celular (Emulador):**
        ```bash
        flutter run
        ```

### Gerar Build para Produção (Web)
Para gerar os arquivos estáticos para hospedagem (como no Netlify):

```bash
flutter build web --release --web-renderer html