@/* =================== */ ;
@/* === Forge 1.4.4 === */ ;
@/* =================== */ ;
@/* Generates the draft of the application */ ;

 clear ;
 set ACCEPT_DEFAULTS true ;

@/* ================ */ ;
@/* Create a project */ ;
@/* ================ */ ;

 new-project --named secondhandee --topLevelPackage de.sugaryourcoffee.secondhandee --projectFolder secondhandee --type war --createMain ;

@/* ========================== */ ;
@/* Create a persistence layer */ ;
@/* ========================== */ ;

 persistence setup --provider HIBERNATE --container WILDFLY --named secondhandeePU ;

@/* ================== */ ;
@/* Create a validator */ ;
@/* ================== */ ;

 validation setup --provider HIBERNATE_VALIDATOR;

@/* =================== */ ;
@/* Create the entities */ ;
@/* =================== */ ;

 entity --named User;
 field string --named surname;
 field string --named givenName;
 field string --named email;
 field string --named phone;
 field string --named street;
 field string --named zipCode;
 field string --named town;
 field string --named country;
 field boolean --named admin;
 field temporal --named createdAt --type TIMESTAMP;
 field temporal --named updatedAt --type TIMESTAMP;

 constraint NotNull --onProperty surname;
 constraint NotNull --onProperty givenName;
 constraint NotNull --onProperty email;
 constraint NotNull --onProperty phone;
 constraint NotNull --onProperty street;
 constraint NotNull --onProperty zipCode;
 constraint NotNull --onProperty town;
 constraint NotNull --onProperty country;

 entity --named Event;
 field temporal --named eventDate --type TIMESTAMP;
 field string --named location;
 field int --named maxLists;
 field int --named maxItemsPerList;
 field number --named deduction --type java.lang.Double;
 field number --named fee --type java.lang.Double;
 field number --named provision --type java.lang.Double;
 field boolean --named sold;
 field temporal --named createdAt --type TIMESTAMP;
 field temporal --named updatedAt --type TIMESTAMP;

 constraint NotNull --onProperty eventDate;
 constraint NotNull --onProperty location;
 constraint DecimalMin --onProperty maxLists --min 1;
 constraint DecimalMin --onProperty maxItemsPerList --min 1;
 constraint DecimalMin --onProperty deduction --min 1;
 constraint DecimalMin --onProperty fee --min 1;
 constraint DecimalMin --onProperty provision --min 1;

 entity --named ItemList;
 field int --named listNumber;
 field string --named remarks;
 field string --named container;
 field temporal --named acceptanceDate --type TIMESTAMP;
 field temporal --named accountanceDate --type TIMESTAMP;
 field temporal --named createdAt --type TIMESTAMP;
 field temporal --named updatedAt --type TIMESTAMP;

 constraint DecimalMin --onProperty listNumber --min 1;
 constraint NotNull --onProperty container;

 entity --named Item;
 field int --named itemNumber;
 field string --named description;
 field string --named size;
 field number --named price --type java.lang.Double;
 field boolean --named sold;
 field temporal --named createdAt --type TIMESTAMP;
 field temporal --named updatedAt --type TIMESTAMP;

 constraint DecimalMin --onProperty itemNumber --min 1;
 constraint NotNull --onProperty description;
 constraint NotNull --onProperty size;
 constraint NotNull --onProperty price;

 entity --named Selling;
 field int --named sellingNumber;
 field temporal --named sellingDate --type TIMESTAMP;
 field temporal --named createdAt --type TIMESTAMP;
 field temporal --named updatedAt --type TIMESTAMP;

 constraint DecimalMin --onProperty sellingNumber --min 1;


@/* ================== */ ;
@/* Associate entities */ ;
@/* ================== */ ;

 pick-up ../User.java;
 field oneToMany --named itemLists --fieldType de.sugaryourcoffee.secondhandee.model.ItemList --inverseFieldName seller;
 
 pick-up ../Event.java;
 field oneToMany --named itemLists --fieldType de.sugaryourcoffee.secondhandee.model.ItemList --inverseFieldName event;
 field oneToMany --named sellings --fieldType de.sugaryourcoffee.secondhandee.model.Selling --inverseFieldName event;

 pick-up ../ItemList.java;
 field oneToMany --named items --fieldType de.sugaryourcoffee.secondhandee.model.Item --inverseFieldName itemList;

 pick-up ../Selling.java;
 field oneToMany --named items --fieldType de.sugaryourcoffee.secondhandee.model.Item --inverseFieldName selling;

@/* ================ */;
@/* == Setup REST == */;
@/* ================ */;

 rest setup;

@/* =========================== */;
@/* == Create REST endpoints == */;
@/* =========================== */;

 rest endpoint-from-entity ~.model.*;

@/* ==================== */;
@/* == Setting up JSF == */;
@/* ==================== */;

 @/* Turn Java project into a Web project */;
 scaffold setup --scaffoldType faces;

 @/* Create UI for all entities */;
 scaffold from-entity ~.model.*;


