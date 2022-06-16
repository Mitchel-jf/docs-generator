import initFirebase from '../src/firebase';
import firebaseAdmin from 'firebase-admin';

before(function () {
    if (firebaseAdmin.apps.length === 0) {
        initFirebase();
    }
});