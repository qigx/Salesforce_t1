public with sharing class CustomerInfoController {
  Account account;
  String id {get;set;}
  public CustomerInfoController(ApexPages.StandardController controller) {
  	id = ApexPages.currentPage().getParameters().get('id');
  	account = getAccount();
  }

  public PageReference del() {
    try {
      delete account;
    } Catch (DMLException e) {
      ApexPages.addMessages(e);
      return null;
    }
    return new PageReference('/apex/CustomerList');
  }

  public Account getAccount() {
      return [SELECT Id, AccountNumber, Name, type, industry, phone, fax, website FROM Account
              WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
  }

}