/// Evento disparado para mostrar a página de login.
/// Este evento é utilizado para notificar a UI interna ao modulo de autenticação que a página de login deve ser exibida.
/// Este evento pode e deve ser utilizado por outros módulos que necessitem redirecionar o usuário para a página de login.
/// Isso garante que outros módulos não conheçam as rotas do módulo de autenticação.
///
/// Exemplo de uso:
/// ```dart
///  ModularEvent.fire(const ShowLoginPageEvent());
/// ```
///
final class ShowLoginPageEvent {
  const ShowLoginPageEvent();
}
