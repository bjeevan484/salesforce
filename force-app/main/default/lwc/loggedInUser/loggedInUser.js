// loggedInUser.js
import { LightningElement, track, wire } from 'lwc';
import getUserInfo from '@salesforce/apex/loggedInUser.getUserInfo';

export default class LoggedInUser extends LightningElement {
    @track user;

    @wire(getUserInfo)
    wiredUser({ error, data }) {
        if (data) {
            console.log('User data:', data); // Add this line
            this.user = data;
        } else if (error) {
            console.error(error);
        }
    }
}
