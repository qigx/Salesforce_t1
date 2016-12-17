public with sharing class CustomersController {
   public list<Account >  customers {get;set;}
   public string strName {get;set;}
   public CustomersController(ApexPages.StandardController controller) {
   }
   public PageReference search(){
     string searchQuery='select id,name,type,industry,phone from Account where type=\'Other\' and industry=\'Other\' and name like \'%'+strName+'%\' Limit 100';
     customers= Database.query(searchQuery);
     return null;
   }
   public PageReference clear(){
     customers.clear();
     strName = '';
     return null;
   }

  public PageReference save() {

    try {
      update customers;
    } Catch (DMLException e) {
      ApexPages.addMessages(e);
      return null;
    }

    //return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
    return new PageReference(ApexPages.currentPage().getUrl());
  }

  // takes user back to main record
  public PageReference cancel() {
    //return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
    return new PageReference(ApexPages.currentPage().getUrl());
  }


}