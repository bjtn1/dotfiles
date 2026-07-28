// Force-applied on every Firefox launch via apply-firefox-config, which
// copies this into the live profile. Firefox reads user.js after prefs.js
// and never writes to it -- only intentional settings belong here, never
// live browsing state (that stays untracked in the actual profile dir).

// Quiet address bar -- no suggestions of any kind, just plain typing
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.quickactions", false);
user_pref("browser.urlbar.suggest.quicksuggest.all", false);
user_pref("browser.urlbar.suggest.recentsearches", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.search.suggest.enabled", false);

// Privacy/tracking, strict
user_pref("browser.contentblocking.category", "strict");
user_pref("dom.security.https_only_mode", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);
user_pref("privacy.trackingprotection.emailtracking.enabled", true);
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.bounceTrackingProtection.mode", 1);
user_pref("privacy.query_stripping.enabled", true);
user_pref("privacy.query_stripping.enabled.pbmode", true);

// Clear form data/cache/cookies on shutdown -- but not history/downloads
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.sanitize.timeSpan", 0);
user_pref("privacy.clearOnShutdown_v2.formdata", true);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
user_pref("privacy.clearSiteData.browsingHistoryAndDownloads", true);
user_pref("privacy.clearSiteData.formdata", true);
user_pref("privacy.clearSiteData.siteSettings", true);

// Firefox's own password/breach features off -- Proton Pass handles this
user_pref("signon.rememberSignons", false);
user_pref("signon.firefoxRelay.feature", "disabled");
user_pref("signon.management.page.breach-alerts.enabled", false);

// Misc UI
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.startup.homepage", "chrome://browser/content/blanktab.html");
user_pref("browser.formfill.enable", false);
user_pref("browser.tabs.groups.smart.userEnabled", false);
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
