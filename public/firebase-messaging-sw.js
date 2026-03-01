importScripts('https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js');
let config = {
        apiKey: "AIzaSyBglalD2ZYNHFubRIJsZIQNXem7w4twdfI",
        authDomain: "food-king-8019b.firebaseapp.com",
        projectId: "food-king-8019b",
        storageBucket: "food-king-8019b.firebasestorage.app",
        messagingSenderId: "368617750753",
        appId: "1:368617750753:web:487abd08cfe9ceb47bb7a0",
        measurementId: "G-37W45EPY79",
 };
firebase.initializeApp(config);
const messaging = firebase.messaging();
messaging.onBackgroundMessage((payload) => {
    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
        icon: '/images/default/firebase-logo.png'
    };
    self.registration.showNotification(notificationTitle, notificationOptions);
});
