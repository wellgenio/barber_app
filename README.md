# Barber App – Arquitetura do Projeto

Este projeto adota uma arquitetura modular para garantir organização, escalabilidade e fácil manutenção, promovendo a reutilização de código e a separação clara de responsabilidades.

## Estrutura de Pastas

```
barber_app/
│
├── base_app/                  # Aplicação principal (entrypoint, configuração global, dependências)
│   └── lib/
│       └── src/
│           ├── app_module.dart
│           ├── app_route.dart
│           └── app_widget.dart
│
├── modules/                   # Módulos de funcionalidades independentes
│   ├── auth/                  # Módulo de autenticação
│   │   └── lib/
│   │       └── src/
│   │           ├── data/      # Camada de dados (API, local, repositórios)
│   │           ├── models/    # Modelos de dados (request/response)
│   │           ├── services/  # Serviços e guards (lógica e os serviços que precisam ser expostos para outros módulos)
│   │           └── ui/        # Telas, viewmodels e widgets
|   |               └─ events/ # eventos de navegação e comunicação entre módulos
│   │
│   ├── faq/                   # Módulo de FAQ
│   │   ├── assets/faq/        # Arquivos estáticos (JSON de perguntas)
│   │   └── lib/
│   │       └── src/
│   │           ├── data/      # Camada de dados (local, repositórios)
│   │           ├── models/    # Modelos de dados (enums, response)
│   │           └── ui/        # Telas, viewmodels e widgets
│   │
│   └── shared/                # Módulo compartilhado (utilitários, helpers)
│       └── lib/
│           └── src/
│               └── utils/
│
├── pubspec.yaml               # Configuração principal do projeto (assets, dependências)
└── README.md                  # Este arquivo
```

## Principais Pontos

- **Modularização:** Cada funcionalidade é isolada em um módulo, facilitando o desenvolvimento, testes e manutenção.
- **Reutilização:** O módulo `shared` centraliza utilitários e helpers para uso em todo o projeto.
- **Separação de responsabilidades:** Estrutura clara entre dados, modelos, serviços e interface de usuário.
- **Escalabilidade:** Novos módulos podem ser adicionados facilmente sem impactar os existentes.

---

## Padrões de Comunicação entre Módulos

- **`Service Pattern`:** A camada `/services` centraliza a lógica e os serviços que precisam ser expostos para outros módulos, promovendo integração e acesso aos dados sem acoplamento direto.

  ### Exemplo: Integração entre Módulos

  #### Módulo Auth

  O módulo Auth expõe a interface `IAuthService`, limitando o acesso externo apenas aos métodos necessários, como `logout` e `isLoggedIn`:

  ```dart
  abstract class IAuthService {
    AsyncResult<Unit> logout();
    Future<bool> isLoggedIn();
  }
  ```

  #### HomeViewModel

  O HomeViewModel consome o serviço `IAuthService` fornecido pelo Auth, acessando apenas os métodos permitidos:

  ```dart
  class HomeViewmodel extends ChangeNotifier {
    final IAuthService _authService;

    HomeViewmodel(this._authService);

    Future<void> logout() async {
      await _authService.logout();
      // lógica adicional após logout
    }
  }
  ```

  Dessa forma, a lógica interna do Auth permanece encapsulada, garantindo baixo acoplamento e maior segurança na comunicação entre módulos.

---

- **`EventBus Pattern`:** A pasta `/ui/events/` gerencia eventos de navegação e comunicação entre módulos, garantindo que um módulo não dependa do conhecimento das rotas ou detalhes internos dos demais. Isso facilita a manutenção e a evolução independente de cada módulo.

  #### SplashPage

  Suponha que seja necessário navegar para a tela de login, responsabilidade do módulo de Auth. Para isso, basta emitir um evento `ShowLoginPageEvent`:

  ```dart
  class _SplashPageState extends State<SplashPage> {
    @override
    void initState() {
      super.initState();
      Future.delayed(Duration(milliseconds: 1500), () {
        ModularEvent.fire(ShowLoginPageEvent());
      });
    }
    // restante do código
  }
  ```

  #### Módulo Auth

  O módulo Auth estará ouvindo esse evento e pronto para realizar a navegação quando necessário:

  ```dart
  class AuthModule extends EventModule {
    @override
    void listen() {
      on<ShowLoginPageEvent>((event, context) {
        context.push(AuthRoute().loginPage.path);
      }, autoDispose: false);
    }
  }
  ```

  Outro exemplo: suponha que seja necessário verificar se determinado usuário tem permissão para executar uma operação.

  #### HomePage

  ```dart
  ElevatedButton(
    onPressed: () {
      ModularEvent.fire(
        CheckAccessEvent(
          userId: '42',
          resource: 'schedule',
          onCheckAccess: (hasAccess) async {
            if (hasAccess) {
              // Executar a operação protegida
            }
          },
        ),
      );
    },
    child: const Text('Operação protegida'),
  )
  ```

  #### Módulo Auth

  O módulo Auth estará ouvindo e pronto para executar esse processo internamente, inclusive gerando resultados visuais (como um bottom sheet) para o usuário e fornecendo feedback via `onCheckAccess` para o processo anterior.

  ```dart
  class AuthModule extends EventModule {
    @override
    void listen() {
      on<CheckAccessEvent>((event, context) async {
        final authRepository = context.read<AuthRepository>();
        final hasAccess = await authRepository.checkAccess(userId: event.userId);

        if (!hasAccess) {
          ForbiddenBottomSheet().show(context);
          event.onCheckAccess(false);
          return;
        }
        event.onCheckAccess(true);
      }, autoDispose: false);
    }
  }
  ```

  Esse padrão permite realizar navegação de telas e processamento de informações de forma totalmente desacoplada. Os módulos só precisam conhecer os `events` relevantes e, caso precisem de acesso mais direto a dados, podem utilizar os `services` apropriados.

---

**Conclusão:**  
A adoção desses padrões de comunicação — via serviços e eventos — garante baixo acoplamento, maior segurança e flexibilidade na evolução do projeto. Cada módulo pode evoluir de forma independente, facilitando a manutenção, testes e escalabilidade da aplicação.

Sinta-se à vontade para adaptar a estrutura conforme as necessidades do projeto.
