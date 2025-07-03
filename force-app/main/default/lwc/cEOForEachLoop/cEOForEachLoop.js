import { LightningElement } from 'lwc';

export default class CEOForEachLoop extends LightningElement {
    CEOList;
    ShowListHandler(){
this.CEOList = [

    {
        id : 1,
        name :  'Mark Benrioff',
        title : 'CEO of Salesforce',
    
    },
    {
        id : 2,
        name : 'Sundar Pichai',
        title : 'CEO of Google',
    },
    {
        id : 3,
        name : 'Mark Zuckerberg',
        title : 'CEO of Amazon',
    },
]
    }
        
    


}