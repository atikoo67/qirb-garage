import 'package:qirb_garage/src/imports/core_imports.dart';
import 'package:qirb_garage/src/imports/packages_imports.dart';
import 'package:qirb_garage/src/features/auth/presentation/providers/auth_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey =
        useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscurePassword = useState(true);
    final rememberMe = useState(false);

    final isLoading = ref.watch(authControllerProvider);

    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    Future<void> handleLogin() async {
      if (!(formKey.currentState?.validate() ?? false)) {
        return;
      }

      ref.read(authControllerProvider.notifier).login(
            context: context,
            email: emailController.text,
            password: passwordController.text,
          );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSpacing.xxxl.h),

              // Back Button
              IconButton(
                onPressed: () => context.go(AppRoutes.onboarding),
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

              SizedBox(height: AppSpacing.xl.h),

              // Title
              Text(
                'Welcome Back',
                style: tt.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(height: AppSpacing.sm.h),
              Text(
                'Sign in to continue',
                style: tt.bodyLarge?.copyWith(
                  color: Colors.black54,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: AppSpacing.xxxl.h),

              // Form
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Email Field
                    TextFormField(
                      controller: emailController,
                      enabled: !isLoading,
                      keyboardType: TextInputType.emailAddress,
                      style: tt.bodyLarge?.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            tt.bodyMedium?.copyWith(color: Colors.black54),
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: cs.primary, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.md.w,
                          vertical: AppSpacing.md.h,
                        ),
                      ),
                      validator: (v) {
                        if (AppUtils.isBlank(v)) {
                          return 'Email is required';
                        }
                        if (!AppUtils.isValidEmail(v!)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: AppSpacing.lg.h),

                    // Password Field
                    TextFormField(
                      controller: passwordController,
                      enabled: !isLoading,
                      obscureText: obscurePassword.value,
                      style: tt.bodyLarge?.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            tt.bodyMedium?.copyWith(color: Colors.black54),
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: cs.primary, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.md.w,
                          vertical: AppSpacing.md.h,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black54,
                          ),
                          onPressed: () =>
                              obscurePassword.value = !obscurePassword.value,
                        ),
                      ),
                      validator: (v) {
                        if (AppUtils.isBlank(v)) {
                          return 'Password is required';
                        }
                        if (v!.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: AppSpacing.md.h),

                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Checkbox(
                                value: rememberMe.value,
                                onChanged: (value) =>
                                    rememberMe.value = value ?? false,
                                activeColor: cs.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                            SizedBox(width: AppSpacing.sm.w),
                            Text(
                              'Remember me',
                              style: tt.bodyMedium
                                  ?.copyWith(color: Colors.black87),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () =>
                              context.push(AppRoutes.forgotPassword),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: tt.bodyMedium?.copyWith(
                              color: cs.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSpacing.xxxl.h),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cs.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          disabledBackgroundColor:
                              cs.primary.withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Sign In',
                                style: tt.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSpacing.xxxl.h),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black12, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.md.w),
                    child: Text(
                      'Or continue with',
                      style: tt.bodySmall?.copyWith(color: Colors.black54),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.black12, thickness: 1)),
                ],
              ),

              SizedBox(height: AppSpacing.xl.h),

              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialButton(
                    icon: AppAssets.googleIcon,
                    onPressed: () {},
                  ),
                  SizedBox(width: AppSpacing.md.w),
                  _SocialButton(
                    icon: AppAssets.facebookIcon,
                    onPressed: () {},
                  ),
                  SizedBox(width: AppSpacing.md.w),
                  _SocialButton(
                    icon: AppAssets.appleIcon,
                    onPressed: () {},
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.xxxl.h),

              // Sign Up Link
              Center(
                child: InkWell(
                  onTap: () => context.push(AppRoutes.signup),
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: tt.bodyMedium?.copyWith(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: cs.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSpacing.xl.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.onPressed,
  });

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }
}
