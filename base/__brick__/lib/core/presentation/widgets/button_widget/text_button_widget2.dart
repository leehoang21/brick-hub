part of 'text_button_widget.dart';

class TextButtonWidget2 extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final Color? borderColor;
  final String title;
  final double? width;
  final double? height;
  final ButtonState? buttonState;
  final bool? isLoading;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? padding;

  const TextButtonWidget2({
    Key? key,
    required this.onPressed,
    required this.title,
    this.buttonState = ButtonState.active,
    this.buttonColor,
    this.titleColor,
    this.borderColor,
    this.height,
    this.width,
    this.prefixIcon,
    this.isLoading = false,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
          onPressed: isLoading != true ? onPressed : null,
          style: TextButton.styleFrom(
            minimumSize: Size(width ?? 90.w, height ?? 30.w),
            padding: padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            backgroundColor:
                buttonState == ButtonState.active ? buttonColor ?? AppColor.primaryColor : AppColor.grey400,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? buttonColor ?? Colors.transparent, // your color here
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50.r),
              ),
            ),
            elevation: 0,
          ),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: StyleLabel(
                    title: title.toUpperCase(),
                    style: titleColor != null
                        ? ThemeText.button.copyWith(
                            color: titleColor,
                            fontSize: 10.sp,
                            fontWeight: FontType.semiBold,
                            letterSpacing: 1.5,
                          )
                        : ThemeText.button,
                  ),
                ),
                isLoading == true
                    ? const Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: AppColor.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : const SizedBox(),
                Align(alignment: Alignment.centerLeft, child: prefixIcon ?? const SizedBox()).paddingLeft(24)
              ],
            ),
          )),
    );
  }
}
