importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.15.5/firebase-messaging.js");

//Using singleton breaks instantiating messaging()
// App firebase = FirebaseWeb.instance.app;


firebase.initializeApp({
    apiKey: "AIzaSyCIMGV2_UKJL_FVMUXzBtZXslTTwpAOVEY",
    authDomain: "perfect-registration-cbfda.firebaseapp.com",
    projectId: "perfect-registration-cbfda",
    storageBucket: "perfect-registration-cbfda.appspot.com",
    messagingSenderId: "495348177232",
    appId: "1:495348177232:web:41faaf2ab28d13070ef455",
    measurementId: "G-HNEN5BHVCY"
});

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});