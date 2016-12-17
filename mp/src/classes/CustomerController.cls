public with sharing class CustomerController {
  public Account account {get;set;}
  public CustomerController(ApexPages.StandardController controller) {
    account = new Account();
  }
  public PageReference save() {

    try {
      upsert account;
    } Catch (DMLException e) {
      ApexPages.addMessages(e);
      return null;
    }

    //return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
    return new PageReference('/apex/CustomerList');
  }

  // takes user back to main record
  public PageReference cancel() {
    //return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
    //return new PageReference(ApexPages.currentPage().getUrl());
    return new PageReference('/apex/CustomerList');
  }


}