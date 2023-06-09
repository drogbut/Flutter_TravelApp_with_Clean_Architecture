/// To maintain all the global utils like UI-related enums and standard
/// dimensions of several constants according to webshop 2.0

enum SdToggleButtonSelection { left, right }

enum ArticleTileType { vertical, horizontal, text }

enum StoreFinderType { showStoreFinderAsCard, showStoreFinderAsDialog }

enum DesktopShoppingCartType { inline, sidebar }

/// Material design padding

/// Represents a padding value of 0.0
const double sdPaddingZero = 0.0;
const double sdPaddingXXSmall = 2.0;
const double sdPaddingXSmall = 4.0;
const double sdPaddingSmall = 8.0;
const double sdPaddingMedium = 16.0;
const double sdPaddingLarge = 24.0;
const double sdPaddingXLarge = 32.0;
const double sdPaddingXXLarge = 64.0;
const double sdPaddingXXXLarge = 128.0;

@Deprecated('Please use sdPaddingLarge instead')
const double sdHorizontalPadding = 22.0;

@Deprecated('Please use sdPaddingMedium instead')
const double sdCardItemButtonPadding = 15;

/// standard margin
@Deprecated('please set sdMargin with sdPaddingSmall')
const double sdMargin = 10.0;

/// standard unit height for sdSizedBox
@Deprecated('please use sdPaddingSmall instead')
const double sdHeight = 10.0;

const double sdModalHeight = 300;

/// The width of sidebar modals (used for larger screens)
const double sdSidebarWidth = 480.0;

const double sdPickerHeight = 200;

/// standard unit WIDTH for sdSizedBox
/// @Deprecated('please use sdPaddingSmall instead')
const double sdWidth = 10.0;

/// padding in view (to components)
@Deprecated('please use sdPaddingMedium or sdPaddingLarge instead')
const double sdViewPadding = 20.0;

/// padding in components (to content), example: checkout_screen components
@Deprecated('please use sdPaddingMedium instead')
const double sdInnerComponentsPadding = 18.0;

/// The radius of webshop app button
const double sdButtonBorderRadius = 7.0;

/// The height of webshop app button
const double sdButtonHeight = 50.0;

/// The height of webshop app button
const double sdButtonHeightLarge = 50.0;

const double sdButtonHeightSmall = 40.0;

const double sdIconSizeSmall = 18.0;
const double sdIconSizeMedium = 22.0;
const double sdIconSizeLarge = 36.0;
const double sdIconSizeXLarge = 54.0;

@Deprecated('should use border radius values from ThemeConfig instead')
const double sdRadius = 7.0;
const double sdRadiusMedium = 16.0;

@Deprecated('should use border radius values from ThemeConfig instead')
const double sdComponentdRadius = 10.0;

/// Progress indicator content radius
const double progressIndicatorContentRadius = 80;

/// Dialog
// const double dialogWidthSmall = XX;
const double dialogWidthMedium = 448;
const double dialogWidthLarge = 764.0;

const double dialogHeightSmall = 300.0;
const double dialogHeightMedium = 400.0;
const double dialogHeightLarge = 530.0;
const double dialogHeightXLarge = 674.0;

/// Factor
const double factor20 = 0.2;
const double factor35 = 0.35;
const double factor50 = 0.5;
const double factor65 = 0.65;
const double factor80 = 0.8;
const double factor100 = 1.0;
