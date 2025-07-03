import { LightningElement } from 'lwc';

export default class TaskTimeCounter extends LightningElement {
     showStartBtn = true;
     timeVal = '0 : 0 : 0 : 0';
    timeIntervalInstance;
    totalMilliseconds = 0;
    startHandler(event){
        this.showStartBtn = false;
        var parentThis = this;

        // Run timer code in every 100 milliseconds
        this.timeIntervalInstance = setInterval(function() {

            // Time calculations for hours, minutes, seconds and milliseconds
            var hours = Math.floor((parentThis.totalMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((parentThis.totalMilliseconds % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((parentThis.totalMilliseconds % (1000 * 60)) / 1000);
            var milliseconds = Math.floor((parentThis.totalMilliseconds % (1000)));
            
            // Output the result in the timeVal variable
            parentThis.timeVal = hours + "  "+ " : "  + "  " + minutes+ "  "+ " : "  + "  " + seconds + "  "+ " : "  + "  " + milliseconds;   
            
            parentThis.totalMilliseconds += 45;
        }, 45);
    }

    stopHandler(event){
        this.showStartBtn = true;
        clearInterval(this.timeIntervalInstance);
    }
    resetHandler(event){
    this.showStartBtn = true;
    this.timeVal = '0 : 0 : 0 : 0';
    this.totalMilliseconds = 0;
    clearInterval(this.timeIntervalInstance);
}        }