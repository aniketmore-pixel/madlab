self.addEventListener('install', event => {
    console.log('Service worker installing...');
    event.waitUntil(
        caches.open('product-cache-v1').then(cache => {
            return cache.addAll([
                '/',
                '/icons/icon-large.png',
                '/icons/icon-small.png',
                '/images/laptop1.jpg',
                '/images/laptop2.webp',
                '/images/phone1.jpg',
                '/images/phone2.jpg',
                '/index.html',
                '/manifest.json',
                '/service-worker.js',
                '/styles.css'
            ]);
        })
    );
})