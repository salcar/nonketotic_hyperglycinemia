NONKETOTICHyperglycinemia::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.assets.precompile += %w[
    app.js app.css
    public.js public.css
    common.js
  ]
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :yui
  config.assets.digest = true
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.assets.initialize_on_precompile = false
  config.active_record.auto_explain_threshold_in_seconds = 0.5
end