part of 'widgets.dart';

@RoutePage()
class WebViewScreen extends StatefulWidget {
  final String url;
  final String appbarTitle;

  const WebViewScreen({
    required this.url,
    required this.appbarTitle,
    super.key,
  });

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeWebViewController();
  }

  void _initializeWebViewController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _isLoading = true),
          onPageFinished: (_) => setState(() {
            _isLoading = false;
            _hasError = false;
          }),
          onWebResourceError: (error) => setState(() {
            _isLoading = false;
            _hasError = true;
          }),
          onNavigationRequest: _handleNavigationRequest,
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  NavigationDecision _handleNavigationRequest(NavigationRequest request) {
    final uri = Uri.parse(request.url);

    if (_isExternalUrl(request.url)) {
      _launchExternalURL(uri);
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }

  bool _isExternalUrl(String url) {
    return url.startsWith('mailto:') ||
        url.startsWith('tel:') ||
        url.startsWith('sms:') ||
        url.startsWith('market:');
  }

  Future<void> _launchExternalURL(Uri url) async {
    final errorMessage = context.l10n.webViewCouldNotOpen;
    try {
      final canLaunch = await canLaunchUrl(url);
      if (canLaunch) {
        await launchUrl(url);
      } else {
        _showErrorSnackBar(errorMessage);
      }
    } catch (_) {
      _showErrorSnackBar(errorMessage);
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      AppSnackBarHelper.show(context, message: message);
    }
  }

  void _reloadPage() {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    _controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(showBackIcon: true, title: widget.appbarTitle),
        body: _buildBody(),
        floatingActionButton: _hasError ? _buildReloadButton() : null,
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (_isLoading) _buildLoadingIndicator(),
        if (_hasError && !_isLoading) _buildErrorWidget(),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      alignment: Alignment.center,
      color: context.colors.background,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      alignment: Alignment.center,
      color: context.colors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: context.colors.error),
          Gap(AppConstant.verticalGap12),
          AppText.headlineMedium(context.l10n.webViewLoadError),
        ],
      ),
    );
  }

  Widget _buildReloadButton() {
    return FloatingActionButton(
      onPressed: _reloadPage,
      child: const Icon(Icons.refresh),
    );
  }
}
