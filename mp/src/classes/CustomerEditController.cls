public with sharing class CustomerEditController {
  public Account account {set;get;}
  private String id {get;set;}
  public CustomerEditController(ApexPages.StandardController controller) {
    account = getAccount();
    id = System.currentPageReference().getParameters().get('id');
  }
  public PageReference save() {

    try {
      System.debug(account);
      upsert account;
    } Catch (DMLException e) {
      ApexPages.addMessages(e);
      return null;
    }

    //return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
    return new PageReference('/apex/CustomerInfo?id='+id);
  }

  // takes user back to main record
  public PageReference cancel() {
    //return new PageReference('/'+ApexPages.currentPage().getParameters().get('id'));
    //return new PageReference(ApexPages.currentPage().getUrl());
    return new PageReference('/apex/CustomerInfo?id='+id);
  }

  public Account getAccount() {
      return [SELECT Id, AccountNumber, Name, type, industry, phone, fax, website, BillingCity  FROM Account
              WHERE Id = :System.currentPageReference().getParameters().get('id')];
  }

}