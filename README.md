# Nitea Consent CMP for Google Tag Manager

Tag template for [Nitea Consent](https://nitea.se), the cookie banner and consent management platform (CMP) from Nitea. One tag in Google Tag Manager shows the banner on your site and keeps Google Consent Mode v2 in sync with what the visitor chooses.

The tag:

1. Sets the **default consent state** before any other tag fires: denied for everything except necessary storage, or what you configure per region.
2. Applies the visitor's **saved choice** from an earlier page view at once, so returning visitors are measured from the first event.
3. Loads your site's **banner** and sends every new choice to Consent Mode with `updateConsentState`.

You need a site in Nitea Consent. Nitea sets it up for you and gives you access to the dashboard, where you design the banner, list your cookies and see the consent log.

## Installation

1. In Google Tag Manager, go to **Templates** → **Tag Templates** → **Search Gallery**, search for **Nitea Consent CMP** and click **Add to workspace**.
2. Go to **Tags** → **New** → **Tag Configuration** and choose **Nitea Consent CMP**.
3. Enter your **Site ID**. It's on the site's overview page in the Nitea Consent dashboard. If the site has several domains, for example one per language, use the same Site ID on all of them.
4. Under **Triggering**, choose **Consent Initialization - All Pages**. This trigger fires before every other trigger, which Consent Mode needs.
5. If you're replacing another consent tool, pause or delete its tag in the same version, and remove any banner script hard-coded on the site.
6. Test in **Preview** (see [Verify the setup](#verify-the-setup)) and publish the container.

## Settings

| Field | What it does |
|---|---|
| **Site ID** | Which site's banner to load. Required. |
| **Default consent state** | Consent before the visitor has chosen. Without rows, everything except necessary storage is denied in every region, which is what you want in the EU and UK. Add a row with an empty region to change the global default, or rows for specific regions with [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) codes separated by commas, such as `US-CA` or `SE, NO`. The most specific region wins. |
| **Wait for update** | How long Google tags wait for the banner to report a choice before using the default state. 500 ms is recommended. |
| **Redact ads data when ad_storage is denied** | Sets `ads_data_redaction`, so Google Ads and Floodlight tags drop ad click identifiers when marketing isn't accepted. On by default. |
| **Pass ad click information through URLs** | Sets `url_passthrough`, which keeps click information in link parameters between pages when cookies are denied. Better measurement, but extra parameters in your URLs. Off by default. |

The banner's look, texts, languages and categories are set in the Nitea Consent dashboard, not in the tag. Changes there are published without touching GTM. The banner is available in Swedish, English, Danish, German, Finnish and Polish. It picks the language set for the visitor's domain, otherwise the page's `lang` attribute.

### Example: denied in Europe, granted elsewhere

| Region | Functional | Analytics | Marketing |
|---|---|---|---|
| *(empty)* | Granted | Granted | Granted |
| `AT, BE, BG, CH, CY, CZ, DE, DK, EE, ES, FI, FR, GB, GR, HR, HU, IE, IS, IT, LI, LT, LU, LV, MT, NL, NO, PL, PT, RO, SE, SI, SK` | Denied | Denied | Denied |

Granting consent by default may not be lawful where your visitors are. Check with your legal adviser before you add a granted row.

## Categories and Consent Mode

The visitor chooses per category. Each category controls these Consent Mode types:

| Category in the banner | Consent Mode types |
|---|---|
| Necessary (always on) | `security_storage` |
| Functional | `functionality_storage`, `personalization_storage` |
| Analytics | `analytics_storage` |
| Marketing | `ad_storage`, `ad_user_data`, `ad_personalization` |

## Make your other tags respect the choice

**Google tags** (Google Analytics, Google Ads, Floodlight, Conversion Linker) read Consent Mode by themselves. With the default denied state they send cookieless pings until the visitor accepts.

**Other tags** (for example Meta Pixel, LinkedIn Insight, Hotjar) need a consent check:

1. Open the tag → **Advanced Settings** → **Consent Settings**.
2. Choose **Require additional consent for tag to fire** and add the types the tag needs, for example `ad_storage` for advertising pixels or `analytics_storage` for analytics tools.

The tag fires only when those types are granted. To also fire it on the page where the visitor accepts, add the Custom Event trigger described below.

### Data layer event

Every time the visitor makes or changes a choice, and on each page view with a saved choice, the banner pushes:

```js
dataLayer.push({
  event: 'nc_consent_update',
  nc_consent: { necessary: true, functional: false, analytics: true, marketing: false, id: '…' },
});
```

To use it, create **Data Layer Variables** for `nc_consent.analytics` and `nc_consent.marketing`, and a **Custom Event** trigger for `nc_consent_update` with a condition such as `nc_consent.marketing equals true`. The Consent Settings above are usually simpler.

## Let visitors change their choice

Visitors must be able to change or withdraw consent as easily as they gave it. By default the banner shows a small button in the corner of the page for this (it can be turned off in the dashboard). You can also add a link, for example in the footer:

```html
<a href="#" data-nc-open>Cookie settings</a>
```

Any element with `data-nc-open` opens the settings. From JavaScript: `NiteaConsent.showPreferences()`.

## Verify the setup

1. Click **Preview** in GTM and open your site.
2. In Tag Assistant, choose the first event, **Consent Initialization**, and open the **Consent** tab. **On-page Default** should show your default state and the Nitea Consent CMP tag should have fired.
3. Accept or reject in the banner. A `nc_consent_update` event appears and **On-page Update** shows the new state.
4. Check that tags with consent settings fire only after the visitor accepts.

To see which tags have consent settings, turn on **Enable consent overview** under **Admin** → **Container Settings** and click the shield icon in **Tags**.

## Troubleshooting

| Problem | Check |
|---|---|
| The banner doesn't show | The Site ID, that the site is published in the Nitea Consent dashboard, and the browser console for blocked requests. |
| Your site uses a Content Security Policy | Allow `https://cookieconsent.nitea.ai` in `script-src` and `connect-src`. |
| Tags fire before consent | The Nitea Consent CMP tag must use **Consent Initialization - All Pages**, and non-Google tags need consent settings. |
| Two banners show | Remove the old CMP's tag and any hard-coded banner script. |
| Choices aren't logged | Visits must come from the site's domain or its subdomains. |

## Permissions

The template asks for these permissions in GTM:

| Permission | Why |
|---|---|
| Accesses consent state (write) | Sets the default state and updates it when the visitor chooses. |
| Reads cookie values: `nc_consent` | Applies a saved choice before the banner has loaded. |
| Injects scripts: `https://cookieconsent.nitea.ai/` | Loads your site's banner. |
| Accesses global variables: `NiteaConsent._registerGtm` | Lets the banner report new choices back to the tag. |
| Writes to the data layer: `ads_data_redaction`, `url_passthrough` | The two checkboxes in the settings. |
| Logs to console (debug only) | Explains a failed banner load in Preview. |

## Privacy

The tag itself sends no data. The banner it loads:

- stores the choice in a first-party cookie, `nc_consent`, on your domain (365 days by default). The cookie holds a random consent ID, the choice per category and when it was made.
- sends each choice to Nitea Consent as proof of consent: the consent ID, the choice, the consent version, language, page URL, country (when known), browser user agent and a keyed hash of the IP address. The IP address itself is never stored.

## Support

Email [support@nitea.se](mailto:support@nitea.se) or open an issue in this repository.

## License

[Apache 2.0](LICENSE). Copyright 2026 Nitea AB.
