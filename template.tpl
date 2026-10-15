___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Nitea Consent CMP",
  "categories": [
    "UTILITY",
    "TAG_MANAGEMENT"
  ],
  "brand": {
    "id": "nitea",
    "displayName": "Nitea",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAIAAABt+uBvAAAAAXNSR0IArs4c6QAAAHhlWElmTU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUAAAABAAAARgEoAAMAAAABAAIAAIdpAAQAAAABAAAATgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAAGCgAwAEAAAAAQAAAGAAAAAAmrxreQAAAAlwSFlzAAALEwAACxMBAJqcGAAABEBJREFUeAHtm8lK5FAYhR1KHFFEBCcEG1FwoWtBnHaCCL6CPojgzjcQN76CG7cKDmtB1IVIi+IADojiPHWfVihSU+5fJzEV6JNVcv/p/F9uUsmtqqIibSIgAiIgAiIgAiIgAiIgAiIgAiIgAiIgAiIgAiIgAiIgArEgUBy9ioqKitbW1l9fW0dHR3Nzc2NjY01NTSKRKCkpgZ7Pz8/39/f7+/vLy8vz8/PDw8PfX9vp6enz83PEgiMCVFZW1tPTMzg4ODAw0Nvb297eXlVVlVerj4+Px8fH29vbGxsba2tre3t7b29veWWIqXNfX9/s7OzW1tbr6+ufkDakQkKkRfKYtu2UhYtlfHx8eXkZF0VIWLKkQXKUQKHva9OpKi4Oo6OjKysrWRr6sSGUQ9G49O+jA7fb+fl53GJ/DEXOxCiK0hDgI6/Apv7+/p2dnZwdRGKAAMgoMIis5ScnJ29ubiKB4CgCGRCTVWTBBiEIH8MO4RGaISZGjIaGhm5vbyNs31QKkiAs+JQJ+qDY2dm5urra1tYWUMrDw8P19fXd3R3y1NbWNjQ0VFdXB8x5cnIyMjJycHAQMA8fXllZub6+bjqhOZzwQDw3Nzc2NoYXD3DBAzc27OAQgzDBIUeoaRjyIJLvMGDkzMyMSWY2p6Ojo6mpKec0gQPc4Jwth2kMIgO2SYZ3d3fjijBpzHDa3NzEa6q9MJwRkpHGNACRkGqvFZrnwsKCSWCG0+7ublNTU746EILAjGSmAUjNt1xQ/5aWFtxTTepSnfCeOTw8zJVHIPfGC6kQzBUlo6anp1Mbtx4tLS2RJb/CEG6tlOoHwVzdfwtUxDYxMUFEIWRxcZEL/I6iw2nBjNr6+vqzs7PUM2Q6uri4CPgyiXAkMRVLdYJgyCa6ZWZQV1cXcZeFuP39fayiEiqTIQhHkuShfQeCIdvun/RkAOFTs7iYeQTH6nKyML3DJYFg7sOeAYQVZa69q6srLtAbRSfhZDOA6urqvIrt+/i6wu6cy5NOgjeYXDl9xhlApaWlPhlja+JkM4BoBKEsrYeSxN5CpIC4W3taM6EkScvpcxgpIB8dsTUxgOhzGMrVQSfhZDOAuLsd5ggnMW1y0Uk4sgwgrlJan9EfcrIZQHRvnMS0cvT8TctjPGQA0Y9qWM0xyvJxe3l58bH6mDjZDCB8yeujw8f09PTkYzWa6CQfHx/GEl43BhB3KlCVvr96FdNJsP7hzWPcZwAZU8fNTYB+5Iz8RzOI4ydADm4CJEAOAg6zZpAAOQg4zJpBAuQg4DBrBgmQg4DDrBkkQA4CDrNmkAA5CDjMzAyil5bpQG8TdBIuMOGtbdzHnyHw78h815+wEohAYwkft4irMz/zwU+zy8vLCUD4/xs2n+YtJvzlFVuhqlsUykcEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAECkDgL0Fr2evhpkPoAAAAAElFTkSuQmCC"
  },
  "description": "Cookie banner and Google Consent Mode v2 for sites using Nitea Consent. Sets the default consent state per region, applies the visitor's saved choice before other tags fire and loads the banner. Fire it on \"Consent Initialization - All Pages\". Documentation and support: https://github.com/niteaorg/nitea-consent-gtm-template#readme",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "Site ID",
    "simpleValueType": true,
    "help": "Your site's ID, shown on the site's overview page in the Nitea Consent dashboard. For example <em>a1B2c3D4e5F6</em>.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^[A-Za-z0-9]{6,32}$"
        ]
      }
    ]
  },
  {
    "type": "PARAM_TABLE",
    "name": "defaultSettings",
    "displayName": "Default consent state",
    "help": "Consent before the visitor has made a choice. Without any rows, everything except necessary storage is denied everywhere, which is what you want in the EU. Add a row with an empty region to change the global default, or rows for specific regions with ISO 3166-2 codes separated by commas, for example <em>SE, NO</em> or <em>US-CA</em>. The most specific region wins. Necessary storage (security_storage) is always granted.",
    "paramTableColumns": [
      {
        "param": {
          "type": "TEXT",
          "name": "region",
          "displayName": "Region (empty = all)",
          "simpleValueType": true
        },
        "isUnique": true
      },
      {
        "param": {
          "type": "SELECT",
          "name": "functional",
          "displayName": "Functional",
          "macrosInSelect": false,
          "selectItems": [
            {
              "value": "denied",
              "displayValue": "Denied"
            },
            {
              "value": "granted",
              "displayValue": "Granted"
            }
          ],
          "simpleValueType": true
        },
        "isUnique": false
      },
      {
        "param": {
          "type": "SELECT",
          "name": "analytics",
          "displayName": "Analytics",
          "macrosInSelect": false,
          "selectItems": [
            {
              "value": "denied",
              "displayValue": "Denied"
            },
            {
              "value": "granted",
              "displayValue": "Granted"
            }
          ],
          "simpleValueType": true
        },
        "isUnique": false
      },
      {
        "param": {
          "type": "SELECT",
          "name": "marketing",
          "displayName": "Marketing",
          "macrosInSelect": false,
          "selectItems": [
            {
              "value": "denied",
              "displayValue": "Denied"
            },
            {
              "value": "granted",
              "displayValue": "Granted"
            }
          ],
          "simpleValueType": true
        },
        "isUnique": false
      }
    ],
    "newRowButtonText": "Add region"
  },
  {
    "type": "TEXT",
    "name": "waitForUpdate",
    "displayName": "Wait for update",
    "simpleValueType": true,
    "defaultValue": 500,
    "valueUnit": "ms",
    "valueValidators": [
      {
        "type": "NON_NEGATIVE_NUMBER"
      }
    ],
    "help": "How long Google tags wait for the banner to report a choice before they use the default state. 500 ms is recommended."
  },
  {
    "type": "CHECKBOX",
    "name": "adsDataRedaction",
    "checkboxText": "Redact ads data when ad_storage is denied",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Google Ads and Floodlight tags drop ad click identifiers and use cookieless requests when the visitor has not accepted marketing."
  },
  {
    "type": "CHECKBOX",
    "name": "urlPassthrough",
    "checkboxText": "Pass ad click information through URLs",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Keeps ad click information in link parameters between pages when cookies are denied. Improves measurement but adds parameters to your URLs."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// GTM sandboxed JavaScript. Runs on "Consent Initialization - All Pages".
// Only ES5-style syntax plus const/let; no arrow functions, template strings or spread.
const callInWindow = require('callInWindow');
const encodeUriComponent = require('encodeUriComponent');
const getCookieValues = require('getCookieValues');
const gtagSet = require('gtagSet');
const injectScript = require('injectScript');
const logToConsole = require('logToConsole');
const makeInteger = require('makeInteger');
const setDefaultConsentState = require('setDefaultConsentState');
const updateConsentState = require('updateConsentState');

const SCRIPT_BASE = 'https://cookieconsent.nitea.ai/s/';
const COOKIE_NAME = 'nc_consent';
const CATEGORIES = ['functional', 'analytics', 'marketing'];
// Must match CATEGORY_TO_GCM in packages/shared/src/categories.ts
const CATEGORY_TO_GCM = {
  functional: ['functionality_storage', 'personalization_storage'],
  analytics: ['analytics_storage'],
  marketing: ['ad_storage', 'ad_user_data', 'ad_personalization']
};

const toGcmState = function (granted) {
  const state = { security_storage: 'granted' };
  CATEGORIES.forEach(function (category) {
    CATEGORY_TO_GCM[category].forEach(function (type) {
      state[type] = granted[category] === true ? 'granted' : 'denied';
    });
  });
  return state;
};

// Same format as packages/shared/src/consent-cookie.ts
const parseConsentCookie = function (value) {
  if (!value) return null;
  const fields = {};
  value.split('&').forEach(function (pair) {
    const index = pair.indexOf('=');
    if (index > 0) fields[pair.substring(0, index)] = pair.substring(index + 1);
  });
  if (fields.ver !== '1' || !fields.id) return null;
  return {
    functional: fields.functional === '1',
    analytics: fields.analytics === '1',
    marketing: fields.marketing === '1'
  };
};

const parseRegions = function (value) {
  const regions = [];
  if (!value) return regions;
  value.split(',').forEach(function (region) {
    const trimmed = region.trim().toUpperCase();
    if (trimmed) regions.push(trimmed);
  });
  return regions;
};

// 1. Defaults, before any other tag fires.
gtagSet({
  ads_data_redaction: data.adsDataRedaction === true,
  url_passthrough: data.urlPassthrough === true
});

const parsedWait = makeInteger(data.waitForUpdate);
const waitForUpdate = parsedWait >= 0 ? parsedWait : 500;
let hasGlobalDefault = false;

(data.defaultSettings || []).forEach(function (row) {
  const state = toGcmState({
    functional: row.functional === 'granted',
    analytics: row.analytics === 'granted',
    marketing: row.marketing === 'granted'
  });
  state.wait_for_update = waitForUpdate;
  const regions = parseRegions(row.region);
  if (regions.length > 0) state.region = regions;
  else hasGlobalDefault = true;
  setDefaultConsentState(state);
});

if (!hasGlobalDefault) {
  const state = toGcmState({});
  state.wait_for_update = waitForUpdate;
  setDefaultConsentState(state);
}

// 2. A choice made on an earlier page view applies immediately.
const stored = parseConsentCookie(getCookieValues(COOKIE_NAME)[0]);
if (stored) updateConsentState(toGcmState(stored));

// 3. Load the banner; it reports new choices back through the listener.
const scriptUrl = SCRIPT_BASE + encodeUriComponent(data.siteId) + '.js?gtm=1';

injectScript(
  scriptUrl,
  function () {
    callInWindow('NiteaConsent._registerGtm', function (consent) {
      updateConsentState(toGcmState(consent.categories));
    });
    data.gtmOnSuccess();
  },
  function () {
    logToConsole('Nitea Consent: could not load ' + scriptUrl);
    data.gtmOnFailure();
  },
  scriptUrl
);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_user_data"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_personalization"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "personalization_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "security_storage"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "cookieNames",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "nc_consent"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cookieconsent.nitea.ai/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "NiteaConsent._registerGtm"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "write_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "ads_data_redaction"
              },
              {
                "type": 1,
                "string": "url_passthrough"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Sets a denied global default and loads the banner
  code: |-
    runCode(mockData);
    assertApi('setDefaultConsentState').wasCalledWith({
      security_storage: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      analytics_storage: 'denied',
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      wait_for_update: 500
    });
    assertApi('updateConsentState').wasNotCalled();
    assertApi('injectScript').wasCalled();
    assertApi('gtmOnSuccess').wasCalled();
- name: Applies a stored choice before the banner loads
  code: |-
    mock('getCookieValues', function () {
      return ['ver=1&id=abcdefgh1234&cv=1&ts=1&necessary=1&functional=0&analytics=1&marketing=0'];
    });
    runCode(mockData);
    assertApi('updateConsentState').wasCalledWith({
      security_storage: 'granted',
      functionality_storage: 'denied',
      personalization_storage: 'denied',
      analytics_storage: 'granted',
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied'
    });
- name: Reports failure when the banner cannot load
  code: |-
    mock('injectScript', function (url, onSuccess, onFailure) { onFailure(); });
    runCode(mockData);
    assertApi('gtmOnFailure').wasCalled();
setup: |-
  const mockData = {
    siteId: 'abc123def456',
    defaultSettings: [],
    waitForUpdate: '500',
    adsDataRedaction: true,
    urlPassthrough: false
  };
  mock('getCookieValues', function () { return []; });
  mock('injectScript', function (url, onSuccess) { onSuccess(); });
  mock('callInWindow', function () {});


___NOTES___

Generated by packages/gtm-template/build.mjs. Edit src/sandbox.js and rebuild instead of editing this file.
