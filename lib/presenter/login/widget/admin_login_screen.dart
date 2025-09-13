part of '../login_screen.dart';

final class AdminLoginScreen extends BaseScreen<AuthBloc, AuthState> {
  const AdminLoginScreen({super.key});

  @override
  void onStateChanged(BuildContext context, AuthState state) {
    if (state is LoginSuccessState) {
      context.go(AppRoute.home.path);
      return;
    }
  }

  @override
  Widget buildScreen(BuildContext context, BaseState state) {
    final AuthBloc authBloc = context.read<AuthBloc>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: authBloc.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: authBloc.emailController,
              decoration: const InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return '이메일을 입력하세요';
                if (!v.contains('@')) return '올바른 이메일 형식이 아닙니다';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: authBloc.passwordController,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (v) {
                if (v == null || v.length < 6) return '6자 이상 입력하세요';
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  authBloc.add(
                    AdminLoginRequestEvent(
                      email: authBloc.emailController.text,
                      password: authBloc.passwordController.text,
                    ),
                  );
                },
                child: const Text('로그인'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
