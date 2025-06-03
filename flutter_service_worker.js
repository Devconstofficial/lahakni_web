'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "24fdb00cd3e622d83575c015da4669b7",
"version.json": "f97c944844000670cb57adeec35684d9",
"index.html": "a544c0e3e4d21aaa0d8988494540f1a0",
"/": "a544c0e3e4d21aaa0d8988494540f1a0",
"main.dart.js": "1d9299f4bb453820a9bb6dfa5f01f928",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "923fbf0dbf3c1c287528c6bd15b430d2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e2dc9bdd9c130bb98c0c5c9989680ff1",
"assets/AssetManifest.json": "7c43a8e17a98b6da93097fca0c101abe",
"assets/NOTICES": "3002398385b9fbd9622ba8b65dfd56ff",
"assets/FontManifest.json": "dabe6d75f8cc4f9a16dbe09d2cf4fc21",
"assets/AssetManifest.bin.json": "002f4e7f40b38457d8b0f1311b58bbc6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/quill_native_bridge_linux/assets/xclip": "d37b0dbbc8341839cde83d351f96279e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b2bf16ef03f41b0b116d76d4631fa597",
"assets/fonts/MaterialIcons-Regular.otf": "d8c5952c18fbc023798dfada07462493",
"assets/assets/images/car2.png": "f85259d226f0be0fa45bb8399a5cd6ca",
"assets/assets/images/car3.png": "e430b5eda53e61cbaf0783638c5a9a43",
"assets/assets/images/car1.png": "45c56a589e88341892e563f248d7a4ad",
"assets/assets/images/dots_hori.svg": "c4e2832f2440e2173bc8e7df756031cf",
"assets/assets/images/userImage.png": "792e1ebafa62b180304e74346a815755",
"assets/assets/images/car_front.png": "0a0a709f55b366113f21f4016da399b4",
"assets/assets/images/dots_vertical.svg": "14b087f0dfc7623aa9a02d23ef1226c7",
"assets/assets/images/car_image.png": "6e640f2b8ae6af5bcd8a3e0615b21581",
"assets/assets/images/logo_full.png": "c90ecf3f30d53953a18fd91dfb58b268",
"assets/assets/images/person.png": "4be4f9dc127f12e615042ec629e61298",
"assets/assets/images/play_image.svg": "9eb813331dba97805bad87c1185a274a",
"assets/assets/images/popup.png": "f55218cdd3e12e56f3dbaa6b13eead76",
"assets/assets/images/car_back.png": "0451223de3b160042d46c6574e263e6b",
"assets/assets/images/logo.png": "923fbf0dbf3c1c287528c6bd15b430d2",
"assets/assets/images/line.png": "25fe005861a47ffaef9116bbff0c2e33",
"assets/assets/images/auth_image1.png": "ef03fdb6d821722f9cf4c1a4580deb78",
"assets/assets/images/auth_image2.png": "b5755953120de12c8e4592a0b7b7e274",
"assets/assets/icons/search.svg": "143ec951a8740a5c0073afa7f1639042",
"assets/assets/icons/driver.svg": "6091defd22ec4f0d0ba8a795154e6aee",
"assets/assets/icons/user.svg": "9a36d87a38b1fb8d4e6687da48bac0cc",
"assets/assets/icons/logout.svg": "bcc6124a16290d582a6f6d87681ce642",
"assets/assets/icons/down.svg": "1397d72759689fa9d20a2ca6648d333a",
"assets/assets/icons/calender.png": "cc723adb069dde674cd76393832cde9a",
"assets/assets/icons/up.svg": "b8be89d12ad175d43a2aa051024b059d",
"assets/assets/icons/lock.svg": "884b1ba4f86e9871bf469be2e9d3fc1e",
"assets/assets/icons/doubleUser.svg": "d103a49d1e5f1a531f3cb0ebe82310d4",
"assets/assets/icons/mail.svg": "592c6aa9f5fedd2f92ac32977931efd9",
"assets/assets/icons/gallery.svg": "4089bfacc02306018bee94e22deedab9",
"assets/assets/icons/galleryIcon.png": "a2b019c661dc1d93ddd4b3bf7c8cfe3c",
"assets/assets/icons/car1.svg": "a5a405af08a6a29c0b3c9e46920abe7c",
"assets/assets/icons/cursor.svg": "c712fdfe741bbfd7027f23e418f67f3f",
"assets/assets/icons/check.svg": "9287ade5c3a4fa689af42433b7654f16",
"assets/assets/icons/setting.svg": "ed403a02e70e9cb62b5ca5446ee3eaba",
"assets/assets/icons/notification.svg": "3b5c5f7a23a55ca4ded5313786a9218a",
"assets/assets/icons/filter.png": "32123ad3ba507ce822df6209e844836d",
"assets/assets/icons/docImage.png": "042d74cf7b35bead42dcf9c531cd705c",
"assets/assets/icons/location.svg": "231bea851b772938748f8e4ca8da0a60",
"assets/assets/icons/car.svg": "ef4377fd165861f1283a0535aaaa88c7",
"assets/assets/icons/star.png": "7547f388d900b184464d45327ec034da",
"assets/assets/icons/menu.svg": "8c98f913fd2835c23ee268554583cf65",
"assets/assets/fonts/Gilroy-Regular.ttf": "31ff7c1a62a300dbbf9656b4ba14a0d5",
"assets/assets/fonts/Gilroy-SemiBold.ttf": "a5cf732b15078843b237bd58f3ed44cd",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
